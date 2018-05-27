import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/shared/widgets/text_field.dart';
import 'package:flutter_playground/shared/widgets/dropdown_field.dart';
import 'package:flutter_playground/shared/widgets/switch_field.dart';
import 'package:flutter_playground/vehicles/models/vehicle.dart';
import 'package:flutter_playground/vehicles/models/vehicle_type.dart';
import 'package:flutter_playground/vehicles/keys.dart';

class VehicleScreen extends StatefulWidget {
  final bool isUpdating;
  final bool isLoading;
  final Function addVehicle;
  final Function updateVehicle;
  final Vehicle vehicle;

  VehicleScreen({
    @required this.isUpdating,
    @required this.isLoading,
    @required this.addVehicle,
    @required this.updateVehicle,
    this.vehicle,
  });

  @override
  VehicleScreenState createState() => VehicleScreenState();
}

class VehicleScreenState extends State<VehicleScreen> {
  Vehicle vehicle;

  @override
  void initState() {
    super.initState();
    vehicle = !widget.isUpdating
        ? Vehicle(operatorId: '59ed7188-4389-476b-849c-48ac85318967')
        : widget.vehicle.copyWith(
            registration: widget.vehicle.registration,
            odometer: widget.vehicle.odometer,
            type: widget.vehicle.type,
            operatorId: widget.vehicle.operatorId,
            roadCharges: widget.vehicle.roadCharges,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.isUpdating ? "Edit vehicle" : "Add vehicle")),
      body: widget.isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: FormKeys.editVehicle,
                autovalidate: false,
                child: ListView(
                  children: [
                    TextInputField(
                      key: FieldKeys.registration,
                      initialValue: vehicle.registration,
                      hint: 'ABC123',
                      label: 'Registration',
                      autofocus: !widget.isUpdating,
                      enabled: !widget.isUpdating,
                      onSaved: (val) =>
                          vehicle = vehicle.copyWith(registration: val),
                      validator: (val) => val.trim().isEmpty
                          ? 'Please enter a valid registration number.'
                          : null,
                    ),
                    DropdownField(
                      key: FieldKeys.vehicleType,
                      itemMap: vehicleTypeMap,
                      initialValue: vehicle.type,
                      hint: 'Select vehicle type',
                      onSaved: (val) => vehicle = vehicle.copyWith(type: val),
                    ),
                    _buildOdometerField(),
                  ],
                ),
              ),
            ),
      floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildOdometerField() {
    return Stack(
      children: [
        TextInputField(
          key: FieldKeys.odometer,
          initialValue:
              vehicle.odometer != null ? vehicle.odometer.toString() : "",
          label: 'Odometer (km)',
          keyboardType: TextInputType.number,
          onSaved: (val) =>
              vehicle = vehicle.copyWith(odometer: int.parse(val)),
        ),
        Positioned(
          child: Text(
            'Required',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
            ),
          ),
          top: 23.0,
          right: 0.0,
        ),
        Positioned(
          child: Container(
            child: SwitchField(
              key: FieldKeys.roadCharges,
              initialValue: vehicle.roadCharges == true,
              onSaved: (val) => vehicle = vehicle.copyWith(roadCharges: val),
            ),
            width: 65.0,
          ),
          right: 0.0,
          top: 20.0,
        ),
      ],
    );
  }

  Widget _buildFab(BuildContext context) {
    return FloatingActionButton(
      tooltip: widget.isUpdating ? 'Update vehicle' : 'Add vehicle',
      child: Icon(widget.isUpdating ? Icons.check : Icons.add),
      onPressed: () async {
        if (widget.isLoading) return;
        final form = FormKeys.editVehicle.currentState;
        if (!form.validate()) return;
        form.save();
        widget.isUpdating
            ? await widget.updateVehicle(vehicle)
            : await widget.addVehicle(vehicle);
        Navigator.pop(context);
      },
    );
  }
}

Map<String, VehicleType> vehicleTypeMap = {
  'large_passenger_service': VehicleType(
    id: 'lpsv',
    title: 'Large passenger service',
  ),
  'goods_service': VehicleType(
    id: 'gs',
    title: 'Goods service',
  ),
  'combination': VehicleType(
    id: 'c',
    title: 'Combination',
  ),
  'heavy_motor': VehicleType(
    id: 'hm',
    title: 'Heavy motor',
  ),
  'vintage_heavy': VehicleType(
    id: 'vh',
    title: 'Vintage heavy',
  ),
  'taxi': VehicleType(
    id: 't',
    title: 'Taxi',
  ),
  'school_bus': VehicleType(
    id: 'sb',
    title: 'School bus',
  ),
  'mobile_crane': VehicleType(
    id: 'mc',
    title: 'Mobile crane',
  ),
  'vehicle_recovery_service': VehicleType(
    id: 'vrs',
    title: 'Vehicle recovery service',
  ),
  'small_passenger_service': VehicleType(
    id: 'spsv',
    title: 'Small passenger service',
  ),
  'emergency_service': VehicleType(
    id: 'es',
    title: 'Emergency service',
  ),
  'trailer': VehicleType(
    id: 'tr',
    title: 'Trailer',
  ),
};

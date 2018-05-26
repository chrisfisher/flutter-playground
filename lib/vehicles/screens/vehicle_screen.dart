import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/shared/widgets/text_field.dart';
import 'package:flutter_playground/shared/widgets/dropdown_field.dart';
import 'package:flutter_playground/shared/widgets/switch_field.dart';
import 'package:flutter_playground/vehicles/models/vehicle.dart';
import 'package:flutter_playground/vehicles/models/vehicle_type.dart';
import 'package:flutter_playground/vehicles/keys.dart';
import 'package:uuid/uuid.dart';

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
  String registration;
  String vehicleType;
  int odometer;
  bool roadUserCharges;

  @override
  void initState() {
    final vehicle = widget.vehicle;
    registration = vehicle != null ? vehicle.registration : "";
    vehicleType = vehicle != null ? vehicle.type : null;
    odometer = vehicle != null ? vehicle.odometer : 0;
    roadUserCharges = vehicle != null ? vehicle.roadUserCharges : false;
    super.initState();
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
                      initialValue: registration,
                      hint: 'ABC123',
                      label: 'Registration',
                      autofocus: true,
                      onSaved: (val) => registration = val,
                      validator: (val) => val.trim().isEmpty
                          ? 'Please enter a valid registration number.'
                          : null,
                    ),
                    DropdownField(
                      key: FieldKeys.vehicleType,
                      itemMap: vehicleTypeMap,
                      initialValue: vehicleType != null ? vehicleType : null,
                      hint: 'Select vehicle type',
                      onSaved: (val) => vehicleType = val,
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
          initialValue: odometer != null ? odometer.toString() : '',
          label: 'Odometer (km)',
          keyboardType: TextInputType.number,
          onSaved: (val) => odometer = int.parse(val),
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
              key: FieldKeys.roadUserCharges,
              initialValue: roadUserCharges == true,
              onSaved: (val) => roadUserCharges = val,
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
        final newVehicle = Vehicle(
          id: widget.isUpdating ? widget.vehicle.id : Uuid().v4(),
          odometer: odometer,
          registration: registration,
          roadUserCharges: roadUserCharges,
          type: vehicleType,
          operatorId: '59ed7188-4389-476b-849c-48ac85318967',
        );
        widget.isUpdating
            ? await widget.updateVehicle(newVehicle)
            : await widget.addVehicle(newVehicle);
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/shared/widgets/text_field.dart';
import 'package:flutter_playground/shared/widgets/dropdown_field.dart';
import 'package:flutter_playground/shared/widgets/switch_field.dart';
import 'package:flutter_playground/vehicles/models.dart';
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
  String registration;
  VehicleType vehicleType;
  int odometer;
  bool odometerRequired;

  @override
  void initState() {
    final vehicle = widget.vehicle;
    registration = vehicle != null ? vehicle.registration : "";
    vehicleType = vehicle != null ? vehicle.type : null;
    odometer = vehicle != null ? vehicle.odometer : 0;
    odometerRequired = vehicle != null ? vehicle.odometerRequired : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.isUpdating ? "Edit vehicle" : "Add vehicle")),
      body: Padding(
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
                items: vehicleTypes,
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
              key: FieldKeys.odometerRequired,
              initialValue: odometerRequired == true,
              onSaved: (val) => odometerRequired = val,
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
          odometer: odometer,
          registration: registration,
          odometerRequired: odometerRequired,
          type: vehicleType,
        );
        final success = widget.isUpdating
            ? await widget.updateVehicle(newVehicle)
            : await widget.addVehicle(newVehicle);
        if (success) {
          Navigator.pop(context);
        }
      },
    );
  }
}

List<VehicleType> vehicleTypes = [
  VehicleType(id: 't', title: 'Taxi'),
  VehicleType(id: 'spsv', title: 'Small passenger service'),
  VehicleType(id: 'lpsv', title: 'Large passenger service'),
  VehicleType(id: 'mc', title: 'Mobile crane'),
  VehicleType(id: 'sb', title: 'School bus'),
  VehicleType(id: 'vrs', title: 'Vehicle recovery service'),
  VehicleType(id: 'vh', title: 'Vintage heavy'),
  VehicleType(id: 'hm', title: 'Heavy motor'),
  VehicleType(id: 'gs', title: 'Goods service'),
  VehicleType(id: 'c', title: 'Combination'),
  VehicleType(id: 'es', title: 'Emergency service'),
];

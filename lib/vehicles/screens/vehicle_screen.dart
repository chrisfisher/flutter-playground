import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_playground/shared/widgets/text_field.dart';
import 'package:flutter_playground/shared/widgets/dropdown_field.dart';
import 'package:flutter_playground/shared/widgets/switch_field.dart';
import 'package:flutter_playground/vehicles/models.dart';
import 'package:flutter_playground/vehicles/keys.dart';
import 'package:flutter_playground/vehicles/selectors.dart';
import 'package:flutter_playground/models.dart';

class VehicleScreen extends StatelessWidget {
  final Vehicle vehicle;
  final bool isUpdating;

  VehicleScreen({
    @required this.vehicle,
    @required this.isUpdating,
  }) : super(key: ScreenKeys.vehicle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isUpdating ? "Edit vehicle" : "Add vehicle")),
      body: Padding(
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
                autofocus: true,
                onSaved: (val) => vehicle.registration = val,
                validator: (val) => val.trim().isEmpty
                    ? 'Please enter a valid registration number.'
                    : null,
              ),
              DropdownField(
                key: FieldKeys.vehicleType,
                items: vehicleTypes,
                initialValue: vehicle.type != null ? vehicle.type : null,
                hint: 'Select vehicle type',
                onSaved: (val) => vehicle.type = val,
              ),
              _buildOdometerField(),
            ],
          ),
        ),
      ),
      floatingActionButton: ScopedModelDescendant<AppModel>(
          builder: (context, child, model) => _buildFab(context, model)),
    );
  }

  Widget _buildOdometerField() {
    return Stack(
      children: [
        TextInputField(
          key: FieldKeys.odometer,
          initialValue:
              vehicle.odometer != null ? vehicle.odometer.toString() : '',
          label: 'Odometer (km)',
          keyboardType: TextInputType.number,
          onSaved: (val) => vehicle.odometer = int.parse(val),
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
              initialValue: vehicle.odometerRequired == true,
              onSaved: (val) => vehicle.odometerRequired = val,
            ),
            width: 65.0,
          ),
          right: 0.0,
          top: 20.0,
        ),
      ],
    );
  }

  Widget _buildFab(BuildContext context, AppModel model) {
    return FloatingActionButton(
      tooltip: isUpdating ? 'Update vehicle' : 'Add vehicle',
      child: Icon(isUpdating ? Icons.check : Icons.add),
      onPressed: () async {
        if (getIsPosting(model)) return;
        final form = FormKeys.editVehicle.currentState;
        if (!form.validate()) return;
        form.save();
        final success = isUpdating
            ? await model.vehicles.updateVehicle(vehicle)
            : await model.vehicles.addVehicle(vehicle);
        if (success) {
          Navigator.pop(context);
        }
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/shared/widgets/text_field.dart';
import 'package:flutter_playground/operators/models/vehicle_operator.dart';
import 'package:flutter_playground/operators/keys.dart';

class OperatorScreen extends StatefulWidget {
  final bool isLoading;
  final Function addOperator;
  final VehicleOperator vehicleOperator;

  OperatorScreen({
    @required this.isLoading,
    @required this.addOperator,
    @required this.vehicleOperator,
  });

  @override
  OperatorScreenState createState() => OperatorScreenState();
}

class OperatorScreenState extends State<OperatorScreen> {
  VehicleOperator vehicleOperator;

  @override
  void initState() {
    super.initState();
    vehicleOperator = VehicleOperator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add operator")),
      body: widget.isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: FormKeys.addOperator,
                autovalidate: false,
                child: ListView(
                  children: [
                    TextInputField(
                      key: FieldKeys.firstName,
                      initialValue: vehicleOperator.firstName,
                      hint: 'John',
                      label: 'First name',
                      autofocus: true,
                      onSaved: (val) => vehicleOperator =
                          vehicleOperator.copyWith(firstName: val),
                      validator: (val) => val.trim().isEmpty
                          ? 'Please enter a valid name.'
                          : null,
                    ),
                    TextInputField(
                      key: FieldKeys.familyName,
                      initialValue: vehicleOperator.familyName,
                      hint: 'Smith',
                      label: 'Family name',
                      onSaved: (val) => vehicleOperator =
                          vehicleOperator.copyWith(familyName: val),
                      validator: (val) => val.trim().isEmpty
                          ? 'Please enter a valid surname.'
                          : null,
                    ),
                    TextInputField(
                      key: FieldKeys.email,
                      initialValue: vehicleOperator.email,
                      hint: 'john.smith@gmail.com',
                      label: 'Email',
                      onSaved: (val) => vehicleOperator =
                          vehicleOperator.copyWith(email: val),
                      validator: (val) => val.trim().isEmpty
                          ? 'Please enter a email address.'
                          : null,
                    ),
                    TextInputField(
                      key: FieldKeys.companyName,
                      initialValue: vehicleOperator.companyName,
                      hint: 'John Smith Trucking',
                      label: 'Company name',
                      onSaved: (val) => vehicleOperator =
                          vehicleOperator.copyWith(companyName: val),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildFab(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add operator',
      child: Icon(Icons.add),
      onPressed: () async {
        if (widget.isLoading) return;
        final form = FormKeys.addOperator.currentState;
        if (!form.validate()) return;
        form.save();
        await widget.addOperator(vehicleOperator);
        Navigator.pop(context);
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/vehicles/screens/vehicle_screen.dart';
import 'package:flutter_playground/vehicles/selectors.dart';

class VehicleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vehicles")),
      body: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) {
          return ListView.builder(
            itemCount: getVehicles(model).length,
            itemBuilder: (context, index) {
              var vehicle = getVehicles(model)[index];
              return ListTile(
                title: Text(vehicle.registration),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VehicleScreen(
                            vehicle: vehicle,
                            isUpdating: true,
                          ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/vehicles/add");
        },
        tooltip: 'Add vehicle',
        child: Icon(Icons.add),
      ),
    );
  }
}

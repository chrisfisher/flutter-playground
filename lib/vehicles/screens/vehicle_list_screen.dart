import 'package:flutter/material.dart';
import 'package:flutter_playground/vehicles/models.dart';
import 'package:flutter_playground/vehicles/containers/vehicle_container.dart';

class VehicleListScreen extends StatefulWidget {
  final List<Vehicle> vehicles;
  final bool isLoading;
  final Function loadVehicles;

  VehicleListScreen({
    @required this.vehicles,
    @required this.isLoading,
    @required this.loadVehicles,
  });

  @override
  VehicleListScreenState createState() => VehicleListScreenState();
}

class VehicleListScreenState extends State<VehicleListScreen> {
  @override
  void initState() {
    super.initState();

    widget.loadVehicles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vehicles")),
      body: widget.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: widget.vehicles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.vehicles[index].registration),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VehicleContainer(
                              vehicle: widget.vehicles[index],
                              isUpdating: true,
                            ),
                      ),
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

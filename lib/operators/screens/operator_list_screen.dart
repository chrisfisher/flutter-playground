import 'package:flutter/material.dart';
import 'package:flutter_playground/operators/models/vehicle_operator.dart';
import 'package:flutter_playground/operators/containers/operator_container.dart';

class OperatorListScreen extends StatefulWidget {
  final List<VehicleOperator> vehicleOperators;
  final bool isLoading;
  final Function loadOperators;

  OperatorListScreen({
    @required this.vehicleOperators,
    @required this.isLoading,
    @required this.loadOperators,
  });

  @override
  OperatorListScreenState createState() => OperatorListScreenState();
}

class OperatorListScreenState extends State<OperatorListScreen> {
  @override
  void initState() {
    super.initState();

    widget.loadOperators();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Operators")),
      body: widget.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: widget.vehicleOperators.length,
              itemBuilder: (context, index) {
                final vehicleOperator = widget.vehicleOperators[index];
                final firstName = vehicleOperator.firstName;
                final familyName = vehicleOperator.familyName;
                final name = "$firstName $familyName";
                return ListTile(
                  title: Text(name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OperatorContainer(
                              vehicleOperator: widget.vehicleOperators[index],
                            ),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/operators/add");
        },
        tooltip: 'Add operator',
        child: Icon(Icons.add),
      ),
    );
  }
}

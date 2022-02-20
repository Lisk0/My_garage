import 'package:flutter/material.dart';
import 'package:transactions/model/vehicle.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({Key? key}) : super(key: key);

  @override
  _GarageScreenState createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  final List<Vehicle> _garage = [
    Vehicle(
        id: 1,
        manufacturer: 'Audi',
        model: 'X1',
        horsepower: 145,
        displacement: 1600,
        registrationDate: DateTime.parse("2020-04-22"),
        fuel: FuelType.gasoline,
        manufactionYear: 2011),
    Vehicle(
        id: 2,
        manufacturer: 'Volkswagen',
        model: 'Golf 5',
        horsepower: 90,
        displacement: 1997,
        registrationDate: DateTime.parse("2020-07-25"),
        fuel: FuelType.diesel,
        manufactionYear: 2007),
    Vehicle(
        id: 3,
        manufacturer: 'Mercedes',
        model: 'S400d',
        horsepower: 245,
        displacement: 3000,
        registrationDate: DateTime.parse("2020-01-25"),
        fuel: FuelType.diesel,
        manufactionYear: 2019),
    Vehicle(
        id: 4,
        manufacturer: 'Tesla',
        model: 'Model S',
        horsepower: 340,
        displacement: 1600,
        registrationDate: DateTime.parse("2018-04-22"),
        fuel: FuelType.electric,
        manufactionYear: 2021),
  ];
  void placeholder() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Garage'),
          centerTitle: false,
          elevation: 5,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => placeholder(),
            ),
          ],
        ),
        body: const Text('List view'));
  }
}

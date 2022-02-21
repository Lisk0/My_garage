import 'package:flutter/material.dart';
import '../model/vehicle.dart';
import '../widget/garage_item.dart';
import '../widget/new_vehicle.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({Key? key}) : super(key: key);

  @override
  _GarageScreenState createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  final List<Vehicle> _garage = [
    Vehicle(
        id: DateTime(2000).toString(),
        manufacturer: 'Audi',
        model: 'A4',
        horsepower: 145,
        displacement: 1600,
        registrationDate: DateTime.parse("2020-04-22"),
        fuel: FuelType.gasoline,
        manufactionYear: 2011),
    Vehicle(
        id: DateTime(2001).toString(),
        manufacturer: 'Volkswagen',
        model: 'Golf 5',
        horsepower: 90,
        displacement: 1997,
        registrationDate: DateTime.parse("2020-07-25"),
        fuel: FuelType.diesel,
        manufactionYear: 2007),
    Vehicle(
        id: DateTime(2003).toString(),
        manufacturer: 'Mercedes',
        model: 'S400d',
        horsepower: 245,
        displacement: 3000,
        registrationDate: DateTime.parse("2020-01-25"),
        fuel: FuelType.diesel,
        manufactionYear: 2019),
    Vehicle(
        id: DateTime(2004).toString(),
        manufacturer: 'Tesla',
        model: 'Model S',
        horsepower: 340,
        displacement: 1600,
        registrationDate: DateTime.parse("2018-04-22"),
        fuel: FuelType.electric,
        manufactionYear: 2021),
  ];

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
            onPressed: () => _startAddNewVehicle(context),
          ),
        ],
      ),
      body: GridView(
        padding: const EdgeInsets.all(5),
        children: _garage
            .map(
              (item) => GarageItem(current: item, del: _deleteVehicle),
            )
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 144,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewVehicle(context),
      ),
    );
  }

  void _addNewVehicle(
      String manufacturer,
      String model,
      int horsepower,
      int displacement,
      DateTime registrationDate,
      FuelType fuel,
      int manufactionYear) {
    final veh = Vehicle(
        id: DateTime.now().toString(),
        manufacturer: manufacturer,
        model: model,
        horsepower: horsepower,
        displacement: displacement,
        registrationDate: registrationDate,
        fuel: fuel,
        manufactionYear: manufactionYear);

    setState(() {
      _garage.add(veh);
    });
  }

  void _startAddNewVehicle(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewVehicle(_addNewVehicle),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteVehicle(String id) {
    setState(() {
      _garage.removeWhere((v) => v.id == id);
    });
  }
}

import 'package:flutter/material.dart';
import '../helper/dbvehicles.dart';
import '../model/vehicle.dart';
import '../widget/garage_item.dart';
import '../widget/new_vehicle.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({Key? key}) : super(key: key);

  @override
  _GarageScreenState createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  List<Vehicle> _garage=[];
  late final database;
  

  @override
  void initState() {
    super.initState();
    database= DbVehicles(garageGet: _getList);
    
  }

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
      int manufactionYear) async {
    final veh = Vehicle(
        id: DateTime.now().toString(),
        manufacturer: manufacturer,
        model: model,
        horsepower: horsepower,
        displacement: displacement,
        registrationDate: registrationDate,
        fuel: fuel,
        manufactionYear: manufactionYear);

    database.insertDb(veh);

    setState(() {
      _getList();
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
    database.deleteDb(id);
    setState(() {
      //_garage.removeWhere((v) => v.id == id);
      _getList();
    });
  }


  void _getList() async{
    var dbdata= await database.allVehiclesDb();
    setState(() {
      _garage=dbdata;
    });
    for(var item in _garage) print(item.model);
  }
}

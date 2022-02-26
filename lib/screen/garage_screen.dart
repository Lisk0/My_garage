import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/vehicle.dart';
import '../widget/garage_item.dart';
import '../widget/new_vehicle.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({Key? key}) : super(key: key);

  @override
  _GarageScreenState createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  final List<Vehicle> _data = [
    Vehicle(
        id: DateTime(2000).toString(),
        manufacturer: 'Audi',
        model: 'A4',
        horsepower: 145,
        displacement: 1600,
        registrationDate: DateTime.parse("2021-02-28"),
        fuel: FuelType.gasoline,
        manufactionYear: 2011),
    Vehicle(
        id: DateTime(2001).toString(),
        manufacturer: 'Volkswagen',
        model: 'Golf 5',
        horsepower: 90,
        displacement: 1997,
        registrationDate: DateTime.parse("2021-07-25"),
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
    Vehicle(
        id: DateTime(2005).toString(),
        manufacturer: 'Petar',
        model: 'A4',
        horsepower: 145,
        displacement: 1600,
        registrationDate: DateTime.parse("2021-02-28"),
        fuel: FuelType.gasoline,
        manufactionYear: 2015),
  ];
  late final database;
  List<Vehicle> _garage=[];

  @override
  void initState() {
    helper();
    super.initState();
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

    insertDb(veh);

    setState(() {
      getList();
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
    deleteDb(id);
    setState(() {
      //_garage.removeWhere((v) => v.id == id);
      getList();
    });
  }

  void insertDb (Vehicle x) async{
    final db = await database;
    await db.insert(
    'vehicles',
    x.toMap(),
    conflictAlgorithm: ConflictAlgorithm.ignore,
  );
  }

  void deleteDb(String id) async{
    final db = await database;

    await db.delete(
    'vehicles',
    where: 'id = ?',
    whereArgs: [id],
  );
  }

  Future<List<Vehicle>> allVehiclesDb () async{
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('vehicles');

    return List.generate(maps.length, (i) {
      var fuel= FuelType.diesel;
      if(maps[i]['fuel']==FuelType.electric.name) fuel=FuelType.electric;
      else if(maps[i]['fuel']==FuelType.gasoline.name)fuel=FuelType.gasoline;

    return Vehicle(
      id: maps[i]['id'],
      manufacturer: maps[i]['manufacturer'],
      model: maps[i]['model'],
      horsepower: maps[i]['horsepower'],
      displacement: maps[i]['displacement'],
      registrationDate: DateTime.parse(maps[i]['registrationDate']),
      fuel: fuel,
      manufactionYear: maps[i]['manufactionYear']
    );
  });
  }

  void helper() async{
    this.database = openDatabase(

    join(await getDatabasesPath(), 'vehicles_database.db'),

    onCreate: (db, version) {

      db.execute(
        'CREATE TABLE vehicles(id TEXT PRIMARY KEY, manufacturer TEXT, model TEXT, horsepower INTEGER, displacement INTEGER, registrationDate TEXT, fuel TEXT, manufactionYear INTEGER)',
      );
      
      for(Vehicle item in _data){
       db.insert('vehicles', item.toMap());
      }

      return ;
    },

    onOpen: (db){
      getList();
    },

    version: 1,
  );

  }

  void getList() async{
    var dbdata= await allVehiclesDb();
    setState(() {
      _garage=dbdata;
    });
    for(var item in _garage) print(item.model);
  }
}

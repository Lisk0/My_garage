import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/vehicle.dart';

class DbVehicles{

  late var database;
  final Function garageGet;

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

  DbVehicles({required this.garageGet}){
    initDb();
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

  void initDb() async{
    database = openDatabase(

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
      garageGet();
    },

    version: 1,
  );

  }
}
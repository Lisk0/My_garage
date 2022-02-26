enum FuelType { gasoline, diesel, electric }

class Vehicle {
  final String id;
  final String manufacturer;
  final String model;
  final int horsepower;
  final int displacement;
  final DateTime registrationDate;
  final FuelType fuel;
  final int manufactionYear;

  Vehicle(
      {required this.id,
      required this.manufacturer,
      required this.model,
      required this.horsepower,
      required this.displacement,
      required this.registrationDate,
      required this.fuel,
      required this.manufactionYear});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'manufacturer': manufacturer,
      'model' : model,
      'horsepower' : horsepower,
      'displacement': displacement,
      'registrationDate': registrationDate.toString(),
      'fuel': fuel.name,
      'manufactionYear': manufactionYear
    };
  }


}

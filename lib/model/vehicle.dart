enum FuelType { gasoline, diesel, electric }

class Vehicle {
  final int id;
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
}

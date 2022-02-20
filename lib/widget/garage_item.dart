import 'package:flutter/material.dart';
import 'package:transactions/helper/logos.dart';
import '../model/vehicle.dart';
import '../screen/vehicle_screen.dart';

class GarageItem extends StatelessWidget {
  const GarageItem({Key? key, required this.current, required this.del})
      : super(key: key);

  final Vehicle current;
  final Function del;

  void selectVehicle(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return VehicleScreen(
            current: current,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String model = current.model;
    final String manufacturer = current.manufacturer;
    final int manufactionYear = current.manufactionYear;
    final FuelType fuel = current.fuel;
    Color color;
    switch (fuel) {
      case FuelType.electric:
        color = Colors.green;
        break;
      case FuelType.gasoline:
        color = Colors.red;
        break;
      default:
        color = Colors.blue;
        break;
    }
    var title = model;
    String searchable = manufacturer.trim().toLowerCase();
    String logo = 'assets/images/unknown.png';
    if (Logos.manufacturers.contains(searchable)) {
      logo = 'assets/images/' + searchable + '.png';
    }

    return InkWell(
        onTap: () => selectVehicle(context),
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Image.asset(
                logo,
                height: 80,
                width: 80,
              ),
              Text(
                manufactionYear.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ));
  }
}

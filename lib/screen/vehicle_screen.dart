import 'package:flutter/material.dart';
import 'package:transactions/model/vehicle.dart';
import 'package:transactions/widget/column_text.dart';
import '../helper/labels.dart';
import 'package:flutter/services.dart';

import '../helper/logos.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({Key? key, required this.current}) : super(key: key);
  final Vehicle current;

  void delete() {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    String searchable = current.manufacturer.trim().toLowerCase();
    String logo = 'assets/images/unknown.png';
    if (Logos.manufacturers.contains(searchable)) {
      logo = 'assets/images/' + searchable + '.png';
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text(Labels.vehicleData),
          centerTitle: true,
          elevation: 5,
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Image.asset(logo),
                ),
                ColumnText(
                    label: Labels.manufacturer, text: current.manufacturer),
                ColumnText(label: Labels.model, text: current.model),
                ColumnText(label: Labels.fuel, text: current.fuel.name),
                ColumnText(
                    label: Labels.manufactionYear,
                    text: current.manufactionYear.toString()),
                ColumnText(
                    label: Labels.horsepower,
                    text: current.horsepower.toString() + ' hp'),
                ColumnText(
                    label: Labels.displacement,
                    text: current.displacement.toString() + ' cc'),
                ElevatedButton(
                  onPressed: () => delete(),
                  child: const Text(
                    Labels.delete,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                )
              ],
            )));
  }
}

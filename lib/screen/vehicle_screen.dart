import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/vehicle.dart';
import '../widget/column_text.dart';
import '../helper/labels.dart';
import '../helper/logos.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({Key? key, required this.current, required this.delete})
      : super(key: key);
  final Vehicle current;
  final Function delete;

  void dlt(BuildContext context) {
    delete(current.id);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    DateTime regExpDate = DateTime(current.registrationDate.year + 1,
        current.registrationDate.month, current.registrationDate.day);
    int regExpDays = DateTime.now().difference(regExpDate).inDays;

    MaterialAccentColor expColor;
    String expLabel;
    String expText = '';
    if (regExpDays > -14 && regExpDays < 0) {
      expColor = Colors.yellowAccent;
      expLabel = Labels.regExpirationIn;
      expText = regExpDays.abs().toString() + 'days';
    } else if (regExpDays >= 14) {
      expColor = Colors.redAccent;
      expLabel = '';
      expText = Labels.regExpired;
    } else {
      expColor = Colors.greenAccent;
      expLabel = Labels.regExpirationIn;
      expText = regExpDays.abs().toString() + 'days';
    }

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
        body: SingleChildScrollView(
            child: Container(
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
                    Container(
                      color: expColor,
                      child: ColumnText(label: expLabel, text: expText),
                    ),
                    ElevatedButton(
                      onPressed: () => dlt(context),
                      child: const Text(
                        Labels.delete,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    )
                  ],
                ))));
  }
}

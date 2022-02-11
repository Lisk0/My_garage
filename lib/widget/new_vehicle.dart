import 'package:flutter/material.dart';
import 'package:transactions/model/vehicle.dart';
import 'package:select_form_field/select_form_field.dart';

import '../helper/labels.dart';

class NewVehicle extends StatefulWidget {
  final Function addVehicle;

  const NewVehicle(this.addVehicle, {Key? key}) : super(key: key);

  @override
  _NewVehicleState createState() => _NewVehicleState();
}

class _NewVehicleState extends State<NewVehicle> {
  final _manController = TextEditingController();
  final _modelController = TextEditingController();
  final _hpController = TextEditingController();
  final _dspController = TextEditingController();
  final _yearController = TextEditingController();
  final _fuelController = TextEditingController();
  final List<Map<String, dynamic>> _fuels = [
    {'value': FuelType.diesel.name, 'label': FuelType.diesel.name},
    {'value': FuelType.gasoline.name, 'label': FuelType.gasoline.name},
    {'value': FuelType.electric.name, 'label': FuelType.electric.name},
  ];
  DateTime? _selectedDate;

  void _submitData() {
    if (_manController.text.isEmpty ||
        _modelController.text.isEmpty ||
        _hpController.text.isEmpty ||
        _dspController.text.isEmpty ||
        _yearController.text.isEmpty ||
        _fuelController.text.isEmpty) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }

    final manufacturer = _manController.text;
    final model = _modelController.text;
    final horsepower = int.parse(_hpController.text);
    final displacement = int.parse(_dspController.text);
    final manufactionYear = int.parse(_yearController.text);
    late final FuelType fuel;
    final fl = _fuelController.text;
    switch (fl) {
      case 'diesel':
        fuel = FuelType.diesel;
        break;
      case 'electric':
        fuel = FuelType.electric;
        break;
      default:
        fuel = FuelType.gasoline;
        break;
    }

    widget.addVehicle(
      manufacturer,
      model,
      horsepower,
      displacement,
      _selectedDate,
      fuel,
      manufactionYear,
    );

    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: Labels.manufacturer),
              controller: _manController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: Labels.model),
              controller: _modelController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            SelectFormField(
              type: SelectFormFieldType.dropdown,
              labelText: Labels.fuel,
              items: _fuels,
              onChanged: (val) => _fuelController.text = val,
              onSaved: (val) => _fuelController.text = val!,
            ),
            TextField(
              decoration: const InputDecoration(labelText: Labels.horsepower),
              controller: _hpController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: Labels.displacement),
              controller: _dspController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration:
                  const InputDecoration(labelText: Labels.manufactionYear),
              controller: _yearController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom == 0.0
                      ? MediaQuery.of(context).viewInsets.bottom
                      : (MediaQuery.of(context).viewInsets.bottom - 70)),
              child: SizedBox(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? Labels.noDate
                            : Labels.pickedDate +
                                '${_selectedDate?.day.toString()}-${_selectedDate?.month.toString()}-${_selectedDate?.year.toString()}',
                      ),
                    ),
                    TextButton(
                      child: Text(
                        Labels.chooseDate,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      onPressed: _datePicker,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              child: const Text(
                Labels.addVehicle,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onPressed: _submitData,
            ),
          ],
        )),
      ),
    );
  }
}

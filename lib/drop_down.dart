import 'package:flutter/material.dart';

class OccupationDropdown extends StatefulWidget {
  static late String occupation = "Labour";

  @override
  _OccupationDropdownDropdownState createState() => _OccupationDropdownDropdownState();
}

class _OccupationDropdownDropdownState extends State<OccupationDropdown> {
  // List of items in our dropdown
  final List<String> _items = ['Monopolist', 'Labour', 'Shop Owner', 'Un-employee', 'House Owner'];

  // The selected item
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text('Select an item'),
      value: _selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue;
          OccupationDropdown.occupation = newValue ?? "";
        });
      },
      items: _items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';


class ReligionPickerWidget extends StatefulWidget {
  const ReligionPickerWidget({super.key});

  @override
  _ReligionPickerWidgetState createState() => _ReligionPickerWidgetState();
}

class _ReligionPickerWidgetState extends State<ReligionPickerWidget> {
  String _selectedValue = 'Roman Catholic';
  final List<String> _dropdownItems = [
    'Roman Catholic',
    'Islam',
    'Iglesia ni Cristo',
    'Seventh-day Adventist',
    'Aglipay',
    'Iglesia Filipina Independiente',
    'Bible Baptist Church',
    'United Church of Christ in the Philippines',
    "Jehovah's Witness",
    'Church of Christ',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DropdownButton<String>(
          value: _selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue!;
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      );
  }
}

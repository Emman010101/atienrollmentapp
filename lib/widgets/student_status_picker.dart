
import 'package:flutter/material.dart';

enum Status { old, transferee, bago}

class StatusSelection extends StatefulWidget {
  const StatusSelection({super.key});

  @override
  _StatusSelectionState createState() => _StatusSelectionState();
}

class _StatusSelectionState extends State<StatusSelection> {
  Status _selectedStatus = Status.old;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Select status:', style: TextStyle(fontSize: 18)),
          ListTile(
            title: const Text('Old'),
            leading: Radio<Status>(
              value: Status.old,
              groupValue: _selectedStatus,
              onChanged: (Status? value) {
                setState(() {
                  _selectedStatus = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Transferee'),
            leading: Radio<Status>(
              value: Status.transferee,
              groupValue: _selectedStatus,
              onChanged: (Status? value) {
                setState(() {
                  _selectedStatus = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('New Student'),
            leading: Radio<Status>(
              value: Status.bago,
              groupValue: _selectedStatus,
              onChanged: (Status? value) {
                setState(() {
                  _selectedStatus = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
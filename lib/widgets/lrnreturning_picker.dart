
import 'package:flutter/material.dart';

enum Returning { yes, no}
enum WithLrn {yes, no}

class LrnReturningPickerWidget extends StatefulWidget {
  LrnReturningPickerWidget({super.key});
  Returning selectedReturning = Returning.no;
  WithLrn selectedWithLrn = WithLrn.no;

  get getWithLrnValue{
    String hasLrn = "no";
    if(selectedWithLrn == WithLrn.yes){
      hasLrn = "yes";
    }
    return hasLrn;
  }

  get getReturningValue{
    String isReturning = "no";
    if(selectedReturning == Returning.yes){
      isReturning = "yes";
    }
    return isReturning;
  }

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<LrnReturningPickerWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('With LRN?:', style: TextStyle(fontSize: 18)),
          ListTile(
            title: const Text('Yes'),
            leading: Radio<WithLrn>(
              value: WithLrn.yes,
              groupValue: widget.selectedWithLrn,
              onChanged: (WithLrn? value) {
                setState(() {
                  widget.selectedWithLrn = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('No'),
            leading: Radio<WithLrn>(
              value: WithLrn.no,
              groupValue: widget.selectedWithLrn,
              onChanged: (WithLrn? value) {
                setState(() {
                  widget.selectedWithLrn = value!;
                });
              },
            ),
          ),
          const Text('Returning(Balik-Aral):', style: TextStyle(fontSize: 18)),
          ListTile(
            title: const Text('Yes'),
            leading: Radio<Returning>(
              value: Returning.yes,
              groupValue: widget.selectedReturning,
              onChanged: (Returning? value) {
                setState(() {
                  widget.selectedReturning = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('No'),
            leading: Radio<Returning>(
              value: Returning.no,
              groupValue: widget.selectedReturning,
              onChanged: (Returning? value) {
                setState(() {
                  widget.selectedReturning = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
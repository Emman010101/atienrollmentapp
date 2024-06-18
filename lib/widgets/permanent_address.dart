import 'package:atienrollmentapp/widgets/current_address_picker.dart';
import 'package:flutter/material.dart';

enum YoN { yes, no }

class PermanentAddressPicker extends StatefulWidget {
  YoN selectedValue = YoN.no;

  PermanentAddressPicker({super.key});

  CurrentAddressPicker currentAddressPicker = CurrentAddressPicker(
    title: '',
  );

  get getRegion {
    return currentAddressPicker.getRegion;
  }

  get getProvince {
    return currentAddressPicker.getProvince;
  }

  get getMunicipality {
    return currentAddressPicker.getMunicipality;
  }

  get getBarangay {
    return currentAddressPicker.getBarangay;
  }

  get getZipCode {
    return currentAddressPicker.getZipCode;
  }

  get getStreetName {
    return currentAddressPicker.getStreetName;
  }

  get getHouseNo {
    return currentAddressPicker.getHouseNo;
  }

  get getSelectedValue {
    bool selectedVal = false;
    if (selectedValue == YoN.yes) {
      selectedVal = true;
    }
    return selectedVal;
  }

  @override
  State<PermanentAddressPicker> createState() => _PermanentAddressPickerState();
}

class _PermanentAddressPickerState extends State<PermanentAddressPicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Permanent Address", style: TextStyle(fontSize: 18)),
          const Text("Same with your Current Address?",
              style: TextStyle(fontSize: 18)),
          ListTile(
            title: const Text('Yes'),
            leading: Radio<YoN>(
              value: YoN.yes,
              groupValue: widget.selectedValue,
              onChanged: (YoN? value) {
                setState(() {
                  widget.selectedValue = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('No'),
            leading: Radio<YoN>(
              value: YoN.no,
              groupValue: widget.selectedValue,
              onChanged: (YoN? value) {
                setState(() {
                  widget.selectedValue = value!;
                });
              },
            ),
          ),
          widget.selectedValue == YoN.yes
              ? const SizedBox()
              : widget.currentAddressPicker,
        ],
      ),
    );
  }
}


import 'package:atienrollmentapp/functions/textfield_decoration.dart';
import 'package:atienrollmentapp/widgets/address_picker.dart';
import 'package:flutter/material.dart';

class CurrentAddressPicker extends StatefulWidget {
  String title;
  String zipCode = '';
  String streetName = '';
  String houseNo = '';

  CurrentAddressPicker({super.key, required this.title});
  AddressPickerWidget addressPickerWidget = AddressPickerWidget(title: "", showBarangay: true,);

  get getRegion{
    return addressPickerWidget.getRegion;
  }

  get getProvince{
    return addressPickerWidget.getProvince;
  }

  get getMunicipality{
    return addressPickerWidget.getMunicipality;
  }

  get getBarangay{
    return addressPickerWidget.getBarangay;
  }

  get getZipCode{
    return zipCode;
  }

  get getStreetName{
    return streetName;
  }

  get getHouseNo{
    return houseNo;
  }

  @override
  State<CurrentAddressPicker> createState() => _CurrentAdressPickerState();
}

class _CurrentAdressPickerState extends State<CurrentAddressPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(widget.title, style: const TextStyle(fontSize: 18)),
        widget.addressPickerWidget,
        TextFormField(
          validator: (value) {
            widget.zipCode = value.toString();
            if (value!.isEmpty) {
              return 'This must not be empty.';
            } else {
              return null;
            }
          },
          decoration: textfieldDecoration(Colors.black, "Zip Code"),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          validator: (value) {
            widget.streetName = value.toString();
            if (value!.isEmpty) {
              return 'This must not be empty.';
            } else {
              return null;
            }
          },
          decoration: textfieldDecoration(Colors.black, "Street Name"),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          validator: (value) {
            widget.houseNo = value.toString();
            if (value!.isEmpty) {
              return 'This must not be empty.';
            } else {
              return null;
            }
          },
          decoration: textfieldDecoration(Colors.black, "House No./Street"),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

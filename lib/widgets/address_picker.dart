

import 'package:flutter/material.dart';
import 'package:philippines_rpcmb/philippines_rpcmb.dart';


class AddressPickerWidget extends StatefulWidget {
  var title;
  bool showBarangay;
  Region? region;
  Province? province;
  Municipality? municipality;
  String? barangay;
  AddressPickerWidget({super.key, required this.title, required this.showBarangay});

  get getRegion{
    return region.toString();
  }

  get getProvince{
    return province.toString();
  }

  get getMunicipality{
    return municipality.toString();
  }

  get getBarangay{
    return barangay;
  }

  @override
  State<AddressPickerWidget> createState() => _AddressPickerWidgetState();
}

class _AddressPickerWidgetState extends State<AddressPickerWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        const SizedBox(
          height: 20,
        ),
        PhilippineRegionDropdownView(
          onChanged: (Region? value) {
            setState(() {
              if (widget.region != value) {
                widget.province = null;
                widget.municipality = null;
                widget.barangay = null;
              }
              widget.region = value;
            });
          },
          value: widget.region,
        ),
        const SizedBox(
          height: 20,
        ),
        PhilippineProvinceDropdownView(
          provinces: widget.region?.provinces ?? [],
          onChanged: (Province? value) {
            setState(() {
              if (widget.province != value) {
                widget.municipality = null;
                widget.barangay = null;
              }
              widget.province = value;
            });
          },
          value: widget.province,
        ),
        const SizedBox(
          height: 20,
        ),
        PhilippineMunicipalityDropdownView(
          municipalities: widget.province?.municipalities ?? [],
          onChanged: (value) {
            setState(() {
              if (widget.municipality != value) {
                widget.barangay = null;
              }
              widget.municipality = value;
            });
          },
          value: widget.municipality,
        ),
        const SizedBox(
          height: 20,
        ),
        widget.showBarangay ? PhilippineBarangayDropdownView(
            barangays: widget.municipality?.barangays ?? [],
            onChanged: (value) {
              setState(() {
                widget.barangay = value;
              });
            }) : const SizedBox(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

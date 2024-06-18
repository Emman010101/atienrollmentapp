

import 'package:flutter/material.dart';
import 'package:philippines_rpcmb/philippines_rpcmb.dart';


class BirthplacePickerWidget extends StatefulWidget {
  const BirthplacePickerWidget({super.key});

  @override
  State<BirthplacePickerWidget> createState() => _BirthplacePickerWidgetState();
}

class _BirthplacePickerWidgetState extends State<BirthplacePickerWidget> {
  Region? birthplaceRegion;
  Province? birthplaceProvince;
  Municipality? birthplaceMunicipality;
  String? barangay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Birthplace", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        const SizedBox(
          height: 20,
        ),
        PhilippineRegionDropdownView(
          onChanged: (Region? value) {
            setState(() {
              if (birthplaceRegion != value) {
                birthplaceProvince = null;
                birthplaceMunicipality = null;
                barangay = null;
              }
              birthplaceRegion = value;
            });
          },
          value: birthplaceRegion,
        ),
        const SizedBox(
          height: 20,
        ),
        PhilippineProvinceDropdownView(
          provinces: birthplaceRegion?.provinces ?? [],
          onChanged: (Province? value) {
            setState(() {
              if (birthplaceProvince != value) {
                birthplaceMunicipality = null;
                barangay = null;
              }
              birthplaceProvince = value;
            });
          },
          value: birthplaceProvince,
        ),
        const SizedBox(
          height: 20,
        ),
        PhilippineMunicipalityDropdownView(
          municipalities: birthplaceProvince?.municipalities ?? [],
          onChanged: (value) {
            setState(() {
              if (birthplaceMunicipality != value) {
                barangay = null;
              }
              birthplaceMunicipality = value;
            });
          },
          value: birthplaceMunicipality,
        ),
        const SizedBox(
          height: 20,
        ),
        PhilippineBarangayDropdownView(
            barangays: birthplaceMunicipality?.barangays ?? [],
            onChanged: (value) {
              setState(() {
                barangay = value;
              });
            }),
      ],
    );
  }
}

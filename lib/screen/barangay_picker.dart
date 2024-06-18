import 'package:flutter/material.dart';
import 'package:philippines_rpcmb/philippines_rpcmb.dart';

class TestPhilippineDropdown extends StatefulWidget {
  const TestPhilippineDropdown({super.key});

  @override
  State<TestPhilippineDropdown> createState() => _TestPhilippineDropdownState();
}

class _TestPhilippineDropdownState extends State<TestPhilippineDropdown> {
  Region? region;
  Province? province;
  Municipality? municipality;
  String? barangay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Philippines RPCMB'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              PhilippineRegionDropdownView(
                onChanged: (Region? value) {
                  setState(() {
                    if (region != value) {
                      province = null;
                      municipality = null;
                      barangay = null;
                    }
                    region = value;
                  });
                },
                value: region,
              ),
              PhilippineProvinceDropdownView(
                provinces: region?.provinces ?? [],
                onChanged: (Province? value) {
                  setState(() {
                    if (province != value) {
                      municipality = null;
                      barangay = null;
                    }
                    province = value;
                  });
                },
                value: province,
              ),
              PhilippineMunicipalityDropdownView(
                municipalities: province?.municipalities ?? [],
                onChanged: (value) {
                  setState(() {
                    if (municipality != value) {
                      barangay = null;
                    }
                    municipality = value;
                  });
                },
                value: municipality,
              ),
              PhilippineBarangayDropdownView(
                  barangays: municipality?.barangays ?? [],
                  onChanged: (value) {
                    setState(() {
                      barangay = value;
                    });
                  }),
              const SizedBox(
                height: 32,
              ),
              Text(region?.regionName ?? ''),
              Text(province?.name ?? ''),
              Text(municipality?.name ?? ''),
              Text(barangay ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
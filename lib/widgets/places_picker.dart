import 'package:psgc_picker/psgc_picker.dart';

PsgcPicker placesPicker(){
  return PsgcPicker(
    regionLabel: 'Region',
    provinceLabel: 'Province',
    cityLabel: 'City/Municipality',
    selectedRegion: 'CALABARZON',
    selectedProvince: 'RIZAL',
    selectedCity: 'CAINTA',
    spacing: 5,
    onRegionChanged: (value) => {print(value)},
    onProvinceChanged: (value) => {print(value)},
    onCityChanged: (value) => {print(value)},
  );
}
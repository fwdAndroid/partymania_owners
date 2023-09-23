import 'package:country_picker_plus/country_picker_plus.dart';
import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  /// Variables to store country state city data in onChanged method.
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 600,
            child: Column(
              children: [
                ///Adding CSC Picker Widget in app
                CountryPickerPlus(
                  isRequired: true,
                  countryLabel: "Country",
                  countrySearchHintText: "Search Country",
                  countryHintText: "Tap to Select Country",
                  stateLabel: "State",
                  stateHintText: "Tap to Select State",
                  cityLabel: "City",
                  cityHintText: "Tap to Select City",
                  onCountrySaved: (value) {
                    countryValue = value!;
                    print(countryValue);
                  },
                  onCountrySelected: (value) {
                    countryValue = value;
                    print(countryValue);
                  },
                  onStateSelected: (value) {
                    stateValue = value;
                    print(stateValue);
                  },
                  onCitySelected: (value) {
                    cityValue = value;
                    print(cityValue);
                  },
                ),

                ///print newly selected country state and city in Text Widget
                TextButton(
                    onPressed: () {
                      setState(() {
                        address = "$cityValue, $stateValue, $countryValue";
                      });
                    },
                    child: Text("Print Data")),
                Text(address)
              ],
            )),
      ),
    );
  }
}

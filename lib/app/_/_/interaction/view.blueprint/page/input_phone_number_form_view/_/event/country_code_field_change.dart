import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../main.dart';
import '../action/input_country_code_field.dart';

@JuneViewEvent()
countryCodeFieldChangeEvent(BuildContext context, CountryCode value) {
  inputCountryCodeFieldAction(value);
}

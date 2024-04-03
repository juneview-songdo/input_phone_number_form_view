import '../../../../../../../../../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../action/input_country_code_field.dart';
import '../action/change_by_input_text_field.dart';

@JuneViewMother()
mixin StateMother<T extends StatefulWidget> on State<T> {
  bool ignoreReadyView() => false;

  Future<void> readyState(BuildContext context) async {}

  Widget loadingWidget() {
    return CupertinoActivityIndicator().center();
  }

  /// automatically generated action code - don't change this code

changeByInputTextFieldAction(String value) {
  var state = NewViewState(); // do not change this line
  state.inputButtonEnabled = PhoneNumber.parse(value,
      callerCountry: isoCodeConversionMap[state.userCountryCode])
      .isValid(type: PhoneNumberType.mobile);

  state.internationalPhoneNumber = PhoneNumber.parse(value,
      callerCountry: isoCodeConversionMap[state.userCountryCode])
      .international;
  updateState(() {});
}





inputCountryCodeFieldAction(CountryCode value) {
  var state = NewViewState(); // do not change this line
  state.userDialCode = value.dialCode ?? "+1";
  state.userCountryCode = value.code ?? "US";
  updateState(() {});
}
  /// end of automatically action generated code
  /// automatically generated event code - don't change this code

countryCodeFieldChangeEvent(BuildContext context, CountryCode value) {
  inputCountryCodeFieldAction(value);
}




onChangeTextFieldEvent(String value) {
  changeByInputTextFieldAction(value);
}
  /// end of automatically event generated code
}

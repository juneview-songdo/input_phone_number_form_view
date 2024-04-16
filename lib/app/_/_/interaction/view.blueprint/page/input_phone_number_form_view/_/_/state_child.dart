import '../../../../../../../../../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../view.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../action/input_country_code_field.dart';
import '../action/change_by_input_text_field.dart';

@JuneViewChild()
class StateChild extends NewViewState {
  bool isReadyView = false;

  late StateChild state;

  StateChild() {
    state = this;
  }

  @override
  void initState() {
    if (readyState(context) == null) {
      isReadyView = true;
    } else {
      _ready();
    }

    super.initState();
  }

  Future<void> _ready() async {
    if (!(readyState(context) == null)) {
      await readyState(context)!();
    }
    if (mounted) {
      setState(() {
        isReadyView = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isReadyView) {
      return loadingWidget();
    }

    return super.build(context);
  }

/// automatically generated action code - don't change this code

@override
changeByInputTextFieldAction(String value) {
  inputButtonEnabled = PhoneNumber.parse(value,
      callerCountry: isoCodeConversionMap[userCountryCode])
      .isValid(type: PhoneNumberType.mobile);

  internationalPhoneNumber = PhoneNumber.parse(value,
      callerCountry: isoCodeConversionMap[userCountryCode])
      .international;
  setState(() {});
}





@override
inputCountryCodeFieldAction(CountryCode value) {
  userDialCode = value.dialCode ?? "+1";
  userCountryCode = value.code ?? "US";
  setState(() {});
}
/// end of automatically action generated code
/// automatically generated event code - don't change this code

@override
countryCodeFieldChangeEvent(BuildContext context, CountryCode value) {
  inputCountryCodeFieldAction(value);
}




@override
onChangeTextFieldEvent(String value) {
  changeByInputTextFieldAction(value);
}
/// end of automatically event generated code
}

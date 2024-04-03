import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import '../../../../../../../../../main.dart';

import '../view.dart';

@JuneViewAction()
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

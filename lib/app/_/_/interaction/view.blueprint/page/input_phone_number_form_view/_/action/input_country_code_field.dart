import 'package:country_code_picker/country_code_picker.dart';

import '../../../../../../../../../main.dart';

import '../view.dart';

@JuneViewAction()
inputCountryCodeFieldAction(CountryCode value) {
  var state = NewViewState(); // do not change this line
  state.userDialCode = value.dialCode ?? "+1";
  state.userCountryCode = value.code ?? "US";
  updateState(() {});
}

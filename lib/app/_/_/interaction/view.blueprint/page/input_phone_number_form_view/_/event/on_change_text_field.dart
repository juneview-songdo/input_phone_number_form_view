import 'package:flutter/material.dart';

import '../../../../../../../../../main.dart';
import '../action/change_by_input_text_field.dart';

@JuneViewEvent()
onChangeTextFieldEvent(String value) {
  changeByInputTextFieldAction(value);
}

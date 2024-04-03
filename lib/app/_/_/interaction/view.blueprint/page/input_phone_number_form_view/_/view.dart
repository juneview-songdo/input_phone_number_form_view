import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key});

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  TextEditingController textEditController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  bool inputButtonEnabled = false;
  final formKey = GlobalKey<FormState>();

  String userDialCode = "+1";
  String userCountryCode = "US";
  String internationalPhoneNumber = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(60),
              Text("Please enter your phone number.")
                  .textStyle(Theme.of(context).textTheme.titleLarge!)
                  .fontWeight(FontWeight.bold)
                  .padding(horizontal: 30),
              Row(
                children: [
                  CountryCodePicker(
                    onChanged: (value) {
                      countryCodeFieldChangeEvent(context, value);
                      onChangeTextFieldEvent(textEditController.text);
                    },
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: userDialCode,
                    favorite: ['+1'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    showFlag: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                  TextFormField(
                    controller: textEditController,
                    cursorColor: Colors.black,
                    focusNode: myFocusNode,
                    keyboardType: TextInputType.phone,
                    // 커서 색상을 검은색으로 고정

                    decoration: InputDecoration(
                      // labelText: '닉네임',
                      labelStyle:
                      TextStyle(color: Colors.black, fontSize: 12),
                      hintText: '000-000-0000',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      // 라벨을 항상 위에 표시
                      hintStyle: TextStyle(
                        color: Colors.grey, // 힌트 텍스트의 색상 설정
                      ),
                      errorStyle: TextStyle(
                        color: Colors.red, // 에러 메시지의 글자 색상
                        fontSize: 12.0, // 에러 메시지의 글자 크기
                      ),
                      // 기본 테두리 스타일
                      enabledBorder: UnderlineInputBorder(
                        // 기본 밑줄 스타일
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        // 포커스 상태에서도 밑줄 스타일 유지
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        // 비활성화된 상태에서도 밑줄 스타일 유지
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      errorBorder: UnderlineInputBorder(
                        // 에러 상태에서의 밑줄 스타일
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        // 에러 상태에서 포커스를 받았을 때의 밑줄 스타일
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),

                      // contentPadding: EdgeInsets.symmetric(
                      //     vertical: 15.0, horizontal: 15.0),
                    ),
                    style: Theme.of(context).textTheme.bodyLarge!,
                    validator: (value) {
                      // if (value == null || value.length < 15) {
                      //   return '이미 존재하는 아이디입니다.';
                      // }
                      return null;
                    },
                    onChanged: (String value) {
                      // 여기에 사용자가 입력할 때마다 실행할 코드를 작성합니다.
                      onChangeTextFieldEvent(value);
                    },
                  ).expanded(),
                ],
              ).padding(right: 30, left: 15),
              Spacer(),
              OutlinedButton(
                onPressed: !inputButtonEnabled
                    ? null
                    : () {
                  if (formKey.currentState!.validate()) {
                    print('submit phone number: $internationalPhoneNumber');
                  }
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(
                      color: Theme.of(context).textTheme.bodyMedium!.color!,
                      width: 2), // 테두리 색상과 두께 설정
                ),
                child: Text("Confirm")
                    .fontWeight(FontWeight.bold)
                    .textColor(Theme.of(context).textTheme.bodyMedium!.color!)
                    .padding(vertical: 20, horizontal: 20),
              )
                  .padding(vertical: 7, horizontal: 30)
                  .width(double.infinity)
                  .opacity(inputButtonEnabled ? 1 : 0.2),
              Gap(10),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtonKit(),
    );
  }
}

main() async {
  return buildApp(appHome: NewView());
}
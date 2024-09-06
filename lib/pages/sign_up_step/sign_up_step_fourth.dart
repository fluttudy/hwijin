// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:setting_check/controller/option_controller.dart';
import 'package:setting_check/controller/textfield_controller.dart';
import 'package:setting_check/pages/sign_up_complete_page.dart';
import 'package:setting_check/pages/sign_up_step/sign_up_step_second.dart';
import 'package:setting_check/utils/colors.dart';
import 'package:setting_check/utils/paddings.dart';
import 'package:setting_check/utils/phone_size.dart';
import 'package:setting_check/utils/text_style.dart';

class SignUpStepFourth extends StatefulWidget {
  const SignUpStepFourth({super.key});

  @override
  State<SignUpStepFourth> createState() => _SignUpStepFourthState();
}

class _SignUpStepFourthState extends State<SignUpStepFourth> {
  final optionController = Get.find<OptionController>();
  final textFieldController = Get.put(TextFieldController());

  final phoneNumberController = TextEditingController();

  final bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: GetBuilder<OptionController>(builder: (context) {
          return SafeArea(
            child: Center(
              child: Column(
                children: [
                  // AppBar
                  Padding(padding: main_padding, child: _appBar()),

                  // Main Info
                  Padding(
                      padding:
                          main_padding.copyWith(top: PhoneSize.height * 0.01) *
                              2,
                      child: _pageInfo()),

                  SizedBox(
                    height: PhoneSize.height * 0.02,
                  ),

                  // Main, Sub Options
                  Padding(
                      padding: main_padding * 2,
                      child: Column(
                        children: [
                          _options(optionController),
                          SizedBox(
                            height: PhoneSize.height * 0.01,
                          ),
                        ],
                      )),

                  Container(
                    height: PhoneSize.height * 0.08,
                    padding: main_padding * 2,
                    child: Column(
                      children: [
                        SizedBox(
                          width: PhoneSize.width,
                          child: TextField(
                            cursorColor: main_color,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '닉네임 (한글 6자리 이내)',
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                    fontSize: 18.0)),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),

                  Container(
                      width: PhoneSize.width,
                      height: PhoneSize.height * 0.05,
                      padding: main_padding * 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                                EdgeInsets.all(12 - PhoneSize.width * 0.015),
                            child: Icon(
                              Icons.circle,
                              size: PhoneSize.width * 0.015,
                            ),
                          ),
                          SizedBox(
                            width: PhoneSize.width * 0.01,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: PhoneSize.height * 0.05,
                              child: Text(
                                '매장에서 주문한 메뉴를 찾으실 때, 등록한 닉네임으로 불러드립니다.',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),

                  Expanded(
                    child: Padding(
                      padding: main_padding.copyWith(
                              bottom: PhoneSize.height * 0.015) *
                          2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(SignUpComplete());
                            },
                            child: Text(
                              '건너뛰기',
                              style:
                                  TextStyle(color: main_color, fontSize: 24.0),
                            ),
                          ),
                          SizedBox(
                            height: PhoneSize.height * 0.01,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(SignUpComplete());
                            },
                            child: Obx(
                              () {
                                return Container(
                                  alignment: Alignment.center,
                                  width: PhoneSize.width,
                                  height: PhoneSize.height * 0.05,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0),
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: optionController
                                            .phoneNumberAuthentication.value
                                        ? Color.fromRGBO(0, 179, 117, 1)
                                        : Colors.grey,
                                  ),
                                  child: const Text(
                                    '다음',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}

Widget _appBar() {
  return SizedBox(
    height: PhoneSize.height * 0.1,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ),
            ),
            SizedBox(
              width: PhoneSize.width * 0.02,
              child: const Divider(color: Colors.grey, thickness: 1.0),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '2',
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ),
            ),
            SizedBox(
              width: PhoneSize.width * 0.02,
              child: const Divider(color: Colors.grey, thickness: 1.0),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '3',
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ),
            ),
            SizedBox(
              width: PhoneSize.width * 0.02,
              child: const Divider(color: Colors.grey, thickness: 1.0),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '4',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.close,
              size: PhoneSize.width * 0.1,
              color: Colors.grey,
            ),
          ),
        )
      ],
    ),
  );
}

Widget _pageInfo() {
  return Container(
      alignment: Alignment.centerLeft,
      width: PhoneSize.width,
      child: const Text(
        '닉네임을\n입력해 주세요.',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
      ));
}

Widget _options(OptionController optionController) {
  return Row(
    children: [
      _checkBox(optionController.signUp_FirstStep, optionController),
      SizedBox(
        width: PhoneSize.width * 0.02,
      ),
      const Text(
        '선택적 개인정보 수집동의 및 이용약관',
        style: checkBox_textStyle,
      ),
    ],
  );
}

Widget _checkBox(bool optionValue, OptionController optionController) {
  return Transform.scale(
    scale: 1.25,
    child: Checkbox(
      value: optionValue,
      onChanged: (value) {
        optionController.update_SignUpFirstStep(value!);
      },
      shape: const CircleBorder(),
      side: const BorderSide(color: Colors.grey),
      activeColor: const Color.fromRGBO(0, 179, 117, 1),
      checkColor: Colors.white,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
    ),
  );
}

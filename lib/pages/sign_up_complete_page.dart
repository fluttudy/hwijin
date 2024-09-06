// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:setting_check/controller/option_controller.dart';
import 'package:setting_check/controller/textfield_controller.dart';
import 'package:setting_check/pages/sign_up_step/sign_up_step_second.dart';
import 'package:setting_check/utils/colors.dart';
import 'package:setting_check/utils/paddings.dart';
import 'package:setting_check/utils/phone_size.dart';
import 'package:setting_check/utils/text_style.dart';

class SignUpComplete extends StatelessWidget {
  SignUpComplete({super.key});

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

                  Padding(
                    padding: main_padding * 2,
                    child: Column(
                      children: [
                        Divider(),
                        SizedBox(
                          height: PhoneSize.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: PhoneSize.width * 0.5,
                                  child: Text(
                                    '2021년 3월 5일 E-Mail 및 SMS 광고성 정보 수신여부 처리 결과',
                                    style: TextStyle(fontSize: 14.0),
                                  )),
                              SizedBox(
                                  width: PhoneSize.width * 0.1,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 1.0,
                                  )),
                              Container(
                                  alignment: Alignment.centerRight,
                                  child: Text('수신 거부'))
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),

                  Container(
                      alignment: Alignment.centerRight,
                      padding: main_padding * 2,
                      child: Text(
                        '제공자: (주) 스타벅스커피 코리아)',
                        style: TextStyle(color: Colors.grey),
                      )),

                  SizedBox(
                    height: PhoneSize.height * 0.02,
                  ),

                  SizedBox(
                      height: PhoneSize.height * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '스타벅스 카드를 등록하시고\n웰컴 첫 구매 쿠폰과 별 적립 혜택을 받아보세요.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      )),

                  Expanded(
                    child: Padding(
                      padding: main_padding.copyWith(
                              bottom: PhoneSize.height * 0.015) *
                          2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              optionController.phoneNumberAuthentication.value
                                  ? Get.to(SignUpStepSecond())
                                  : null;
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
                                    '스타벅스 카드등록 바로가기',
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
        '홍길동님,\n회원가입이 완료되었습니다.',
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

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_check/controller/option_controller.dart';
import 'package:setting_check/controller/textfield_controller.dart';
import 'package:setting_check/pages/sign_up_step/sign_up_step_second.dart';
import 'package:setting_check/utils/paddings.dart';
import 'package:setting_check/utils/phone_size.dart';
import 'package:setting_check/utils/text_style.dart';

class SignUpStepFirst extends StatefulWidget {
  const SignUpStepFirst({super.key});

  @override
  State<SignUpStepFirst> createState() => _SignUpStepFirstState();
}

class _SignUpStepFirstState extends State<SignUpStepFirst> {
  final optionController = Get.find<OptionController>();
  final textFieldController = Get.put(TextFieldController());

  final phoneNumberController = TextEditingController();

  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: GetBuilder<OptionController>(builder: (context) {
          return Center(
            child: Column(
              children: [
                // AppBar
                Padding(padding: main_padding, child: _appBar()),

                // Main Info
                Padding(
                    padding:
                        main_padding.copyWith(top: PhoneSize.height * 0.01) * 2,
                    child: _pageInfo()),

                SizedBox(
                  height: PhoneSize.height * 0.01,
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
                        optionController.signUp_FirstStep
                            ? Container()
                            : _subOptions(),
                      ],
                    )),
                const Divider(
                  thickness: 1.0,
                ),

                Container(
                  height: PhoneSize.height * 0.1,
                  padding: main_padding * 2,
                  child: Column(
                    children: [
                      SizedBox(
                        width: PhoneSize.width,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '이름',
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
                  height: PhoneSize.height * 0.1,
                  padding: main_padding * 2,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: PhoneSize.width * 0.35,
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '생년월일 6자리',
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                    fontSize: 18.0)),
                          ),
                        ),
                        SizedBox(
                          width: PhoneSize.width * 0.02,
                          child: Divider(
                            thickness: 1.0,
                          ),
                        ),
                        SizedBox(
                          width: PhoneSize.width * 0.35,
                          child: TextField(
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              )),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ]),
                ),

                Container(
                  width: PhoneSize.width,
                  height: PhoneSize.height * 0.1,
                  padding: main_padding * 2,
                  child: Column(children: [
                    Row(
                      children: [
                        DropdownButton(
                          value: optionController.agency_value,
                          items: optionController.agency.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: PhoneSize.width * 0.1),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (v) {
                            optionController.update_dropDown(v!);
                          },
                          underline: SizedBox(),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                            width: PhoneSize.width * 0.3,
                            child: TextField(
                              controller: phoneNumberController,
                              onChanged: (text) {
                                if (text.length > 10) {
                                  optionController.phoneNumberValidation(true);
                                } else {
                                  optionController.phoneNumberValidation(false);
                                }
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '휴대폰 번호',
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.5),
                                      fontSize: 18.0)),
                            )),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isClicked = !_isClicked;
                                    });
                                  },
                                  child: Obx(() {
                                    return Text(
                                      _isClicked &&
                                              optionController
                                                  .phoneNumberValidation.value
                                          ? '다시요청'
                                          : '인증요청',
                                      style: TextStyle(
                                          color: optionController
                                                  .phoneNumberValidation.value
                                              ? Color.fromRGBO(0, 179, 117, 1)
                                              : Colors.grey,
                                          fontSize: 16.0),
                                    );
                                  }),
                                )))
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ]),
                ),

                Container(
                  height: PhoneSize.height * 0.1,
                  padding: main_padding * 2,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: PhoneSize.width * 0.7,
                          child: TextField(
                            onChanged: (text) {
                              if (text.length == 6) {
                                optionController
                                    .phoneNumberAuthentication(true);
                              } else {
                                optionController
                                    .phoneNumberAuthentication(false);
                              }
                            },
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '인증번호 6자리',
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                    fontSize: 18.0)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ]),
                ),

                Container(
                    height: PhoneSize.height * 0.05,
                    padding: main_padding * 2,
                    child: Text(
                      '타인의 개인정보를 도용하여 가입한 경우, 서비스 이용 제한 및 법적 제재를 받으실 수 있습니다.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
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
                                height: PhoneSize.height * 0.07,
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
                border: Border.all(),
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
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
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '4',
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.close,
            size: PhoneSize.width * 0.1,
            color: Colors.grey,
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
        '본인확인을 위해\n인증을 진행해 주세요.',
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
        '본인 인증 서비스 약관 전체동의',
        style: checkBox_textStyle,
      ),
    ],
  );
}

Widget _subOptions() {
  return Column(
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '휴대폰 본인 인증 서비스 이용약관 동의 (필수)',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16.0,
          ),
        ],
      ),
      SizedBox(
        height: PhoneSize.height * 0.003,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '휴대폰 통신사 이용약관 동의 (필수)',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16.0,
          ),
        ],
      ),
      SizedBox(
        height: PhoneSize.height * 0.003,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '개인정보 제공 및 이용 동의 (필수)',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16.0,
          ),
        ],
      ),
      SizedBox(
        height: PhoneSize.height * 0.003,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '고유식별정보 처리 (필수)',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16.0,
          ),
        ],
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_check/controller/option_controller.dart';
import 'package:setting_check/main.dart';
import 'package:setting_check/pages/sign_up_step/sign_up_step_third.dart';
import 'package:setting_check/utils/colors.dart';
import 'package:setting_check/utils/paddings.dart';
import 'package:setting_check/utils/phone_size.dart';

class SignUpStepSecond extends StatelessWidget {
  SignUpStepSecond({super.key});

  final optionController = Get.find<OptionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GetBuilder<OptionController>(builder: (optionController) {
        return SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: main_padding,
                  child: _appBar(),
                ),
                Padding(
                    padding:
                        main_padding.copyWith(top: PhoneSize.height * 0.01) * 2,
                    child: _pageInfo()),
                Padding(
                    padding:
                        main_padding.copyWith(top: PhoneSize.height * 0.01) * 2,
                    child: Column(
                      children: [
                        _createId(optionController),
                        SizedBox(
                          height: PhoneSize.height * 0.01,
                        ),
                        _createPassword(optionController),
                        SizedBox(
                          height: PhoneSize.height * 0.01,
                        ),
                        _checkPassword(optionController),
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
                            optionController.createId.value &&
                                    optionController.createPassword.value &&
                                    optionController.checkPw.value
                                ? Get.to(SignUpStepThird())
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
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: optionController.createId.value &&
                                          optionController
                                              .createPassword.value &&
                                          optionController.checkPw.value
                                      ? const Color.fromRGBO(0, 179, 117, 1)
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
      }),
    );
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
                border: Border.all(color: Colors.black),
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '2',
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
        '아이디와 비밀번호를\n입력해 주세요.',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
      ));
}

Widget _createId(OptionController optionController) {
  return Obx(() {
    return TextField(
      onChanged: (text) {
        if (text.isNotEmpty) {
          optionController.idIconVisible(true);
        } else {
          optionController.idIconVisible(false);
        }

        if (text.length > 3) {
          optionController.createId(true);
        } else {
          optionController.createId(false);
        }
      },
      style: const TextStyle(fontSize: 20),
      cursorColor: main_color,
      decoration: InputDecoration(
          suffixIcon: optionController.idIconVisible.value
              ? SizedBox(
                  width: PhoneSize.width * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.check,
                        size: PhoneSize.width * 0.07,
                        color: optionController.createId.value
                            ? main_color
                            : Colors.grey.withOpacity(0.7),
                      )
                    ],
                  ),
                )
              : null,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: main_color, width: 1.5)),
          hintText: '아이디 (4~13자리 이내)',
          hintStyle:
              TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 18.0)),
    );
  });
}

Widget _createPassword(OptionController optionController) {
  return Obx(() {
    return TextField(
      controller: optionController.pwController,
      onChanged: (text) {
        if (text.isNotEmpty) {
          optionController.pwIconVisible(true);
        } else {
          optionController.pwIconVisible(false);
        }

        if (text.length >= 10 && text.length <= 20) {
          optionController.createPassword(true);
        } else {
          optionController.createPassword(false);
        }
      },
      style: TextStyle(
          color: optionController.pwVisible.value ? Colors.black : Colors.white,
          fontSize: 20),
      cursorColor: main_color,
      decoration: InputDecoration(
          suffixIcon: optionController.pwIconVisible.value
              ? SizedBox(
                  width: PhoneSize.width * 0.15,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          optionController
                              .pwVisible(!optionController.pwVisible.value);
                        },
                        child: Icon(
                          optionController.pwVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: PhoneSize.width * 0.07,
                          color: optionController.pwVisible.value
                              ? main_color
                              : Colors.grey.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        width: PhoneSize.width * 0.01,
                      ),
                      Icon(
                        Icons.check,
                        size: PhoneSize.width * 0.07,
                        color: optionController.createPassword.value
                            ? main_color
                            : Colors.grey.withOpacity(0.7),
                      )
                    ],
                  ),
                )
              : null,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: main_color, width: 1.5)),
          hintText: '비밀번호 (10~20자리 이내)',
          hintStyle:
              TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 18.0)),
    );
  });
}

Widget _checkPassword(OptionController optionController) {
  return Obx(() {
    return TextField(
      controller: optionController.pwCheckController,
      onChanged: (text) {
        if (text.isNotEmpty) {
          optionController.checkPWIconVisible(true);
        } else {
          optionController.checkPWIconVisible(false);
        }

        if (text == optionController.pwController.text) {
          optionController.checkPw(true);
        } else {
          optionController.checkPw(false);
        }
      },
      style: TextStyle(
          color: optionController.checkPwVisible.value
              ? Colors.black
              : Colors.white,
          fontSize: 20),
      cursorColor: main_color,
      decoration: InputDecoration(
          suffixIcon: optionController.checkPWIconVisible.value
              ? SizedBox(
                  width: PhoneSize.width * 0.15,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          optionController.checkPwVisible(
                              !optionController.checkPwVisible.value);
                        },
                        child: Icon(
                          optionController.checkPwVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: PhoneSize.width * 0.07,
                          color: optionController.checkPwVisible.value
                              ? main_color
                              : Colors.grey.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        width: PhoneSize.width * 0.01,
                      ),
                      Icon(
                        Icons.check,
                        size: PhoneSize.width * 0.07,
                        color: optionController.checkPw.value
                            ? main_color
                            : Colors.grey.withOpacity(0.7),
                      )
                    ],
                  ),
                )
              : null,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: main_color, width: 1.5)),
          hintText: '비밀번호 확인',
          hintStyle:
              TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 18.0)),
    );
  });
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_check/controller/option_controller.dart';
import 'package:setting_check/pages/sign_up_step/sign_up_step_first.dart';
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
      body: GetBuilder<OptionController>(builder: (optionController) {
        return Center(
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
                      TextField(
                        onChanged: (text) {
                          if (text.length > 3) {
                            optionController.createId(true);
                          } else {
                            optionController.createId(false);
                          }
                        },
                        style: const TextStyle(fontSize: 20),
                        cursorColor: main_color,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: main_color, width: 1.5)),
                            hintText: '아이디 (4~13자리 이내)',
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                                fontSize: 18.0)),
                      ),
                      SizedBox(
                        height: PhoneSize.height * 0.01,
                      ),
                      TextField(
                        controller: optionController.passwordController,
                        obscureText: true,
                        onChanged: (text) {
                          if (text.length > 9) {
                            optionController.createPassword(true);
                          } else {
                            optionController.createPassword(false);
                          }
                        },
                        style: const TextStyle(fontSize: 20),
                        cursorColor: main_color,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: main_color, width: 1.5)),
                            hintText: '비밀번호 (10~20자리 이내)',
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                                fontSize: 18.0)),
                      ),
                      SizedBox(
                        height: PhoneSize.height * 0.01,
                      ),
                      TextField(
                        controller: optionController.passwordCheckController,
                        obscureText: true,
                        onChanged: (text) {
                          if (text ==
                              optionController.passwordController.text) {
                            optionController.checkPassword(true);
                          } else {
                            optionController.checkPassword(false);
                          }
                        },
                        style: const TextStyle(fontSize: 20),
                        cursorColor: main_color,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: main_color, width: 1.5)),
                            hintText: '비밀번호 확인',
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                                fontSize: 18.0)),
                      ),
                    ],
                  )),
              Expanded(
                child: Padding(
                  padding:
                      main_padding.copyWith(bottom: PhoneSize.height * 0.015) *
                          2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          optionController.createId.value &&
                                  optionController.createPassword.value &&
                                  optionController.checkPassword.value
                              ? Get.to(const SignUpStepFirst())
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
                                color: optionController.createId.value &&
                                        optionController.createPassword.value &&
                                        optionController.checkPassword.value
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
        '아이디와 비밀번호를\n입력해 주세요.',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
      ));
}

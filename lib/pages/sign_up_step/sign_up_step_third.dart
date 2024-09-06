import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_check/controller/option_controller.dart';
import 'package:setting_check/pages/sign_up_step/sign_up_step_fourth.dart';
import 'package:setting_check/utils/colors.dart';
import 'package:setting_check/utils/paddings.dart';
import 'package:setting_check/utils/phone_size.dart';

class SignUpStepThird extends StatelessWidget {
  SignUpStepThird({super.key});

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
                  child: SizedBox(
                    height: PhoneSize.height * 0.08,
                    child: Column(children: [
                      SizedBox(
                        height: PhoneSize.height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: PhoneSize.width * 0.35,
                              child: const TextField(
                                style: TextStyle(fontSize: 20),
                                cursorColor: main_color,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(
                              child: Text(
                                '@',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            SizedBox(
                              width: PhoneSize.width * 0.35,
                              child: DropdownButton(
                                value: optionController.selected_email,
                                items: optionController.email.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (v) {
                                  optionController.update_dropDownEmail(v!);
                                },
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: PhoneSize.height * 0.02,
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ]),
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
                          padding: EdgeInsets.all(12 - PhoneSize.width * 0.015),
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
                            child: const Text(
                              '스타벅스커피 코리아의 새로운 서비스와 최신 이벤트 정보를 이메일로 보내드려요.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                    width: PhoneSize.width,
                    height: PhoneSize.height * 0.05,
                    padding: main_padding * 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12 - PhoneSize.width * 0.015),
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
                            child: const Text(
                              '주요 공지사항 및 이벤트 당첨안내 등 일부 소식은 수신동의 여부와 관계없이 발송됩니다.',
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
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(const SignUpStepFourth());
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
                border: Border.all(),
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '3',
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
        '이메일을\n입력해주세요.',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
      ));
}

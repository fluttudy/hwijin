import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:setting_check/controller/option_controller.dart';
import 'package:setting_check/pages/sign_up_step/sign_up_step_first.dart';
import 'package:setting_check/utils/paddings.dart';
import 'package:setting_check/utils/phone_size.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: GetBuilder<OptionController>(
              init: OptionController(),
              builder: (optionController) {
                return Column(
                  children: [
                    _appBar(),
                    Padding(
                        padding: EdgeInsets.fromLTRB(PhoneSize.width * 0.04, 0,
                            PhoneSize.width * 0.04, 0),
                        child: Column(
                          children: [
                            SizedBox(height: PhoneSize.height * 0.1),
                            SizedBox(
                              width: PhoneSize.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/logos/starbucks_logo.png',
                                    width: PhoneSize.width * 0.2,
                                  ),
                                  SizedBox(height: PhoneSize.height * 0.02),
                                  const Text(
                                    '고객님\n환영합니다!',
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: PhoneSize.height * 0.1,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                checkBox(
                                    "All",
                                    optionController.signUp_checkAll,
                                    optionController),
                                SizedBox(
                                  width: PhoneSize.width * 0.02,
                                ),
                                const Text(
                                  '약관 전체동의',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Divider(
                      height: PhoneSize.height * 0.04,
                      thickness: 1.0,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(PhoneSize.width * 0.04, 0,
                          PhoneSize.width * 0.04, PhoneSize.height * 0.03),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              checkBox(
                                  "First",
                                  optionController.signUp_checkFirst,
                                  optionController),
                              SizedBox(
                                width: PhoneSize.width * 0.02,
                              ),
                              const Text('이용약관 동의(필수)',
                                  style: TextStyle(fontSize: 18.0)),
                            ],
                          ),
                          SizedBox(
                            height: PhoneSize.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              checkBox(
                                  "Second",
                                  optionController.signUp_checkSecond,
                                  optionController),
                              SizedBox(
                                width: PhoneSize.width * 0.02,
                              ),
                              const Text('개인정보 수집 및 이용동의(필수)',
                                  style: TextStyle(fontSize: 18.0)),
                            ],
                          ),
                          SizedBox(
                            height: PhoneSize.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              checkBox(
                                  "Third",
                                  optionController.signUp_checkThird,
                                  optionController),
                              SizedBox(
                                width: PhoneSize.width * 0.02,
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('E-mail 및 SMS 광고성 정보 수신동의(선택)',
                                      style: TextStyle(fontSize: 18.0)),
                                  Text('다양한 프로모션 소식 및 신규 매장 정보를 보내 드립니다.',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.0)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(PhoneSize.width * 0.04, 0,
                            PhoneSize.width * 0.04, PhoneSize.height * 0.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                optionController.signUp_checkFirst &&
                                        optionController.signUp_checkSecond
                                    ? Get.to(const SignUpStepFirst())
                                    : null;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: PhoneSize.width,
                                height: PhoneSize.height * 0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(style: BorderStyle.none),
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: optionController.signUp_checkFirst &&
                                          optionController.signUp_checkSecond
                                      ? const Color.fromRGBO(0, 179, 117, 1)
                                      : Colors.grey.withOpacity(0.3),
                                ),
                                child: const Text(
                                  '다음',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}

Widget checkBox(
    String option, bool optionValue, OptionController optionController) {
  return Transform.scale(
    scale: 1.25,
    child: Checkbox(
      value: optionValue,
      onChanged: (value) {
        switch (option) {
          case "All":
            optionController.update_SignUpCheckAll(value!);
            break;
          case "First":
            optionController.update_SignUpCheckFirst(value!);
            break;
          case "Second":
            optionController.update_SignUpCheckSecond(value!);
            break;
          case "Third":
            optionController.update_SignUpCheckThird(value!);
            break;
        }
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

Widget _appBar() {
  return Container(
    height: PhoneSize.height * 0.1,
    padding: main_padding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.close,
            size: PhoneSize.width * 0.1,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

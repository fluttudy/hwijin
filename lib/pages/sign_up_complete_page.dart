// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_check/controller/option_controller.dart';
import 'package:setting_check/controller/textfield_controller.dart';
import 'package:setting_check/pages/coupon/coupon_page.dart';
import 'package:setting_check/utils/paddings.dart';
import 'package:setting_check/utils/phone_size.dart';

class SignUpComplete extends StatelessWidget {
  SignUpComplete({super.key});

  final optionController = Get.find<OptionController>();

  final textFieldController = Get.put(TextFieldController());

  final phoneNumberController = TextEditingController();

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
                          height: PhoneSize.height * 0.1,
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
                        '제공자: (주) 스타벅스커피 코리아',
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
                              Get.to(CouponPage());
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

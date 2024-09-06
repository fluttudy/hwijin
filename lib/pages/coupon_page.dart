import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_check/controller/option_controller.dart';
import 'package:setting_check/pages/coupon_add_page.dart';
import 'package:setting_check/utils/colors.dart';
import 'package:setting_check/utils/paddings.dart';
import 'package:setting_check/utils/phone_size.dart';

class CouponPage extends StatelessWidget {
  CouponPage({super.key});

  final optionController = Get.find<OptionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appbar(),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: PhoneSize.height * 0.03,
              ),
              _button(optionController),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '영수증 쿠폰 또는 MMS쿠폰을\n우측 상단 +버튼을 눌러 등록해보세요.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

AppBar _appbar() {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(Icons.arrow_back_ios)),
    title: const Text('Coupon'),
    centerTitle: true,
    actions: _actions(),
    shape: const Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    ),
  );
}

List<Widget> _actions() {
  return [
    Padding(
      padding: main_padding.copyWith(left: 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(CouponAddPage());
            },
            child: Icon(
              Icons.add,
              color: Colors.grey.withOpacity(0.5),
              size: PhoneSize.width * 0.08,
            ),
          ),
          SizedBox(
            width: PhoneSize.width * 0.02,
          ),
          Icon(
            Icons.info_outline,
            color: Colors.grey.withOpacity(0.5),
            size: PhoneSize.width * 0.08,
          ),
        ],
      ),
    )
  ];
}

Widget _button(OptionController optionController) {
  return Container(
    padding: main_padding,
    height: PhoneSize.height * 0.06,
    child: Obx(() {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              optionController.coupon_body(1);
            },
            child: Container(
              alignment: Alignment.center,
              width: PhoneSize.width * 0.45,
              height: PhoneSize.height * 0.06,
              decoration: BoxDecoration(
                  color: optionController.coupon_body.value == 1
                      ? main_color
                      : Colors.white,
                  border: Border(
                      bottom: BorderSide(
                        color: optionController.coupon_body.value == 1
                            ? main_color
                            : Colors.grey,
                      ),
                      left: BorderSide(
                        color: optionController.coupon_body.value == 1
                            ? main_color
                            : Colors.grey,
                      ),
                      top: BorderSide(
                        color: optionController.coupon_body.value == 1
                            ? main_color
                            : Colors.grey,
                      )),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
              child: Text(
                '사용 가능한 쿠폰',
                style: TextStyle(
                    color: optionController.coupon_body.value == 1
                        ? Colors.white
                        : Colors.grey),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              optionController.coupon_body(2);
            },
            child: Container(
              alignment: Alignment.center,
              width: PhoneSize.width * 0.45,
              height: PhoneSize.height * 0.06,
              decoration: BoxDecoration(
                  color: optionController.coupon_body.value == 2
                      ? main_color
                      : Colors.white,
                  border: Border(
                      bottom: BorderSide(
                        color: optionController.coupon_body.value == 2
                            ? main_color
                            : Colors.grey,
                      ),
                      right: BorderSide(
                        color: optionController.coupon_body.value == 2
                            ? main_color
                            : Colors.grey,
                      ),
                      top: BorderSide(
                        color: optionController.coupon_body.value == 2
                            ? main_color
                            : Colors.grey,
                      )),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Text(
                '쿠폰 히스토리',
                style: TextStyle(
                    color: optionController.coupon_body.value == 2
                        ? Colors.white
                        : Colors.grey),
              ),
            ),
          ),
        ],
      );
    }),
  );
}

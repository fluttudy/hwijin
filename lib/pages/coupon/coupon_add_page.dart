// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_check/controller/option_controller.dart';
import 'package:setting_check/utils/colors.dart';
import 'package:setting_check/utils/paddings.dart';
import 'package:setting_check/utils/phone_size.dart';

enum RaidoValues { Receipt, MMS }

class CouponAddPage extends StatefulWidget {
  const CouponAddPage({super.key});

  @override
  State<CouponAddPage> createState() => _CouponAddPageState();
}

class _CouponAddPageState extends State<CouponAddPage> {
  final optionController = Get.find<OptionController>();

  var _selected_radio_value = RaidoValues.Receipt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: _appbar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: PhoneSize.height * 0.03,
            ),
            Padding(
              padding: main_padding,
              child: SizedBox(
                width: PhoneSize.width,
                height: PhoneSize.height * 0.13,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('영수증 쿠폰 또는 MMS 쿠폰 중 등록할 쿠폰을 선택해주세요.',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: PhoneSize.width * 0.45,
                          height: PhoneSize.height * 0.1,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text('영수증 쿠폰'),
                            leading: Radio(
                              activeColor: Colors.brown[400],
                              value: RaidoValues.Receipt,
                              groupValue: _selected_radio_value,
                              onChanged: (value) {
                                setState(() {
                                  _selected_radio_value = value!;
                                });
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: PhoneSize.width * 0.45,
                          height: PhoneSize.height * 0.1,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text('MMS 쿠폰'),
                            leading: Radio(
                              activeColor: Colors.brown[400],
                              value: RaidoValues.MMS,
                              groupValue: _selected_radio_value,
                              onChanged: (value) {
                                setState(() {
                                  _selected_radio_value = value!;
                                });
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: main_padding,
              child: SizedBox(
                height: PhoneSize.height * 0.13,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '영수증 쿠폰번호 17자리를 입력하세요.',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: PhoneSize.height * 0.02,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: PhoneSize.width * 0.15,
                            height: PhoneSize.height * 0.07,
                            child: const TextField(
                              cursorColor: main_color,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: main_color, width: 1.5)),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: PhoneSize.width * 0.02,
                          ),
                          width: PhoneSize.width * 0.02,
                          height: PhoneSize.height * 0.002,
                          color: Colors.black,
                        ),
                        SizedBox(
                            width: PhoneSize.width * 0.2,
                            height: PhoneSize.height * 0.07,
                            child: const TextField(
                              cursorColor: main_color,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: main_color, width: 1.5)),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: PhoneSize.width * 0.02,
                          ),
                          width: PhoneSize.width * 0.02,
                          height: PhoneSize.height * 0.002,
                          color: Colors.black,
                        ),
                        SizedBox(
                            width: PhoneSize.width * 0.17,
                            height: PhoneSize.height * 0.07,
                            child: const TextField(
                              cursorColor: main_color,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: main_color, width: 1.5)),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: PhoneSize.width * 0.02,
                          ),
                          width: PhoneSize.width * 0.02,
                          height: PhoneSize.height * 0.002,
                          color: Colors.black,
                        ),
                        SizedBox(
                            width: PhoneSize.width * 0.2,
                            height: PhoneSize.height * 0.07,
                            child: const TextField(
                              cursorColor: main_color,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: main_color, width: 1.5)),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: PhoneSize.height * 0.02,
            ),
            Padding(
              padding: main_padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('쿠폰 등록코드 8자리를 입력해주세요.',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: PhoneSize.height * 0.02,
                  ),
                  SizedBox(
                      width: PhoneSize.width,
                      height: PhoneSize.height * 0.07,
                      child: const TextField(
                        cursorColor: main_color,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: main_color, width: 1.5)),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: PhoneSize.height * 0.02,
            ),
            Padding(
              padding: main_padding,
              child: Container(
                width: PhoneSize.width,
                height: PhoneSize.height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.brown[100],
                    border: Border.all(style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(5)),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '바코드 인식하기',
                      style: TextStyle(
                        color: Colors.brown[400],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: PhoneSize.height * 0.02,
            ),
            Padding(
              padding: main_padding,
              child: SizedBox(
                  width: PhoneSize.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12 - PhoneSize.width * 0.015),
                        child: Icon(
                          Icons.circle,
                          color: Colors.grey,
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
                            '등록된 쿠폰은 해당 계정에 등록된 스타벅스카드 또는 쿠폰의 QR코드를 제시하여 사용하실 수 있습니다.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: main_padding,
              child: SizedBox(
                  width: PhoneSize.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12 - PhoneSize.width * 0.015),
                        child: Icon(
                          Icons.circle,
                          color: Colors.grey,
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
                            '쿠폰 및 실물 쿠폰은 상업적으로 이용할 수 없으며, 스타벅스에서 제공하는 쿠폰 선물하기 기능 외 방법으로 전달된 쿠폰 사용으로 인해 발생된 문제에 대해서는 스타벅스가 책임지지 않습니다.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: main_padding,
              child: SizedBox(
                  width: PhoneSize.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12 - PhoneSize.width * 0.015),
                        child: Icon(
                          Icons.circle,
                          color: Colors.grey,
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
                            '쿠폰이 발행된 원 거래가 취소되는 경우, 등록된 쿠폰도 즉시 회수됩니다.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: main_padding,
              child: SizedBox(
                  width: PhoneSize.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12 - PhoneSize.width * 0.015),
                        child: Icon(
                          Icons.circle,
                          color: Colors.grey,
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
                            '쿠폰으로 등록한 영수증 쿠폰은 등록해지가 불가능하며, 등록 이후 기존의 실물 쿠폰은 더 이상 사용하실 수 없습니다.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Padding(
                padding:
                    main_padding.copyWith(bottom: PhoneSize.height * 0.015),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Obx(
                        () {
                          return Container(
                            alignment: Alignment.center,
                            width: PhoneSize.width,
                            height: PhoneSize.height * 0.07,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0),
                              borderRadius: BorderRadius.circular(5.0),
                              color: optionController.createId.value &&
                                      optionController.createPassword.value &&
                                      optionController.checkPw.value
                                  ? const Color.fromRGBO(0, 179, 117, 1)
                                  : Colors.grey,
                            ),
                            child: const Text(
                              '등록하기',
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
        ));
  }
}

AppBar _appbar() {
  return AppBar(
    backgroundColor: Colors.white,
    leading: const Icon(Icons.arrow_back_ios),
    title: const Text('Coupon 등록'),
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
      child: Icon(
        Icons.info_outline,
        color: Colors.grey.withOpacity(0.5),
        size: PhoneSize.width * 0.08,
      ),
    )
  ];
}

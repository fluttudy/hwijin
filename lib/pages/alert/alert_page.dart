// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:setting_check/utils/colors.dart';
import 'package:setting_check/utils/paddings.dart';
import 'package:setting_check/utils/phone_size.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  var selected_dropdown_value = '전체';

  var dropdown_values = ['전체', '이벤트', '알림'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: _appbar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dropDown(
              selected_dropdown_value,
              dropdown_values,
              (value) {
                setState(() {
                  selected_dropdown_value = value!;
                });
              },
            ),
            SizedBox(height: PhoneSize.height * 0.025),
            _dropDownBody()
          ],
        ));
  }
}

AppBar _appbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: const Icon(Icons.arrow_back_ios),
    title: const Text(
      '알림',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: _actions(context),
    shape: const Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    ),
  );
}

List<Widget> _actions(BuildContext context) {
  return [
    Padding(
      padding: main_padding.copyWith(left: 0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  title: const Text(
                    '알림함의 모든 메세지를 삭제하시겠어요?',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  content: SizedBox(
                    width: PhoneSize.width * 0.9,
                    height: PhoneSize.height * 0.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: PhoneSize.width * 0.2,
                                  height: PhoneSize.height * 0.05,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: main_color, width: 1.0),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: const Text(
                                    '아니오',
                                    style: TextStyle(color: main_color),
                                  )),
                            ),
                            SizedBox(width: PhoneSize.width * 0.025),
                            Container(
                                width: PhoneSize.width * 0.2,
                                height: PhoneSize.height * 0.05,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: main_color,
                                    border: Border.all(
                                        color: main_color, width: 1.0),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: const Text(
                                  '전체 삭제',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(
          Icons.delete_outline,
          color: Colors.grey.withOpacity(0.5),
          size: PhoneSize.width * 0.08,
        ),
      ),
    )
  ];
}

Widget _dropDown(String selectedValue, List<String> values, var callBack) {
  return Padding(
    padding: main_padding,
    child: SizedBox(
      width: PhoneSize.width,
      child: DropdownButton(
        value: selectedValue,
        items: values.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
          );
        }).toList(),
        onChanged: callBack,
        icon: const Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _dropDownBody() {
  return Expanded(
    child: Padding(
      padding: main_padding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _order_alert(),
            _order_alert(),
            _order_alert(),
            _event_alert(),
            _order_alert(),
            _order_alert(),
            _order_alert(),
            _event_alert(),
            _order_alert(),
            _order_alert(),
            _order_alert(),
            _event_alert(),
          ],
        ),
      ),
    ),
  );
}

Widget _order_alert() {
  return SizedBox(
    width: PhoneSize.width,
    height: PhoneSize.height * 0.15,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: PhoneSize.width * 0.025),
        const Icon(Icons.coffee),
        SizedBox(width: PhoneSize.width * 0.05),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _main_description('A-24'),
            _sub_description(),
            _date_description(),
          ],
        ),
        const Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.keyboard_arrow_down),
          ],
        )),
      ],
    ),
  );
}

Widget _main_description(String orderNumber) {
  return Text(
    '메뉴가 모두 준비되었어요. ($orderNumber)',
    style: const TextStyle(fontSize: 16.0),
  );
}

Widget _sub_description() {
  return const Text(
    '픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
    style: TextStyle(fontSize: 16.0),
  );
}

Widget _date_description() {
  return const Text(
    '2021.03.05 17:44:41',
    style: TextStyle(color: Colors.grey, fontSize: 14.0),
  );
}

Widget _event_alert() {
  return SizedBox(
    width: PhoneSize.width,
    height: PhoneSize.height * 0.1,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: PhoneSize.width * 0.025),
        const Icon(Icons.star_border_outlined),
        SizedBox(width: PhoneSize.width * 0.05),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '지금 마이 스타벅스 리뷰에 참여해보세요!',
              style: TextStyle(fontSize: 16.0),
            ),
            _date_description(),
          ],
        ),
        const Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.keyboard_arrow_right),
          ],
        )),
      ],
    ),
  );
}

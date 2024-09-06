// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionController extends GetxController {
  // SignUp Page
  bool signUp_checkAll = false;
  bool signUp_checkFirst = false;
  bool signUp_checkSecond = false;
  bool signUp_checkThird = false;

  // SignUp Step First  Page
  bool signUp_FirstStep = false;
  final phoneNumberValidation = false.obs;
  final phoneNumberAuthentication = false.obs;

  // SignUp Step Second Page
  final pwController = TextEditingController();
  final pwCheckController = TextEditingController();

  final createId = false.obs;
  final idIconVisible = false.obs;

  final createPassword = false.obs;
  final pwVisible = false.obs;
  final pwIconVisible = false.obs;

  final checkPw = false.obs;
  final checkPwVisible = false.obs;
  final checkPWIconVisible = false.obs;

  // DropDown
  var agency = ['SKT', 'KT', 'LG U+'];
  var agency_value = 'SKT';
  var email = ['gmail.com', 'naver.com', 'daum.net'];
  var selected_email = 'gmail.com';

  void update_SignUpCheckAll(bool value) {
    signUp_checkAll = value;
    signUp_checkFirst = value;
    signUp_checkSecond = value;
    signUp_checkThird = value;
    update();
  }

  void update_SignUpCheckFirst(bool value) {
    if (value == false && signUp_checkAll == true) signUp_checkAll = false;
    signUp_checkFirst = value;
    update();
  }

  void update_SignUpCheckSecond(bool value) {
    if (value == false && signUp_checkAll == true) signUp_checkAll = false;
    signUp_checkSecond = value;
    update();
  }

  void update_SignUpCheckThird(bool value) {
    if (value == false && signUp_checkAll == true) signUp_checkAll = false;
    signUp_checkThird = value;
    update();
  }

  dynamic update_SignUpFirstStep(bool value) {
    signUp_FirstStep = value;
    update();
  }

  void update_dropDownAgency(String value) {
    agency_value = value;
    update();
  }

  void update_dropDownEmail(String value) {
    selected_email = value;
    update();
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class OptionController extends GetxController {
  // SignUp Page
  bool signUp_checkAll = false;
  bool signUp_checkFirst = false;
  bool signUp_checkSecond = false;
  bool signUp_checkThird = false;

  // SignUp First Step Page
  bool signUp_FirstStep = false;
  final phoneNumberValidation = false.obs;
  final phoneNumberAuthentication = false.obs;

  // SignUp First Second Page
  final createAccount = false.obs;

  // DropDown
  var agency = ['SKT', 'KT', 'LG U+'];
  var agency_value = 'SKT';

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

  void update_dropDown(String value) {
    agency_value = value;
    update();
  }
}

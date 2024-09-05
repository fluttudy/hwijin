import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_check/pages/sign_up_page.dart';
import 'package:setting_check/utils/phone_size.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(Icons.arrow_back_ios),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(PhoneSize.width * 0.04, 0,
                PhoneSize.width * 0.04, PhoneSize.height * 0.03),
            child: Column(
              children: [
                // 로그인 글씨 (높이: PhoneSize.height * 0.1)
                SizedBox(
                  height: PhoneSize.height * 0.05,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '로그인',
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: PhoneSize.height * 0.05),

                // 인삿말
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
                        '안녕하세요.\n스타벅스입니다.',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      const Text(
                        '회원 서비스 이용을 위해 로그인 해주세요.',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: PhoneSize.height * 0.05),

                // 아이디, 비밀번호 입력
                Column(
                  children: [
                    TextField(
                      controller: _idController,
                      decoration: InputDecoration(
                          hintText: '아이디',
                          hintStyle: const TextStyle(fontSize: 16.0),
                          isCollapsed: true,
                          contentPadding: EdgeInsets.fromLTRB(
                              0, 0, 0, PhoneSize.height * 0.005),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: PhoneSize.height * 0.05),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: '비밀번호',
                          hintStyle: const TextStyle(fontSize: 16.0),
                          isCollapsed: true,
                          contentPadding: EdgeInsets.fromLTRB(
                              0, 0, 0, PhoneSize.height * 0.005),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: PhoneSize.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '아이디 찾기',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          height: PhoneSize.height * 0.02,
                          child: const VerticalDivider(
                            color: Colors.grey,
                            thickness: 1.0,
                          ),
                        ),
                        const Text(
                          '비밀번호 찾기',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          height: PhoneSize.height * 0.02,
                          child: const VerticalDivider(
                            color: Colors.grey,
                            thickness: 1.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const SignUpPage());
                          },
                          child: const Text(
                            '회원 가입',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: PhoneSize.height * 0.03),

                // 로그인 버튼
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: PhoneSize.width,
                        height: PhoneSize.height * 0.07,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0),
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color.fromRGBO(0, 179, 117, 1),
                        ),
                        child: const Text(
                          '로그인하기',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

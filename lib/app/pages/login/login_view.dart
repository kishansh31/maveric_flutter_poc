import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maveric_flutter_poc/app/utils/const_font_styles.dart';
import 'package:maveric_flutter_poc/app/utils/const_strings.dart';
import 'package:maveric_flutter_poc/app/widget/banner_image.dart';
import 'package:maveric_flutter_poc/app/widget/login_text_field.dart';

import 'login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SafeArea(
        child: Obx(() {
          return Container(
            color: Colors.white,
            child: Stack(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    BannerImage('assets/mav_logo.png', 80),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginTextFiled(
                          loginController,
                          100,
                          Center(
                            child: TextField(
                              controller: loginController.mobileController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ConstStrings.str_mobile,
                                hintStyle: kLableEditTextHintLogin,
                              ),
                              style: kLableEditTextLogin,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: loginController.isOtpSend.value,
                          child: LoginTextFiled(
                            loginController,
                            20,
                            Center(
                              child: TextField(
                                controller: loginController.otpController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: ConstStrings.str_otp,
                                  hintStyle: kLableEditTextHintLogin,
                                ),
                                style: kLableEditTextLogin,
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            loginController.changeButtonStatus();
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 50, left: 20.0, right: 20.0),
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.blueGrey,
                            ),
                            child: Center(
                              child: Text(
                                loginController.isOtpSend.value ? ConstStrings.str_login : ConstStrings.str_get_otp,
                                style: kLableButtonWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  child: Visibility(
                    visible: loginController.isLoading.value ? true : false,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
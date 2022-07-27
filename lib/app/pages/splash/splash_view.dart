import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:maveric_flutter_poc/app/pages/splash/splash_controller.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.green,
          // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark,
          //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.dark, //<-- For iOS SEE HERE (dark icons)
        ),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 80),
        child: Center(
          child: Image.asset('assets/mav_logo.png'),
        ),
      ),
    );
  }
}

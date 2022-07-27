import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:maveric_flutter_poc/app/pages/splash/splash_controller.dart';
import 'package:maveric_flutter_poc/app/widget/banner_image.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark,
          //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.dark, //<-- For iOS SEE HERE (dark icons)
        ),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              BannerImage('assets/mav_logo.png', 80),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Visibility(
                  visible: splashController.isLoading.value ? true : false,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.red,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.amber,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

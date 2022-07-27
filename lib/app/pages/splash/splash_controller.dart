import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maveric_flutter_poc/app/pages/login/login_screen.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void redierction() {
    Get.to(LoginScreen());
  }
}
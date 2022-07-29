import 'package:get/get.dart';
import 'package:maveric_flutter_poc/app/pages/translate/localization_screen.dart';

class HomeScreenController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void redirectToLocalization() {
    Get.to(() => LocalizationScreen());
  }

}
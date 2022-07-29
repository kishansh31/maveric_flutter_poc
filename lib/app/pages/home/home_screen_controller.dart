import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:maveric_flutter_poc/app/pages/login/login_view.dart';
import 'package:maveric_flutter_poc/app/pages/translate/localization_screen.dart';

class HomeScreenController extends GetxController{

  final List<String> items = ['Translator','REST APIS', 'Logout'];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void redirectToLocalization() {
    Get.to(() => LocalizationScreen());
  }

  void redirectionEvent(int index) {
    if(index == 0) {
      // Open the Localization screen..
      Get.to(() => LocalizationScreen());
    } else if(index == 1) {
      // Open the REST API screen..
      // Asof now we don't have any thing..
    } else if(index == 2) {
      // Logout function from here..
      _signOut();
      Get.offAll(() => LoginView());
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

}
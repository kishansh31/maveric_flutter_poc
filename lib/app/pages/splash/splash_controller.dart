import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maveric_flutter_poc/app/pages/home/home_screen.dart';
import 'package:maveric_flutter_poc/app/pages/login/login_screen.dart';

class SplashController extends GetxController{

  FirebaseAuth _auth;
  User _user;

  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print('Entered onInit method status for isLoading is : '+isLoading.value.toString());

    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;


    print('Firebase initialization is completed status for isLoading is : '+isLoading.value.toString());

    Future.delayed(const Duration(seconds: 3), () {
      isLoading(false);
      checkForRedierctions();
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void redierction() {
    Get.to(LoginScreen());
  }

  void checkForRedierctions() {
    print('Future.delay is executed after 3 sec. duration');
    print('User data 1 is : '+_user.displayName.toString());
    print('User data 2 is : '+_user.phoneNumber.toString());
    print('User data 3 is : '+_user.email.toString());

    // Now we are checking for the condition here..
    // If user has already logged in the application then we will redirect to home screen..
    // Otherwise we have redire the user to Login screen..

    if(_user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maveric_flutter_poc/app/pages/home/home_screen.dart';
import 'package:maveric_flutter_poc/app/pages/login/login_screen.dart';
import 'package:maveric_flutter_poc/app/pages/login/login_view.dart';

class SplashController extends GetxController{

  late FirebaseAuth _auth;
  // late User _user;

  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print('Entered onInit method status for isLoading is : '+isLoading.value.toString());

    // _auth = FirebaseAuth.instance;
    // print('Spalsh controller _auth.currentUser : '+_auth.currentUser.toString());
    // _user = (_auth.currentUser??"") as User;
    // _user = FirebaseAuth.instance.currentUser!;
    // _user = (FirebaseAuth.instance.currentUser.toString()??"") as User;

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
    if(FirebaseAuth.instance.currentUser != null) {
      print('User data 2 is : '+FirebaseAuth.instance.currentUser!.phoneNumber.toString());
      print('User data 1 is : '+FirebaseAuth.instance.currentUser!.displayName.toString());
      print('User data 3 is : '+FirebaseAuth.instance.currentUser!.email.toString());
    } else {
      print('Sorry we don\'t find user\'s data');
    }

    // Now we are checking for the condition here..
    // If user has already logged in the application then we will redirect to home screen..
    // Otherwise we have redire the user to Login screen..

    if(FirebaseAuth.instance.currentUser == null) {
      // Get.offAll(() => LoginScreen());
      Get.offAll(() => LoginView());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }
}
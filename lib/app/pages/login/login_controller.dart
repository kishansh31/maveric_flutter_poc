import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maveric_flutter_poc/app/pages/home/home_screen.dart';

class LoginController extends GetxController {
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  var isLoading = false.obs;
  var isOtpSend = false.obs;

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId;

  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    isLoading(true);
    /*setState(() {
      showLoading = true;
    });*/
    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);

      isLoading(false);

      /*setState(() {
        showLoading = false;
      });*/

      if (authCredential?.user != null) {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        Get.to(() => HomeScreen());
        Get.snackbar("title", "message");
      }
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      /*setState(() {
        showLoading = false;
      });*/
      Get.snackbar("Error", e.message.toString());

      /*_scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));*/
    }
  }

  void changeButtonStatus() {
    if(isOtpSend.value) {
      PhoneAuthCredential phoneAuthCredential =
      PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpController.text);

      signInWithPhoneAuthCredential(phoneAuthCredential);
    } else {
      isOtpSend(true);
      isLoading(true);

      sendOtp();
    }
  }

  void sendOtp() async{
    await _auth.verifyPhoneNumber(
      phoneNumber: mobileController.text,
      verificationCompleted: (phoneAuthCredential) async {
        isLoading(false);
        /*setState(() {
          showLoading = false;
        });*/
        //signInWithPhoneAuthCredential(phoneAuthCredential);
      },
      verificationFailed: (verificationFailed) async {
        isLoading(false);
        /*setState(() {
          showLoading = false;
        });*/
        Get.snackbar("Error", verificationFailed.message.toString());
        /*_scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(verificationFailed.message)));*/
      },
      codeSent: (verificationId, resendingToken) async {
        isLoading(false);
        this.verificationId = verificationId;
        /*setState(() {
          showLoading = false;
          currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
          this.verificationId = verificationId;
        });*/
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }
}

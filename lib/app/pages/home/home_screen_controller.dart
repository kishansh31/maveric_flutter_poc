import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maveric_flutter_poc/app/api/post_page.dart';
import 'package:maveric_flutter_poc/app/pages/login/login_view.dart';
import 'package:maveric_flutter_poc/app/pages/rest_api/population_list.dart';
import 'package:maveric_flutter_poc/app/pages/translate/localization_screen.dart';
import 'package:maveric_flutter_poc/app/utils/custom_dialogs.dart';

class HomeScreenController extends GetxController {
  BuildContext context;

  HomeScreenController({this.context});

  final List<String> items = ['Translator', 'REST APIS', 'Popups', 'GetX Popup', 'REST APIS 1', 'Logout'];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void redirectToLocalization() {
    Get.to(() => LocalizationScreen());
  }

  void redirectionEvent(int index) {
    if (index == 0) {
      // Open the Localization screen..
      Get.to(() => LocalizationScreen());
    } else if (index == 1) {
      // Open the REST API screen..
      // As of now we don't have any thing..
      Get.to(() => PopulationList());
    } else if (index == 2) {
      // CustomDialogTwo("title", "description", "btn1", "btn2");
      showDialogSampleUsingCommonComponents();
    } else if (index == 3) {
      showPopupGetX();
    } else if (index == 4) {
      Get.to(() =>  const PostPage());
    }
    else if (index == 5) {
      // Logout function from here..
      _signOut();
      Get.offAll(() => LoginView());
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void showDialogSampleUsingCommonComponents() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogTwo(
              "Test Title",
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
              "Btn 1",
              "Btn 2",
                  () {
                print("Clicked on button 1");
                Navigator.pop(context);
              },
                  () {
                print("Clicked on button 2");
                Navigator.pop(context);
              });
        });
  }

  void showPopupGetX() {
    Get.defaultDialog(
      title: 'Getx Popup',
      titlePadding: EdgeInsets.only(top: 20.0),
      titleStyle: TextStyle(
        fontSize: 13.0,
        color: Colors.black,
        fontFamily: 'Poppins Bold',
        height: 1.0,
      ),
      radius: 10.0,
      backgroundColor: Colors.white,
      content: Container(
        height: 100.0,
        width: 300.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Text(
                'Content for Getx Popup: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                  fontFamily: 'Poppins Regular',
                  height: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('Clicked on Btn 1');
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        margin: EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blue,
                        ),
                        child: Text(
                          'Btn 1',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontFamily: 'Poppins Regular',
                            height: 1.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('Clicked on Btn 2');
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        margin: EdgeInsets.only(left: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.teal,
                        ),
                        child: Text(
                          'Btn 2',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontFamily: 'Poppins Regular',
                            height: 1.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

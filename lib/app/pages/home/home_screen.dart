import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maveric_flutter_poc/app/pages/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: GestureDetector(
            onTap: () {
              homeScreenController.redirectToLocalization();
            },
            child: Container(
              color: Colors.teal,
              height: 50,
              width: 200,
              child: Center(
                child: Text(
                  'Localization',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

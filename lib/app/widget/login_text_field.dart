import 'package:flutter/material.dart';
import 'package:maveric_flutter_poc/app/pages/login/login_controller.dart';

class LoginTextFiled extends StatelessWidget {
  LoginTextFiled(this.loginController, this.margin_top, this.custom_widget);

  final LoginController loginController;
  final Widget custom_widget;
  final double margin_top;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin_top, left: 20.0, right: 20.0),
      padding: EdgeInsets.only(left: 10.0),
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 0.6),
      ),
      child: custom_widget,
    );
  }
}
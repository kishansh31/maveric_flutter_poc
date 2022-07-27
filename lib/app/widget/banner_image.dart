import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final String img_string;
  final double padding;

  BannerImage(this.img_string, this.padding);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Center(
        // child: Image.asset('assets/mav_logo.png'),
        child: Image.asset(img_string),
      ),
    );
  }
}
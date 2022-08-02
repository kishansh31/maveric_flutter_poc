import 'package:flutter/material.dart';

class CustomDialogTwo extends StatelessWidget {
  final String title, description, btn1, btn2;
  final Function onPress1, onPress2;

  // final Function onPress1, onPress2;

  CustomDialogTwo(this.title, this.description, this.btn1, this.btn2, this.onPress1, this.onPress2);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 50.0,
          maxHeight: 220.0,
        ),
        child: Container(
          width: double.infinity,
          // height: 160.0,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          margin: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 0),
                blurRadius: 0,
              ),
            ],
          ),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Circular Medium',
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Circular Book',
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 30.0,
                  // margin: EdgeInsets.symmetric(horizontal: 4.0),
                  margin: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 4.0, top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: onPress1,
                          child: Container(
                            height: double.infinity,
                            margin: EdgeInsets.only(right: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Text(
                                btn1,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'Circular Book',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: onPress2,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.blueGrey,
                            ),
                            child: Center(
                              child: Text(
                                btn2,
                                // style: kDataLoginSignUpSlider,
                                style: TextStyle(
                                  fontFamily: 'Circular Medium',
                                  fontSize: 13.0,
                                  color: Colors.white,
                                ),
                              ),
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
        ),
      ),
    );
  }
}

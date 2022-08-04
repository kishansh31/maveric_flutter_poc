// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
// import 'LoginPresenter.dart';
//
// class LoginController1 extends Controller {
//   int _counter;
//   User _user;
//   int get counter => _counter;
//   User get user => _user; // data used by the View
//   final LoginPresenter loginPresenter;
//   // Presenter should always be initialized this way
//   LoginController1()
//       : _counter = 0,
//         loginPresenter = LoginPresenter(),
//         super();
//
//   @override
//   // this is called automatically by the parent class
//   void initListeners() {
//     LoginPresenter.getUserOnNext = (User user) {
//       print(user.toString());
//       _user = user;
//       refreshUI(); // Refreshes the UI manually
//     };
//     homePresenter.getUserOnComplete = () {
//       print('User retrieved');
//     };
//
//     // On error, show a snackbar, remove the user, and refresh the UI
//     homePresenter.getUserOnError = (e) {
//       print('Could not retrieve user.');
//       ScaffoldMessenger.of(getContext())
//           .showSnackBar(SnackBar(content: Text(e.message)));
//       _user = null;
//       refreshUI(); // Refreshes the UI manually
//     };
//   }
//
//   void buttonPressed() {
//     _counter++;
//     refreshUI();
//   }
//
//   @override
//   void onResumed() => print('On resumed');
//
//   @override
//   void onReassembled() => print('View is about to be reassembled');
//
//   @override
//   void onDeactivated() => print('View is about to be deactivated');
//
//
//   void refreshUI() {}
// }

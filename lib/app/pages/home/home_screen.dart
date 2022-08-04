import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maveric_flutter_poc/app/pages/home/home_screen_controller.dart';
import 'package:maveric_flutter_poc/app/utils/const_font_styles.dart';
import 'package:maveric_flutter_poc/app/utils/const_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // HomeScreenController homeScreenController = Get.put(HomeScreenController(context: context));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    HomeScreenController homeScreenController = Get.put(HomeScreenController(context: context));

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarIconBrightness: Brightness.light,
        ),
        // toolbarHeight: 0,
        elevation: 0,
        title: Text(ConstStrings.str_home_screen),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: homeScreenController.items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  homeScreenController.redirectionEvent(index);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        homeScreenController.items[index].toString(),
                        style: kLableButtonWhite,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/*class _HomeScreenState extends State<HomeScreen> {
  static const String _title = 'Home Page';
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.blue,
              // <-- SEE HERE
              statusBarIconBrightness: Brightness.light,
              //<-- For Android SEE HERE (dark icons)
              statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
            // toolbarHeight: 0,
            elevation: 0,
            title: const Text(_title)),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {
              Get.to(() => LoginView());
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              Get.to(() => const LocalizationScreen());
            },
            child: const Text('Translator'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              //Get.to(() => const RestAPI());
            },
            child: const Text('Rest API'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              Future<void> _signOut() async {
                await FirebaseAuth.instance.signOut();
              }

              _signOut();
              Get.offAll(() => LoginView());
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}*/
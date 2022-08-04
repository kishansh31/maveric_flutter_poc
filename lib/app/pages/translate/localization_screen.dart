import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maveric_flutter_poc/app/pages/translate/world_language.dart';

class LocalizationScreen extends StatefulWidget {
  const LocalizationScreen({Key? key}) : super(key: key);


  @override
  State<LocalizationScreen> createState() => _LocalizationScreenState();
}

class _LocalizationScreenState extends State<LocalizationScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      GetMaterialApp(
        home: const LocalizationScreen(),
        translations:
            WorldLanguage(), //Language class from world_languages.dart
        locale: const Locale(
            'ts', 'IN'), // translations will be displayed in that locale
        fallbackLocale: const Locale('ts',
            'IN'), // specify the fallback locale in case an invalid locale is selected.
      ),
    );
    return Scaffold(
      appBar: AppBar(
          title: const Text("Language Translation"),
          backgroundColor: Colors.deepOrangeAccent),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text("hello".tr),
            Text("going".tr),
            Text("email"
                .trParams({'name': 'John', 'email': 'johnabc@gmail.com'})),
            ElevatedButton(
              onPressed: () {
                var locale = const Locale('en', 'IN');
                Get.updateLocale(locale);
                //you can save this language on preference, and get on app start
              },
              child: const Text("Translate to English"),
            ),
            ElevatedButton(
              onPressed: () {
                var locale = const Locale('hi', 'IN');
                Get.updateLocale(locale);
                //you can save this language on preference, and get on app start
              },
              child: const Text("Translate to Hindi"),
            ),
            ElevatedButton(
              onPressed: () {
                var locale = const Locale('ts', 'IN');
                Get.updateLocale(locale);
                //you can save this language on preference, and get on app start
              },
              child: const Text("Translate to Telugu"),
            ),
            ElevatedButton(
              onPressed: () {
                var locale = const Locale('tm', 'IN');
                Get.updateLocale(locale);
                //you can save this language on preference, and get on app start
              },
              child: const Text("Translate to Tamil"),
            )
          ],
        ),
      ),
    );
  }
}

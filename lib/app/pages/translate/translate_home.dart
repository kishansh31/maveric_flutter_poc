import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:maveric_flutter_poc/app/pages/translate/world_language.dart';

import 'localization_screen.dart';

class TranslateHome extends StatefulWidget {
  const TranslateHome({Key key}) : super(key: key);


  @override
  State<TranslateHome> createState() => _TranslateHomeState();
}

class _TranslateHomeState extends State<TranslateHome> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(GetMaterialApp(
      home: const LocalizationScreen(),
      translations: WorldLanguage(), //Language class from world_languages.dart
      locale: const Locale(
          'ts', 'IN'), // translations will be displayed in that locale
      fallbackLocale: const Locale('ts',
          'IN'), // specify the fallback locale in case an invalid locale is selected.
    ));
  }
  }


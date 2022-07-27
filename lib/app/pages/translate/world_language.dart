import 'package:get/get.dart';

class WorldLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_IN': {
          'hello': 'Hello, How are you?',
          'going': 'Where are you going?',
          'email': 'Hello @name, your email is @email'
        },
        'hi_IN': {
          'hello': 'नमस्ते, आप कैसे हैं?',
          'going': 'तुम कहाँ जा रहे हो?',
          'email': 'हैलो @name, आपका ईमेल @email है'
        },
        'ts_IN': {
          'hello': 'హలో, హౌ ఆర్ యూ?',
          'going': 'ఎక్కడికి వెళ్తున్నావ్?',
          'email': 'హలో @name, మీ ఇమెయిల్ @email'
        },
        'tm_IN': {
          'hello': 'ஹலோ, எப்படி இருக்கிறீர்கள்?',
          'going': 'நீ எங்கே போகிறாய்?',
          'email': 'ஹலோ @name, உங்கள் மின்னஞ்சல் @email'
        }
      };
}

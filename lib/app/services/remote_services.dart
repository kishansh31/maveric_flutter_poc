import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteServices{

  static const String BASE_URL = '';
  static var client = http.Client();
  
}

Future sampleGetAPI() async {
  var urls = Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population");

  final response = await http.get(urls);

  var converDataToJson = jsonDecode(response.body);
  return converDataToJson;
}
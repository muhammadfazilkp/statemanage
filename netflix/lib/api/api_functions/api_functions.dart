import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/api/api_models/model/pages.dart';

Future<Pages?> getFunction(String uri) async {
  final response = await http.get(Uri.parse(uri));

  try {
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      Pages pages = Pages.fromJson(data);
      return pages;
    }
  } catch (e) {
    print(e);
  }
  return null; // Return null outside the try-catch block if an error occurs
}

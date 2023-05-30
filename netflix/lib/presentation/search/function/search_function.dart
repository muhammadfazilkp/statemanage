import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/api/api_key.dart';
import 'package:netflix/api/api_models/model/pages.dart';
import 'package:netflix/api/api_models/movie_model.dart';
import 'package:http/http.dart' as http;

class SearchFunction {
  static ValueNotifier<List<Movies>> searchData = ValueNotifier([]);
  static Future<void> searchResult(String quary) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&query=$quary'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        searchData.value.clear();
        searchData.value.addAll(pages.results!);
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        searchData.notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}

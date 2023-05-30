import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/api/api_key.dart';
import 'package:netflix/api/api_models/model/pages.dart';
import 'package:netflix/api/api_models/movie_model.dart';

class Functions {
  static List<Movies> trendingNow = [];
  static List<Movies> nowplaying = [];
  static List<Movies> comingsoon = [];
  static List<Movies> toprated = [];
  static List<Movies> discover = [];

  static Future<void> gettrending() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        trendingNow.addAll(pages.results!);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> getnowplaying() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        nowplaying.addAll(pages.results!);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> getupcoming() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        comingsoon.addAll(pages.results!);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> gettoprated() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        toprated.addAll(pages.results!);
        print(toprated);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> getdiscover() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        discover.addAll(pages.results!);
        print(toprated);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}

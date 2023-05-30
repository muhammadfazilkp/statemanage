import 'package:netflix/api/api_functions/api_functions.dart';
import 'package:netflix/api/api_key.dart';
import 'package:netflix/api/api_models/model/pages.dart';

released() async {
  String uri =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=2b24683de1a1b805dc5291b3556b254d&language=en-US&page=1';

  final Pages? downloadsData = await getFunction(uri);

  if (downloadsData != null) {
    return downloadsData;
  } else {
    print("Failed to retrieve data.");
  }
}

trendingNow() async {
  String uri =
      'https://api.themoviedb.org/3/movie/popular?api_key=2b24683de1a1b805dc5291b3556b254d&language=en-US&page=1';

  final Pages? downloadsData = await getFunction(uri);

  if (downloadsData != null) {
    return downloadsData;
  } else {
    print("Failed to retrieve data.");
  }
}

top10TvShows() async {
  String uri =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1';

  final Pages? downloadsData = await getFunction(uri);

  if (downloadsData != null) {
    return downloadsData;
  } else {
    print("Failed to retrieve data.");
  }
}

tenseDramas() async {
  String uri =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${apiKey}&language=en-US&page=1';

  final Pages? downloadsData = await getFunction(uri);

  if (downloadsData != null) {
    return downloadsData;
  } else {
    print("Failed to retrieve data.");
  }
}

southIndianCinima() async {
  String uri =
      'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&language=en-US&page=1';

  final Pages? downloadsData = await getFunction(uri);

  if (downloadsData != null) {
    return downloadsData;
  } else {
    print("Failed to retrieve data.");
  }
}

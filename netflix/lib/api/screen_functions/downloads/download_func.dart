import 'package:netflix/api/api_functions/api_functions.dart';
import 'package:netflix/api/api_key.dart';
import 'package:netflix/api/api_models/model/pages.dart';

getDownloadingData() async {
  String uri =
      'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&language=en-US&page=1';

  final Pages? downloadsData = await getFunction(uri);

  if (downloadsData != null) {
    return downloadsData;
  } else {
    print("Failed to retrieve data.");
  }
}

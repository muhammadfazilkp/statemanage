import 'package:flutter/material.dart';
import 'package:netflix/api/api_models/model/pages.dart';
import 'package:netflix/api/screen_functions/downloads/download_func.dart';
import 'package:netflix/api/screen_functions/home_func.dart';
import 'package:netflix/api/screen_functions/new_hot.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

Pages? downloadsPageData;
Pages? comingSoonPageData;
Pages? everyonesPageData;
Pages? releasedPageData;
Pages? trendingPageData;
Pages? top10PageData;
Pages? tenseDramasPageData;
Pages? southIndianCinimaPageData;

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splash(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDmmMZIyhtPhFrPgNJluXUJYJXROSX8Ua67A&usqp=CAU'),
      )),
    );
  }

  Future<void> splash(BuildContext context) async {
    downloadsPageData = await getDownloadingData();
    comingSoonPageData = await upComingData();
    everyonesPageData = await everyonesWatching();
    releasedPageData = await released();
    trendingPageData = await trendingNow();
    top10PageData = await top10TvShows();
    tenseDramasPageData = await tenseDramas();
    southIndianCinimaPageData = await southIndianCinima();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ScreenMainPage(),
      ),
    );
  }
}

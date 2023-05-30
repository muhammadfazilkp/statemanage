import 'package:flutter/material.dart';
import 'package:netflix/api/api_url.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/custome_button.dart';
import 'package:netflix/presentation/splash/screen_splash.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      baseUri + trendingPageData!.results![8].posterPath!))),
        ),
        const Positioned(
          bottom: 0,
          left: 15,
          right: 15,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(icon: Icons.add, title: 'My List'),
                PlayButton(),
                CustomButtonWidget(icon: Icons.info, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }
}

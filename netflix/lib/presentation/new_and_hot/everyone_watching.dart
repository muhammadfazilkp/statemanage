import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constrain.dart';
import 'package:netflix/presentation/main_page/widgets/custome_button.dart';
import 'package:netflix/presentation/main_page/widgets/video_widget.dart';
import 'package:netflix/presentation/splash/screen_splash.dart';

class EveryOneseWatching extends StatelessWidget {
  const EveryOneseWatching({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Frieinds",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: double.infinity,
            height: 150,
            child: Text(
                "The hitb sitcom follows the mery misadventures of six 20-something pals as they negativev the pitfalls of work,life and love inn 1990's Manhattan",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          kheight20,
          VideoWidget(
            index: index,
            data: everyonesPageData,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtonWidget(
                  icon: Icons.share,
                  title: 'Share',
                  textSize: 10,
                  iconSize: 27,
                ),
                kwidth,
                CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                  textSize: 10,
                  iconSize: 29,
                ),
                kwidth,
                CustomButtonWidget(
                  icon: Icons.play_arrow,
                  title: 'Play',
                  textSize: 10,
                  iconSize: 29,
                ),
                kwidth
              ],
            ),
          )
        ],
      ),
    );
  }
}

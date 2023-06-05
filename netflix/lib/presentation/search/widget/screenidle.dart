
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/api/api_url.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constrain.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';
import 'package:netflix/presentation/splash/screen_splash.dart';

class ScreenSearchIdle extends StatelessWidget {
  const ScreenSearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SearchTexttitle(searchtitle: 'Top Movies'),
      Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => TopSearchItem(index: index),
              separatorBuilder: (context, index) => kheight20,
              itemCount: downloadsPageData!.results!.length))
    ]);
  }
}

class TopSearchItem extends StatelessWidget {
  const TopSearchItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final sreenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: sreenWidth * 0.35,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  baseUri + downloadsPageData!.results![index].backdropPath!),
            ),
          ),
        ),
        kwidth,
        Expanded(
            child: SizedBox(
          height: 23,
          child: Text(
            downloadsPageData!.results![index].title!,
            style: const TextStyle(
              color: kwhitecolor,
            ),
          ),
        )),
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundColor: kwhitecolor,
            radius: 25,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 23,
              child: Icon(
                CupertinoIcons.play_fill,
                color: kwhitecolor,
              ),
            ),
          ),
        )
      ],
    );
  }
}

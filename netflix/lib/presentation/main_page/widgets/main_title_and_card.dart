import 'package:flutter/material.dart';
import 'package:netflix/api/api_models/model/pages.dart';
import 'package:netflix/core/colors/constrain.dart';
import 'package:netflix/presentation/main_page/widgets/main_card.dart';
import 'package:netflix/presentation/main_page/widgets/main_title.dart';

class MainTitleAndCard extends StatelessWidget {
  const MainTitleAndCard(
      {super.key,
      required this.title,
      required this.data,
      required this.length});
  final String title;

  final Pages? data;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(text: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => Maincard(
                      index: index,
                      data: data,
                    )),
          ),
        )
      ],
    );
  }
}

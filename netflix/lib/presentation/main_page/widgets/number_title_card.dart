import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constrain.dart';
import 'package:netflix/presentation/main_page/widgets/main_title.dart';
import 'package:netflix/presentation/main_page/widgets/number_card.dart';

class NumberTitlecard extends StatelessWidget {
  const NumberTitlecard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(text: "Top 10 Tv Shows In India Today"),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => NumberCard(index: index)),
          ),
        )
      ],
    );
  }
}

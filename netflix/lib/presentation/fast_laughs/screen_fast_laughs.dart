import 'package:flutter/material.dart';
import 'package:netflix/presentation/fast_laughs/vedio_list_items.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(2, (index) {
                  return VideoListItem(index: index);
                }))));
  }
}

import 'package:flutter/material.dart';
import 'package:netflix/api/api_models/model/pages.dart';
import 'package:netflix/api/api_url.dart';
import 'package:netflix/core/colors/constrain.dart';

class Maincard extends StatelessWidget {
  const Maincard({super.key, required this.index, required this.data});

  final int index;
  final Pages? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: kradius10,
        image: DecorationImage(
            image: NetworkImage(baseUri + data!.results![index].posterPath!)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:netflix/api/api_models/model/pages.dart';
import 'package:netflix/api/api_url.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.index,
    required this.data,
  });

  final int index;
  final Pages? data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            baseUri + data!.results![index].backdropPath!,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

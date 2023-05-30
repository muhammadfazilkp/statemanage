import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/api/api_url.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constrain.dart';
import 'package:netflix/presentation/downloads/widgets/app_bar_widget.dart';
import 'package:netflix/presentation/splash/screen_splash.dart';

class ScreenDownload extends StatelessWidget {
  const ScreenDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(title: 'Downloads')),
          body: ListView(
            children: const [_SmartDownloads(), Section2(), Section3()],
          )),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhitecolor,
        ),
        kwidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageList = [
      baseUri + downloadsPageData!.results![0].posterPath!,
      baseUri + downloadsPageData!.results![1].posterPath!,
      baseUri + downloadsPageData!.results![2].posterPath!,
    ];
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 60),
          child: Text(
            'Introducing Downloads for you',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kwhitecolor, fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        kheight,
        const Text(
            "We will download a personalised selection of movies and shows for you,so there's\n always somthing to watch on your\n  devies",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            )),
        kheight,
        SizedBox(
          width: size.width,
          child: Stack(alignment: Alignment.topCenter, children: [
            CircleAvatar(
              radius: size.width * 0.4,
              backgroundColor: Colors.grey.withOpacity(0.5),
            ),
            DownloadImageWidget(
              imageList: imageList[0],
              margin: const EdgeInsets.only(left: 170, top: 60),
              angle: 20,
              size: Size(size.width * 0.4, size.width * 0.58),
            ),
            DownloadImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 170, top: 60),
                angle: -20,
                size: Size(size.width * 0.4, size.width * 0.58)),
            DownloadImageWidget(
              imageList: imageList[2],
              radius: 5,
              margin: const EdgeInsets.only(top: 30),
              size: Size(size.width * 0.45, size.width * 0.68),
            ),
          ]),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          MaterialButton(
            minWidth: 370,
            height: 48,
            color: Colors.blue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Text(
              'Set up',
              style: TextStyle(
                  fontSize: 20,
                  color: kwhitecolor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            height: 45,
            color: kwhitecolor,
            onPressed: () {},
            child: const Text(
              'See what you can download',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 0});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageList))),
        ),
      ),
    );
  }
}

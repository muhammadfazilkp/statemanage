import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constrain.dart';
import 'package:netflix/presentation/main_page/widgets/custome_button.dart';
import 'package:netflix/presentation/main_page/widgets/video_widget.dart';
import 'package:netflix/presentation/splash/screen_splash.dart';

// ignore: must_be_immutable
class ComingSoon extends StatefulWidget {
  ComingSoon({
    super.key,
    required this.index,
  });

  final int index;
  List dateList = [];

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  void initState() {
    super.initState();
    date();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> months = {
      '01': 'JAN',
      '02': 'FEB',
      '03': 'MAR',
      '04': 'APR',
      '05': 'MAY',
      '06': 'JUN',
      '07': 'JUL',
      '08': 'AUG',
      '09': 'SEP',
      '10': 'OCT',
      '11': 'NOV',
      '12': 'DEC'
    };
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            children: [
              Text(
                months[widget.dateList[0]]!,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                widget.dateList[1],
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              VideoWidget(index: widget.index, data: comingSoonPageData),
              kHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 240,
                    height: 30,
                    child: Text(
                      comingSoonPageData!.results![widget.index].title!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -3,
                      ),
                    ),
                  ),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.notifications_outlined,
                        title: 'Remind me',
                        textSize: 10,
                        iconSize: 20,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: 'Info',
                        iconSize: 20,
                        textSize: 10,
                      ),
                    ],
                  )
                ],
              ),
              const Text('Coming on Friday'),
              kheight,
              SizedBox(
                height: 20,
                child: Text(
                  comingSoonPageData!.results![widget.index].originalTitle!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Text(
                    comingSoonPageData!.results![widget.index].overview!,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ],
    );
  }

  date() {
    var data = comingSoonPageData!.results![widget.index].releaseDate!;
    var index = data.substring(5, 7);
    var date = data.substring(8, 10);
    widget.dateList = [index, date];
    return data;
  }
}

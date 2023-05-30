import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constrain.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: Colors.white,
            size: 30,
          ),
          kwidth,
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              // borderRadius: kRadius10,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png?20201013161117",
                  )),
            ),
          )
        ],
      ),
    );
  }
}

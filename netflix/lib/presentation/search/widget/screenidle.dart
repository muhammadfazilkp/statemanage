// import 'package:flutter/material.dart';
// import 'package:netflix/api/api_models/movie_model.dart';
// import 'package:netflix/core/colors/colors.dart';
// import 'package:netflix/core/colors/constrain.dart';
// import 'package:netflix/presentation/search/function/all_fun.dart';
// import 'package:netflix/presentation/search/widget/search_title.dart';

// class SearchIdleWidget extends StatelessWidget {
//   SearchIdleWidget({super.key});
//   final List<Movies> movie = Functions.toprated;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SearchTexttitle(searchtitle: "Top Movies"),
//           kheight,
//           Expanded(
//             child: ListView.separated(
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) => TopSearchitemlists(
//                       index: index,
//                       movies: movie[index],
//                     ),
//                 separatorBuilder: (context, index) => kheight20,
//                 itemCount: movie.length),
//           )
//         ],
//       )),
//     );
//   }
// }

// class TopSearchitemlists extends StatelessWidget {
//   const TopSearchitemlists(
//       {super.key, required this.movies, required this.index});
//   final Movies movies;
//   final int index;
//   final imageUrl =
//       "https://www.themoviedb.org/t/p/w250_and_h141_face/ctZZvclXm1txxdnxpiIalWduNto.jpg";

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Row(
//       children: [
//         Container(
//           width: screenWidth * 0.4,
//           height: 95,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: NetworkImage(
//                     "https://image.tmdb.org/t/p/w500${movies.posterPath}"),
//                 fit: BoxFit.cover),
//           ),
//         ),
//         kwidth,
//         Expanded(
//           child: Text(
//             movies.title ?? "unknown",
//             style: const TextStyle(
//                 color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ),
//         const CircleAvatar(
//           radius: 30,
//           backgroundColor: kwhitecolor,
//           child: CircleAvatar(
//             backgroundColor: kblackcolor,
//             radius: 28,
//             child: Icon(
//               Icons.play_circle_filled_outlined,
//               color: kwhitecolor,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
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

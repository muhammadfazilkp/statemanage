import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  // ignore: library_private_types_in_public_api
  _VideoListItemState createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  List<String> video = [
  //  'assets/WhatsApp Video 2023-05-30 at 17.47.43.mp4'
    // 'assets/video/WhatsApp Video 2023-05-29 at 11.51.14.mp4'
    // 'assets/video/WhatsApp Video 2023-05-29 at 11.51.17.mp4'
     
     'assets/vedio/FBBIqKZYwgA07mphou8sNJd4DuJso1bI9vQwMlkaGb0=_plaintext_638209380835433250.mp4',
    'assets/vedio/1XlIM-9mBR6H_OAkb9HyBzmt-Dmhm1oWvv9zbMHYC0c=_plaintext_638209380834791134.mp4'




    
  ];

  late VideoPlayerController _videoController;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(video[widget.index])
      ..initialize().then((_) {
        setState(() {});
      });
    _videoController.play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (_isVideoPlaying) {
                          _videoController.pause();
                          _isVideoPlaying = false;
                        } else {
                          _videoController.play();
                          _isVideoPlaying = true;
                        }
                      });
                    },
                    icon: Icon(
                      _isVideoPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://static-koimoi.akamaized.net/wp-content/new-galleries/2015/12/airlift-movie-poster-4.jpg"),
                    ),
                    VideoActions(
                      icon: Icons.emoji_emotions,
                      title: 'LoL',
                    ),
                    VideoActions(icon: Icons.add, title: 'My List'),
                    VideoActions(icon: Icons.share, title: 'Share'),
                    VideoActions(
                        icon: Icons.volume_off_outlined, title: 'Mute'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActions({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}

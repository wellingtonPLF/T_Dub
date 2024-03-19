import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoTestWidget extends StatefulWidget {
  const VideoTestWidget({super.key});
  
  @override
  State<VideoTestWidget> createState() => _VideoTestWidgetState();
}

class _VideoTestWidgetState extends State<VideoTestWidget> {
  // late YoutubePlayerController _controller;

  @override
  void initState() {
    //  _controller = YoutubePlayerController.fromVideoId(
    //   videoId: 'hP25aVmxkP8',
    //   autoPlay: false,
    //   params: const YoutubePlayerParams(showFullscreenButton: true),
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("OK")
    );
  }
}
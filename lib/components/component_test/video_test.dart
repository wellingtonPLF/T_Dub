import 'package:dub_tralers/models/user.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoTestWidget extends StatefulWidget {
  final Object? receive;
  
  const VideoTestWidget({super.key, required this.receive});
  
  @override
  State<VideoTestWidget> createState() => _VideoTestWidgetState();
}

class _VideoTestWidgetState extends State<VideoTestWidget> {
  // late YoutubePlayerController _controller;
  late User? x;

  //Constructor
  _VideoTestWidgetState(); //{}

  @override
  void initState() {
    //  _controller = YoutubePlayerController.fromVideoId(
    //   videoId: 'hP25aVmxkP8',
    //   autoPlay: false,
    //   params: const YoutubePlayerParams(showFullscreenButton: true),
    // );
    super.initState();
    x = widget.receive as User?;
    print(x?.getNickName());
  }

  //OnChanges
  // @override
  // void didUpdateWidget(covariant TestandoWidget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  // }

  //OnDestroy
  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Text("OK")
    );
  }
}
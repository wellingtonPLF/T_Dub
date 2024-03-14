import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
// ignore: depend_on_referenced_packages
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPageWidget extends StatefulWidget {
  const TrailerPageWidget({super.key});
  
  @override
  State<TrailerPageWidget> createState() => _TrailerPageWidgetState();
}

class _TrailerPageWidgetState extends State<TrailerPageWidget> {
  
  //YoutubePlayerController 
  List<VideoPlayerController> items = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 3; i++) {
      var video = VideoPlayerController.networkUrl(Uri.parse('https://www.w3schools.com/html/mov_bbb.mp4'));
      video.initialize().then((_) {
        setState(() {});
      });
      items.add(video);
    }

    // _controller = YoutubePlayerController(
    //   initialVideoId: 'YOUR_VIDEO_ID', // Replace with your actual YouTube video ID
    //   flags: YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: false,
    //   ),
    // );

    // YoutubePlayer(
    //   controller: _controller,
    //   showVideoProgressIndicator: true,
    // );
  }

  @override
  void dispose() {
    super.dispose();
    for (var video in items) {
      video.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Expanded(
          child: Text(
            'Trailers', 
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500
            )
          ) 
        ),
        backgroundColor: const Color.fromARGB(255, 16, 3, 22),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Container(
                      height: 220,
                      // color: const Color.fromARGB(255, 33, 32, 34), 
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:  Color.fromARGB(255, 233, 233, 233),
                          width: 3,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  child: VideoPlayer(items[index]),
                                ),
                                const Positioned(
                                  top: 5,
                                  left: 5,
                                  child: Icon(
                                    Icons.bookmark_outline,
                                    size: 30,
                                    color: Colors.white
                                  ),
                                ),
                                Positioned(
                                  top: 0.5 * (200 - 75),
                                  left: 0.5 * (MediaQuery.of(context).size.width * 0.85 - 60),
                                  child: const Icon(
                                    Icons.play_arrow_outlined,
                                    size: 60,
                                    color: Color.fromARGB(255, 16, 3, 22),
                                  ),
                                ),
                              ],
                            )
                          ),
                          Align(
                            alignment: Alignment.bottomCenter, 
                            child: Container(
                              height: 42,
                              width: double.maxFinite,
                              color: const Color.fromARGB(255, 16, 3, 22),
                              child: const Padding(
                                padding: EdgeInsets.only(bottom: 5, left: 12), 
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Rabbit, Apple and a Butterfly", 
                                      style: TextStyle(color: Colors.white)
                                    )
                                  ]
                                )
                              ),
                            )
                          )
                      ],)
                    ),
                    onTap: () {},
                  );
                },
              )
            ),
            Container(
              height: 50,
              color: const Color.fromARGB(255, 250, 250, 250),
              child: const Row(children: [
                Expanded(child: Center(child: 
                  Icon(
                    Icons.home,
                    size: 20
                  ),
                )),
                Expanded(child: Center(child: 
                  Icon(
                    Icons.tag,
                    size: 20
                  ),
                )),
                Expanded(child: Center(child: 
                  Icon(
                    Icons.add,
                    size: 20
                  ),
                )),
                Expanded(child: Center(child: 
                  Icon(
                    Icons.notifications,
                    size: 20
                  ),
                )),
                Expanded(child: Center(child: 
                  Icon(
                    Icons.person,
                    size: 22
                  ),
                )),
              ])
            )
          ]
        )
      )
    );
  }
}

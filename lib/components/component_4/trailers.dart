import 'package:dub_tralers/models/trailer.dart';
import 'package:flutter/material.dart';
import '../../services/trailer_service.dart';

// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

// ignore: depend_on_referenced_packages
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrailerPageWidget extends StatefulWidget {
  const TrailerPageWidget({super.key});
  
  @override
  State<TrailerPageWidget> createState() => _TrailerPageWidgetState();
}

class _TrailerPageWidgetState extends State<TrailerPageWidget> {
  
  final TrailerService trailerService = TrailerService();
  List<YoutubePlayerController> items = [];
  List<String> trailersName = [];
  static const colorPage = Color.fromARGB(255, 84, 23, 196);

  @override
  void initState() {
    super.initState();

    trailerService.listTrailer().then((result) {
      for (Trailer trailer in result) {
        var video = YoutubePlayerController.fromVideoId(
          videoId: trailer.getYoutubeUrl()!,
          autoPlay: false,
          params: const YoutubePlayerParams(showFullscreenButton: true),
        );
        
        setState(() {
          items.add(video);
          trailersName.add(trailer.getName()!);
        });
      }
    }).catchError((error) {
      print('Error loading .env file: $error');
    });

  }

  void onTabTapped(int index) {
    if (index == 2) {
      context.go('/user');
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
        backgroundColor: colorPage,
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
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:  colorPage,
                          width: 3,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: YoutubePlayer(
                                    controller: items[index],
                                    aspectRatio: MediaQuery.of(context).size.width / (220 - kToolbarHeight),
                                  ),
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
                              ],
                            )
                          ),
                          Align(
                            alignment: Alignment.bottomCenter, 
                            child: Container(
                              height: 42,
                              width: double.maxFinite,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 5, left: 12), 
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(trailersName[index], 
                                      style: TextStyle(color: colorPage, fontWeight: FontWeight.w600)
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
            BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                )
              ],
            ),
          ]
        )
      )
    );
  }
}

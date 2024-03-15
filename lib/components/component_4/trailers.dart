import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class TrailerPageWidget extends StatefulWidget {
  const TrailerPageWidget({super.key});
  
  @override
  State<TrailerPageWidget> createState() => _TrailerPageWidgetState();
}

class _TrailerPageWidgetState extends State<TrailerPageWidget> {
  
  List<YoutubePlayerController> items = [];
  static const colorPage = Color.fromARGB(255, 84, 23, 196);

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 3; i++) {
      var video = YoutubePlayerController(
        initialVideoId: 'N9_5_Ee2sUs',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
      items.add(video);
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (var video in items) {
      video.dispose();
    }
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
                                Container(
                                  width: double.infinity,
                                  height: 300,
                                  color: Colors.black, 
                                  child: const Text("")
                                ),
                                // Positioned(
                                //   child: YoutubePlayer(
                                //     controller: items[index],
                                //     showVideoProgressIndicator: false,
                                //   )
                                // ),
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
                              child: const Padding(
                                padding: EdgeInsets.only(bottom: 5, left: 12), 
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Rabbit, Apple and a Butterfly", 
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

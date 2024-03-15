import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class UserPageWidget extends StatefulWidget {
  const UserPageWidget({super.key});
  
  @override
  State<UserPageWidget> createState() => _UserPageWidgetState();
}

class _UserPageWidgetState extends State<UserPageWidget> {
  final String userName = "Wellington_PLF";
  final String nameTag = "@wellington_plf";

  static const colorMenu = Color.fromARGB(255, 97, 17, 226);
  static var items = List.generate(6, (index) => 'Item $index');

  void onTabTapped(int index) {
    if (index == 0) {
      context.go('/trailers');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; 
    final double itemWidth = size.width / 4; 

    return Scaffold(
      appBar: AppBar(
        title: Padding( 
          padding: const EdgeInsets.only(right: 58),
          child: Expanded(
            child: Center(
              child: Text(
                userName, 
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
              ),
            )
          ),
        ),
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.zero,
              bottomRight: Radius.zero
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: colorMenu,
              ),
              child: Text(
                'Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              )
            ),
            ListTile(
              title: const Text('settings'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('sign out'),
              onTap: () {
                context.go('/login');
              },
            ),
            ListTile(
              title: const Text('help'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('profile.png'),
                            fit: BoxFit.cover,
                          ),
                          color: const Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        width: 100,
                        height: 100
                      )
                    ),
                  ),
                  Center(child: Text(
                      nameTag,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                    child: const Row(children: [
                      Expanded( 
                        child: Column(children: [
                            Text(
                              '70',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)
                            ),
                            Text(
                              'Seguindo',
                              style: TextStyle(color: Colors.grey, fontSize: 13)
                            ),
                          ],
                        )
                      ),
                      Expanded( 
                        child: Column(children: [
                            Text(
                              '70',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)
                            ),
                            Text(
                              'Seguidores',
                              style: TextStyle(color: Colors.grey, fontSize: 13)
                            ),
                          ],
                        )
                      ),
                      Expanded( 
                        child: Column(children: [
                            Text(
                              '70',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)
                            ),
                            Text(
                              'Curtidas',
                              style: TextStyle(color: Colors.grey, fontSize: 13)
                            ),
                          ],
                        )
                      ),
                    ])
                  )
                ],
              )
            ),
            Container(
              color: const Color.fromARGB(255, 135, 71, 255),
              height: 50,
              child: const Row(children: [
                Expanded(child: Center(child: 
                  Icon(
                    Icons.window,
                    size: 20,
                    color: Colors.white,
                  ),
                )),
                Expanded(child: Center(child: 
                  Icon(
                    Icons.bookmark,
                    size: 20,
                    color: Colors.white,
                  ),
                )),
                Expanded(child: Center(child: 
                  Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.white,
                  ),
                )),
                Expanded(child: Center(child: 
                  Icon(
                    Icons.lock,
                    size: 20,
                    color: Colors.white,
                  ),
                )),
              ])
            ),
            Expanded(
              child: SizedBox( 
                child: GridView.count( 
                  crossAxisCount: 4, 
                  childAspectRatio: (itemWidth / 120), 
                  controller: ScrollController(keepScrollOffset: false), 
                  shrinkWrap: true, 
                  scrollDirection: Axis.vertical, 
                  children: items.map((String value) { 
                    return Container( 
                      color: const Color.fromARGB(255, 222, 207, 233), 
                      margin: const EdgeInsets.all(1.0), 
                      child: const Center( 
                        child: Align(
                          alignment: Alignment.bottomLeft, 
                          child: Row(children: [
                            Icon(
                              Icons.play_arrow_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            Text('140', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                          ],)
                        ,)
                      ), 
                    ); 
                  }).toList(), 
                ), 
              )
            ),
            BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: 2,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.blue
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
          ],
        )
      )
    );
  }
}

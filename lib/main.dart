import 'package:dub_tralers/components/component_4/trailers.dart';
import 'package:dub_tralers/components/component_5/user_page.dart';
import 'package:dub_tralers/components/component_3/home_page.dart';
import 'package:dub_tralers/components/component_2/sign_up.dart';
import 'package:dub_tralers/components/component_1/login.dart';
import 'package:dub_tralers/components/component_test/testando.dart';
import 'package:dub_tralers/components/component_test/video_test.dart';

// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //HTML
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'T-DuB',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        initialLocation: '/home',
        redirect: (BuildContext context, GoRouterState state) {
          var guardPath = state.fullPath == '/trailers';
          var isAuthenticated = true;
          if (guardPath & !isAuthenticated) {
            return '/login';
          } else {
            return null;
          }
        },
        routes: <RouteBase>[
          GoRoute(
            name:'/signUp', 
            path: '/signUp', 
            builder: (context, state) => const SingUpWidget()
          ),
          GoRoute(
            name:'/login', 
            path: '/login', 
            builder: (context, state) => const LoginWidget()
          ),
          GoRoute(
            name:'/trailers', 
            path: '/trailers', 
            builder: (context, state) => const TrailerPageWidget()
          ),
          GoRoute(
            name:'/user', 
            path: '/user', 
            builder: (context, state) => const UserPageWidget()
          ),
          GoRoute(
            name:'/home', 
            path: '/home', 
            builder: (context, state) => const HomePageWidget()
          ),
          GoRoute(
            name:'/testando', 
            path: '/testando', 
            builder: (context, state) => const TestandoWidget()
          ),
          GoRoute(
            name:'/videoTest', 
            path: '/videoTest', 
            builder: (context, state) => const VideoTestWidget()
          )
        ],
      )
    );
  }
}

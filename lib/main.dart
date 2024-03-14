import 'package:flutter/material.dart';
import 'package:dub_tralers/components/component_3/home_page.dart';
import 'package:dub_tralers/components/component_2/sign_up.dart';
import 'package:dub_tralers/components/component_1/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //HTML
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T-DuB',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePageWidget(),
      routes: {
        '/signUp':(context) => const SingUpWidget(),
        '/login':(context) => const LoginWidget(),
        '/home':(context) => const HomePageWidget()
      }
    );
  }
}
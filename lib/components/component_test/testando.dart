import 'package:dub_tralers/models/trailer.dart';
import 'package:dub_tralers/services/auth_service.dart';
import 'package:dub_tralers/services/user_service.dart';
import 'package:flutter/material.dart';
import '../../services/trailer_service.dart';

class TestandoWidget extends StatefulWidget {
  const TestandoWidget({super.key});
  
  @override
  State<TestandoWidget> createState() => _TestandoWidgetState();
}

class _TestandoWidgetState extends State<TestandoWidget> {
  final TrailerService trailerService = TrailerService();
  final UserService userService = UserService();
  final AuthService authService = AuthService();
  Trailer myTrailer = Trailer.nullObject();

  @override
  void initState() {
    super.initState();
  }

  void listarTrailers() {
    print("OK");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(myTrailer.getName()!),
        ElevatedButton(
          onPressed: () {
            listarTrailers();
          }, 
          child: Text("myButton")
        )
      ],),
    );
  }
}
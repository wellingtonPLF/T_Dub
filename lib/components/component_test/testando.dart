import 'package:dub_tralers/models/trailer.dart';
import 'package:flutter/material.dart';
import '../../services/trailer_service.dart';

class TestandoWidget extends StatefulWidget {
  const TestandoWidget({super.key});
  
  @override
  State<TestandoWidget> createState() => _TestandoWidgetState();
}

class _TestandoWidgetState extends State<TestandoWidget> {
  final TrailerService trailerService = TrailerService();
  Trailer myTrailer = Trailer.nullObject();

  @override
  void initState() {
    super.initState();
  }

  void listarTrailers() {
    trailerService.listTrailer().then((result) {
      print(result);
    }).catchError((error) {
      print('Error loading .env file: $error');
    });
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
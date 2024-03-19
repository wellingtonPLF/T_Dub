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
  Trailer myTrailer = Trailer.empty();

  //Constructor
  _TestandoWidgetState(); //{}

  @override
  void initState() {
    super.initState();

    trailerService.listTrailer().then((result) {
      
    }).catchError((error) {
      print('Error loading .env file: $error');
    });
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
      body: Text(myTrailer.getName()!),
    );
  }
}
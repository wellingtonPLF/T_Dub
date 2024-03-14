import 'package:flutter/material.dart';

class TrailerPageWidget extends StatelessWidget {
  const TrailerPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: const Text("Trailers Page")
      )
    );
  }
}

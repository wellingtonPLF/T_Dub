import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  //final String _texto = 'T-Dub';
  static const colorButton = Color.fromARGB(255, 84, 23, 196);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.114),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Image.asset('logo.png') //Text(_texto, style: const TextStyle(color: Color.fromARGB(200, 71, 25, 126),fontWeight: FontWeight.bold, fontSize: 25))
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: 35,
                      width: 200,
                      child: ElevatedButton(
                      onPressed: () => GoRouter.of(context).pushNamed('/login'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          colorButton,
                        )
                      ),
                      child: const Text('Login', style: TextStyle(color: Colors.white),),
                    )),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 35,
                      width: 200,
                      child: ElevatedButton(
                      onPressed: () => GoRouter.of(context).pushNamed('/signUp'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          colorButton,
                        )
                      ),
                      child: const Text('SignUp', style: TextStyle(color: Colors.white),)
                    )
                    ),
                    Center(
                      child: CustomPaint(
                        size: Size(MediaQuery.of(context).size.width, 328), 
                        painter: CurvedPainter(),
                      ),
                    ),
                  ],
                ),
              )
            )
          ])
        )
      )
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color.fromARGB(255, 84, 23, 196)
      ..style = PaintingStyle.fill
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width * 0.3, size.height,
      size.width * 0.46, size.height * 0.7
    );
    path.quadraticBezierTo(
      size.width * 0.7, size.height * 0.2,
      size.width + 20, size.height * 0.2
    );
    path.lineTo(size.width + 30, size.height);
    path.lineTo(0, size.height + 10);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
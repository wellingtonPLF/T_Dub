import 'package:flutter/material.dart';

class SingUpWidget extends StatefulWidget {
  const SingUpWidget({super.key});
  
  @override
  State<SingUpWidget> createState() => _SingUpWidgetState();
}

class _SingUpWidgetState extends State<SingUpWidget> {
  final _texto = 'Sign Up';
  final double _paddingTop = 40;
  static const colorHint = Color.fromARGB(255, 132, 119, 138);

  TextEditingController usernameController = TextEditingController(text: ' ');
  TextEditingController emailController = TextEditingController(text: ' ');
  TextEditingController passwordController = TextEditingController(text: ' ');
  TextEditingController confirmPasswordController = TextEditingController(text: ' ');

  late List<Map<String, dynamic>> textFieldArray;

  @override
  void initState() {
    super.initState();

    textFieldArray = [
      {'controller': usernameController, 'tapOn': false},
      {'controller': emailController, 'tapOn': false},
      {'controller': passwordController, 'tapOn': false},
      {'controller': confirmPasswordController, 'tapOn': false},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color.fromARGB(255, 84, 23, 196),
        child: Padding(
          padding: EdgeInsets.only(
            top: _paddingTop,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: Text(
                      _texto, 
                      style: const TextStyle(color: Colors.white, fontSize: 25))
                    )
                ),
                SizedBox(
                  width: 210, // Set the width of the row
                  height: 220, // Set the height of the row
                  child: Column(
                    children: [
                      Expanded(
                        child: Focus(
                          onFocusChange: (hasFocus) {
                            if (!hasFocus) {
                              setState(() {
                                  textFieldArray[0]['tapOn'] = false;
                                });
                              if (textFieldArray[0]['controller'].text == '') {
                                textFieldArray[0]['controller'].text = ' ';
                              }
                            }
                          },
                          child: TextField(
                            controller: textFieldArray[0]['controller'],
                            onTap: () {
                              textFieldArray[0]['controller'].text = '';

                              setState(() {
                                textFieldArray[0]['tapOn'] = true;
                              });
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: textFieldArray[0]['controller'].text == ' ' ? 'Username' : 
                              (textFieldArray[0]['controller'].text == '' ? 'Username': ''),
                              labelStyle: TextStyle(
                                color: textFieldArray[0]['tapOn'] ? colorHint : Colors.white
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Expanded(
                        child: Focus(
                          onFocusChange: (hasFocus) {
                            if (!hasFocus) {
                              setState(() {
                                  textFieldArray[1]['tapOn'] = false;
                                });
                              if (textFieldArray[1]['controller'].text == '') {
                                textFieldArray[1]['controller'].text = ' ';
                              }
                            }
                          },
                          child: TextField(
                            controller: textFieldArray[1]['controller'],
                            onTap: () {
                              textFieldArray[1]['controller'].text = '';

                              setState(() {
                                textFieldArray[1]['tapOn'] = true;
                              });
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: textFieldArray[1]['controller'].text == ' ' ? 'Email' : 
                              (textFieldArray[1]['controller'].text == '' ? 'Email': ''),
                              labelStyle: TextStyle(
                                color: textFieldArray[1]['tapOn'] ? colorHint : Colors.white
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Expanded(
                        child: Focus(
                          onFocusChange: (hasFocus) {
                            if (!hasFocus) {
                              setState(() {
                                  textFieldArray[2]['tapOn'] = false;
                                });
                              if (textFieldArray[2]['controller'].text == '') {
                                textFieldArray[2]['controller'].text = ' ';
                              }
                            }
                          },
                          child: TextField(
                            controller: textFieldArray[2]['controller'],
                            onTap: () {
                              textFieldArray[2]['controller'].text = '';

                              setState(() {
                                textFieldArray[2]['tapOn'] = true;
                              });
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: textFieldArray[2]['controller'].text == ' ' ? 'Password' : 
                              (textFieldArray[2]['controller'].text == '' ? 'Password': ''),
                              labelStyle: TextStyle(
                                color: textFieldArray[2]['tapOn'] ? colorHint : Colors.white
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ),
                      const SizedBox(height: 10,),
                      Expanded(
                        child: Focus(
                          onFocusChange: (hasFocus) {
                            if (!hasFocus) {
                              setState(() {
                                  textFieldArray[3]['tapOn'] = false;
                                });
                              if (textFieldArray[3]['controller'].text == '') {
                                textFieldArray[3]['controller'].text = ' ';
                              }
                            }
                          },
                          child: TextField(
                            controller: textFieldArray[3]['controller'],
                            onTap: () {
                              textFieldArray[3]['controller'].text = '';

                              setState(() {
                                textFieldArray[3]['tapOn'] = true;
                              });
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: textFieldArray[3]['controller'].text == ' ' ? 'Confirm Password' : 
                              (textFieldArray[3]['controller'].text == '' ? 'Confirm Password': ''),
                              labelStyle: TextStyle(
                                color: textFieldArray[3]['tapOn'] ? colorHint : Colors.white
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ),
                      const SizedBox(height: 10,),
                      Row(children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                                ),
                                backgroundColor: Colors.white
                              ),
                              child: const Text('clear')
                            )
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                backgroundColor: Colors.white
                              ),
                              child: const Text('confirm')
                            )
                          )
                        ],
                      )
                    ],
                  )
              ),
              Center(
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 398 - _paddingTop), 
                  painter: CurvedPainter(),
                ),
              ),
            ],
          )
        )
      )
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
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
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
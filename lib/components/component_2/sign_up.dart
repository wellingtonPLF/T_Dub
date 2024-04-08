import 'package:dub_tralers/models/auth.dart';
import 'package:dub_tralers/models/user.dart';
import 'package:dub_tralers/services/auth_service.dart';
import 'package:dub_tralers/services/trailer_service.dart';
import 'package:dub_tralers/services/user_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class SingUpWidget extends StatefulWidget {
  const SingUpWidget({super.key});
  
  @override
  State<SingUpWidget> createState() => _SingUpWidgetState();
}

class _SingUpWidgetState extends State<SingUpWidget> {
  final AuthService authService = AuthService();
  final UserService userService = UserService();

  final TrailerService trailerService = TrailerService();
  

  DateTime selectedDate = DateTime.now();

  final _texto = 'Sign Up';
  double diff = 70;
  final double paddingTop = 40;
  late double inputHeight;
  static const colorHint = Color.fromARGB(255, 132, 119, 138);

  TextEditingController dateController = TextEditingController(text: DateTime.now().toString());

  TextEditingController usernameController = TextEditingController(text: ' ');
  TextEditingController emailController = TextEditingController(text: ' ');
  TextEditingController passwordController = TextEditingController(text: ' ');
  TextEditingController confirmPasswordController = TextEditingController(text: ' ');

  late List<Map<String, dynamic>> textFieldArray;

  @override
  void initState() {
    super.initState();

    inputHeight = 220 + diff;

    textFieldArray = [
      {'controller': usernameController, 'tapOn': false},
      {'controller': emailController, 'tapOn': false},
      {'controller': passwordController, 'tapOn': false},
      {'controller': confirmPasswordController, 'tapOn': false},
      {'controller': dateController, 'tapOn': false},
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
            top: paddingTop,
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
                  height: inputHeight, // Set the height of the row
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
                          child: TextFormField(
                            controller: textFieldArray[2]['controller'],
                            obscureText: textFieldArray[2]['controller'].text != ' ',
                            onTap: () {
                              textFieldArray[2]['controller'].text = '';

                              setState(() {
                                textFieldArray[2]['tapOn'] = true;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please enter your password';
                              }
                              // Add additional password validation if needed
                              return null;
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
                          child: TextFormField(
                            controller: textFieldArray[3]['controller'],
                            obscureText: textFieldArray[3]['controller'].text != ' ',
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
                      SizedBox(
                        height: 50,
                        child: Container(
                          color: Color.fromARGB(255, 54, 6, 116),
                          // alignment: Alignment.top,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 6),
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Born Date:',
                                        style: TextStyle(fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${selectedDate.year}/${(selectedDate.month > 9)? '': 0}${selectedDate.month}/${selectedDate.day}',
                                        style: const TextStyle(fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                )
                              ),
                                                          
                              const SizedBox(height: 10),
                              
                              SizedBox(
                              child: Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        DatePicker.showDatePicker(
                                          context,
                                          showTitleActions: true,
                                          minTime: DateTime(2000, 1, 1),
                                          maxTime: DateTime(2100, 12, 31),
                                          onChanged: (date) {
                                            setState(() {
                                              selectedDate = date;
                                            });
                                          },
                                          onConfirm: (date) {
                                            setState(() {
                                              selectedDate = date;
                                            });
                                          },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(0),
                                        ),
                                        backgroundColor: Color.fromARGB(255, 49, 4, 109),
                                      ),
                                      child: const Icon(
                                        Icons.date_range,
                                        size: 20,
                                        color: Colors.white
                                      ),
                                    )
                                  ],
                                )
                              )
                            ],
                          )
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
                                if (usernameController.text.length > 2) {
                                  if (emailController.text.length > 12) {
                                    if (passwordController.text == confirmPasswordController.text) {
                                      Auth obj = Auth.fromArray([
                                        emailController.text,
                                        usernameController.text,
                                        passwordController.text
                                      ]);
                                      
                                      authService.authInsert(obj).then((value) {
                                        User user = User.fromArray([usernameController.text, dateController.text.substring(0, 10)]);
                                        user.setAuth(value.getId()!);
                                        
                                        userService.insert(user).then( (_) {
                                            context.go('/login');
                                          }
                                        ).catchError( (e) {
                                          print(e);
                                        });
                                      }).catchError((onError) {
                                        print(onError);
                                      });
                                    }
                                  }
                                }
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
                  size: Size(MediaQuery.of(context).size.width, 398 - paddingTop - diff), 
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
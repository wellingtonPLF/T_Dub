import 'package:dub_tralers/models/trailer.dart';
import 'package:dub_tralers/models/user.dart';
import 'package:dub_tralers/redux/action.dart';
import 'package:dub_tralers/redux/app_state.dart';
import 'package:dub_tralers/redux/store.dart';
import 'package:dub_tralers/services/auth_service.dart';
import 'package:dub_tralers/services/user_service.dart';
import 'package:flutter/material.dart';
import '../../services/trailer_service.dart';

// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

import 'package:flutter_redux/flutter_redux.dart';

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
  String myName = 'Wellington Prop';

  @override
  void initState() {
    super.initState();
  }

  void navegateThrough() {
    final user = User.fromArray(['setsuHa']);
    context.go('/videoTest', extra: user);
  }

  bool sendMe() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('${myTrailer.getName()!} :: ${store.state.count}'),
        Expanded( 
          child: FirstChildWidget(name: myName, onPressed: sendMe), //Exapanded is Needed
        )
      ],),
    );
  }
}

// Redux used at lines 66, 67, 68 and 80

class FirstChildWidget extends StatelessWidget {
  final String name;
  final Function() onPressed;
  const FirstChildWidget({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (store) => store.state.count,
      builder: (context, count) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("My Name is: $name ${store.state.count}"),
              // ElevatedButton(
              //   onPressed: onPressed,
              //   child: const Text('Press Me'),
              // ),
              ElevatedButton(
                onPressed: (){
                  store.dispatch(ReduxActions.incrementAction);
                },
                // child: Text((onPressed())?'Press Me': 'Vish'),
                child: const Text('Press Me'),
              ),
            ],
          ),
        );
      },
    );
  }
}

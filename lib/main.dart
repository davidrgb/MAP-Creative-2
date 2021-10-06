import 'package:creative2/viewscreen/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Creative2App());
}

class Creative2App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (context) => StartScreen(),
      }
    );
  }
}
import 'package:creative2/viewscreen/tictactoe_screen.dart';
import 'package:creative2/viewscreen/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Creative2App());
}

class Creative2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Creative 2',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange[800],
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange[800],
              textStyle: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
        initialRoute: StartScreen.routeName,
        routes: {
          StartScreen.routeName: (context) => StartScreen(),
          GameScreen.routeName: (context) => GameScreen(),
        });
  }
}

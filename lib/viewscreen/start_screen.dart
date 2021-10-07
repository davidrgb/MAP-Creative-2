import 'package:creative2/viewscreen/tictactoe_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  static const routeName = '/startScreen';

  @override
  State<StatefulWidget> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  late _Controller controller;

  @override
  void initState() {
    super.initState();
    controller = _Controller(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Menu'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.startGame,
              child: Text('Tic-Tac-Toe'),
            ),
            ElevatedButton(
              onPressed: controller.startGame,
              child: Text('Snake'),
            ),
            ElevatedButton(
              onPressed: controller.startGame,
              child: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Controller {
  late _StartScreenState state;
  _Controller(this.state);

  void startGame() {
    Navigator.pushNamed(state.context, GameScreen.routeName);
  }
}

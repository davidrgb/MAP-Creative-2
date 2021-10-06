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
        title: Text('Minesweeper'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.startGame,
              child: Text('New Game'),
            ),
            ElevatedButton(
              onPressed: controller.startGame,
              child: Text('Previous Games'),
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

  }
}

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
      body: Column(
        children: [
          ElevatedButton(
            onPressed: controller.startGame,
            child: Text('New Game'),
          ),
        ],
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

import 'package:creative2/model/minesweeper.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  static const routeName = '/gameScreen';

  @override
  State<StatefulWidget> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  late _Controller controller;

  late Minesweeper game;

  @override
  void initState() {
    super.initState();
    controller = _Controller(this);
  }

  @override
  Widget build(BuildContext context) {
    game = new Minesweeper();
    game.createBoard();

    return Scaffold(
      appBar: AppBar(
        title: Text('Minesweeper'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text("$game"),
          ],
        ),
      ),
    );
  }
}

class _Controller {
  late _GameScreenState state;
  _Controller(this.state);
}

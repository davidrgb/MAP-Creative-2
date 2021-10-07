import 'package:creative2/model/themeColor.dart';
import 'package:creative2/model/tictactoe.dart';
import 'package:flutter/material.dart';

var colors = [
  Colors.orange[800],
  Colors.yellow[800],
  Colors.green[800],
  Colors.blue[800],
  Colors.indigo[800],
  Colors.purple[800],
  Colors.red[800],
];

var colorNames = [
  'Orange',
  'Yellow',
  'Green',
  'Blue',
  'Indigo',
  'Purple',
  'Red',
];

class TicTacToeScreen extends StatefulWidget {
  static const routeName = '/gameScreen';

  @override
  State<StatefulWidget> createState() {
    return _TicTacToeScreenState(this);
  }
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  late _Controller controller;

  late TicTacToe game;
  bool _gameOver = false;

  String gameOverText = '';

  var buttonTags = [];
  var buttonStates = [];

  late TicTacToeScreen screen;
  _TicTacToeScreenState(this.screen);

  Color? color = colors[0];

  void render(fn) => setState(fn);

  @override
  void initState() {
    super.initState();
    controller = _Controller(this);
    game = new TicTacToe();
    game.createBoard();
    createButtonAttr();
  }

  void createButtonAttr() {
    if (buttonStates.isNotEmpty) buttonStates.clear();
    if (buttonTags.isNotEmpty) buttonTags.clear();
    for (int i = 0; i < 9; i++) {
      buttonTags.insert(i, '');
      buttonStates.insert(i, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
        backgroundColor: color,
        actions: [
          PopupMenuButton(
            onSelected: (int index) {
              controller.updateColor(index);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<int>>[
                for (int i = 0; i < colors.length; i++)
                  PopupMenuItem(
                    value: i,
                    child: Row(
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            backgroundColor: colors[i],
                          ),
                        ),
                        Expanded(child: Text('${colorNames[i]}')),
                      ],
                    ),
                  ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: GridView.count(
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: [
                  for (int i = 0; i < 9; i++)
                    ElevatedButton(
                      onPressed: _gameOver || !buttonStates[i]
                          ? null
                          : () => controller.activateSpace(i),
                      child: Text('${buttonTags[i]}'),
                      style: ElevatedButton.styleFrom(primary: color),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$gameOverText',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: _gameOver ? 1.0 : 0.0,
                          child: ElevatedButton(
                            onPressed: _gameOver ? controller.newGame : null,
                            child: Text(
                              'Reset',
                            ),
                            style: ElevatedButton.styleFrom(primary: color),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          game.playerOneSymbol,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          'P1 - ${game.playerOneWins}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          game.playerTwoSymbol,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          'P2 - ${game.playerTwoWins}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Controller {
  late _TicTacToeScreenState state;
  _Controller(this.state);

  int counter = 0;

  void activateSpace(int index) {
    state.buttonTags[index] = state.game.playerOneTurn
        ? '${state.game.playerOneSymbol}'
        : '${state.game.playerTwoSymbol}';
    state.buttonStates[index] = false;
    state.render(() => state.game.onTap(index));
    checkWin();
  }

  void checkWin() {
    if (state.game.playerOneWin) {
      state.render(() => state.gameOverText = 'Player 1 Wins');
      state._gameOver = true;
    } else if (state.game.playerTwoWin) {
      state.render(() => state.gameOverText = 'Player 2 Wins');
      state._gameOver = true;
    } else if (state.game.tie) {
      state.render(() => state.gameOverText = 'Tie');
      state._gameOver = true;
    }
  }

  void newGame() {
    state._gameOver = false;
    state.gameOverText = '';
    state.createButtonAttr();
    state.render(() => state.game.reset());
  }

  void updateColor(int index) {
    state.render(() => state.color = colors[index]);
  }
}

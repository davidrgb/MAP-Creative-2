class TicTacToe {
  var board = [];
  var playerOneSpaces = [];
  var playerTwoSpaces = [];
  var playerOneSymbol = 'X';
  var playerTwoSymbol = 'O';
  bool playerOneTurn = true;
  int freeSpaces = 9;
  bool playerOneWin = false;
  bool playerTwoWin = false;
  bool tie = false;

  TicTacToe({
    this.playerOneTurn = true,
    this.playerOneWin = false,
    this.playerTwoWin = false,
    this.tie = false,
  });

  final List<List<int>> winCombinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  void createBoard() {
    for (int i = 0; i < 9; i++) {
      board.insert(i, new Space(index: i));
    }
  }

  void onTap(int i) {
    if (playerOneTurn) {
      board[i].value = 1;
      playerOneSpaces.add(board[i].index);
    }
    else {
      board[i].value = 2;
      playerTwoSpaces.add(board[i].index);
    }
    playerOneTurn = !playerOneTurn;
    freeSpaces--;
    checkWin();
  }

  void checkWin() {
    for (var set in winCombinations) {
      if (playerOneSpaces.contains(set[0]) &&
          playerOneSpaces.contains(set[1]) &&
          playerOneSpaces.contains(set[2]))
      {
        playerOneWin = true;
      }
      else if (playerTwoSpaces.contains(set[0]) &&
              playerTwoSpaces.contains(set[1]) &&
              playerTwoSpaces.contains(set[2]))
      {
        playerTwoWin = true;
      }
    }
    if (!playerOneWin && !playerTwoWin && freeSpaces == 0) tie = true;
  }

  void reset() {
    board.clear();
    playerOneSpaces.clear();
    playerTwoSpaces.clear();
    playerOneWin = false;
    playerTwoWin = false;
    tie = false;
    freeSpaces = 9;
    if (playerOneSymbol == 'X') {
      playerOneSymbol = 'O';
      playerTwoSymbol = 'X';
      playerOneTurn = false;
    }
    else {
      playerOneSymbol = 'X';
      playerTwoSymbol = 'O';
      playerOneTurn = true;
    }
    createBoard();
  }
}

class Space {
  late int index;
  late int value;

  Space({
    this.index = -1,
    this.value = 0,
  });
}
class TicTacToe {
  var board = [];
  var playerOneSpaces = [];
  var playerTwoSpaces = [];
  int freeSpaces = 9;
  bool playerOneWin = false;
  bool playerTwoWin = false;
  bool tie = false;

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
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        board[x][y] = new Space(index: y * 3 + x,coordinateX: x, coordinateY: y);
      }
    }
  }

  void onTap(int x, int y, bool isPlayerOne) {
    if (isPlayerOne) {
      board[x][y].value = 1;
      playerOneSpaces.add(board[x][y].index);
    }
    else {
      board[x][y].value = 2;
      playerTwoSpaces.add(board[x][y].index);
    }
    freeSpaces--;
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
}

class Space {
  late int index;
  late int coordinateX;
  late int coordinateY;
  late int value;

  Space({
    this.index = -1,
    this.coordinateX = -1,
    this.coordinateY = -1,
    this.value = 0,
  });
}
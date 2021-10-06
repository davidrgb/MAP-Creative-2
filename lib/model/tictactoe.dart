class TicTacToe {
  var board = [];
  var playerOneSpaces = [];
  var playerTwoSpaces = [];
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
        board[x][y] = new Space(coordinateX: x, coordinateY: y);
      }
    }
  }
}

class Space {
  late int coordinateX;
  late int coordinateY;
  late int value;

  Space({
    this.coordinateX = -1,
    this.coordinateY = -1,
    this.value = 0,
  });
}
import 'dart:math';

enum Difficulty {
  Easy,
  Normal,
  Hard,
}

class Minesweeper {
  late Difficulty difficulty;
  late int spaces;
  late int root;
  late int traps;
  var board = [];
  late bool gameOver;
  late bool cheats;

  Minesweeper({
    this.difficulty = Difficulty.Easy,
    this.spaces = 25,
    this.root = 5,
    this.traps = 4,
    this.gameOver = false,
    this.cheats = false,
  });

  void createBoard(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.Normal:
        spaces = 64;
        root = 8;
        traps = 10;
        break;
      case Difficulty.Hard:
        spaces = 100;
        root = 10;
        traps = 15;
        break;
      default:
        spaces = 25;
        root = 5;
        traps = 4;
        break;
    }

    var random = new Random();

    // Calculate trap locations
    int trapsToAdd = traps;
    var trapTileIndices = [];
    while (trapsToAdd > 0) {
      int index;
      do {
        index = random.nextInt(spaces);
      }
      while(trapTileIndices.contains(index));
      trapTileIndices.add(index);
      trapsToAdd--;
    }

    // Fill spaces
    for (int i = 0; i < spaces; i++) {
      if (trapTileIndices.contains(i)) board.add(new Space(isTrap: true));
      else board.add(new Space(isTrap: false));
    }

    // Calculate adjacent traps
    for (int i = 0; i < trapTileIndices.length; i++) {
      for (int r = -1; r < 2; r++) {
        for (int c = -1; c < 2; c++) {
          int index = i + (r * root) + c;
          if (index > -1 && index < spaces) board[i + (r * root) + c].adjacentTraps++;
        }
      }
    }
  }
}

class Space {
  late int adjacentTraps;
  late bool isTrap;

  Space({
    this.adjacentTraps = -1,
    this.isTrap = false,
  });

}
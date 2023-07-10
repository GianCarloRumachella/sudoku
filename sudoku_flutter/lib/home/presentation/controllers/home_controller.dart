import 'dart:math';

import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<List<int>> solvedBoard = [];
  List<List<int>> boardReady = [];

  List<List<int>> generateBoard() {
    List<List<int>> grid = List.generate(9, (i) => List<int>.filled(9, 0));

    solveSudoku(grid);
    //hideNumbers(grid, 17);
    return grid;
  }

  bool isValid(List<List<int>> grid, int number, int row, int col) {
    for (int i = 0; i < 9; i++) {
      if (grid[row][i] == number) {
        return false;
      }
    }

    for (int i = 0; i < 9; i++) {
      if (grid[i][col] == number) {
        return false;
      }
    }

    int startRow = (row ~/ 3) * 3;
    int startCol = (col ~/ 3) * 3;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[startRow + i][startCol + j] == number) {
          return false;
        }
      }
    }

    return true;
  }

  bool solveSudoku(List<List<int>> grid) {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (grid[row][col] == 0) {
          for (int num = 1; num <= 9; num++) {
            int number = Random().nextInt(10);
            if (isValid(grid, number, row, col)) {
              grid[row][col] = number;
              if (solveSudoku(grid)) {
                return true;
              }
              grid[row][col] = 0;
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  List<List<int>> hideNumbers(List<List<int>> grid, int count) {
    Random random = Random();

    while (count > 0) {
      int row = random.nextInt(9);
      int col = random.nextInt(9);
      if (grid[row][col] != 0) {
        grid[row][col] = 0;
        count--;
      }
    }

    return grid;
  }
}

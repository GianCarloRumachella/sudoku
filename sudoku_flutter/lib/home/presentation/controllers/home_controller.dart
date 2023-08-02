import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sudoku_flutter/core/ui/widgets/sudoku_number_widget.dart';

class HomeController extends ChangeNotifier {
  List<List<int>> solvedBoard = [];
  List<List<int>> masterBoard = [];
  List<List<int>> boardReady = [];
  ValueNotifier<List<SudokuNumberWidget>> sudokuFields = ValueNotifier<List<SudokuNumberWidget>>([]);

  SudokuNumberWidget? selectedField;

  void init() {
    solvedBoard = generateBoard();

    boardReady = hideNumbers(solvedBoard, 40);
  }

  List<List<int>> generateBoard() {
    List<List<int>> grid = List.generate(9, (i) => List<int>.filled(9, 0));

    solveSudoku(grid);

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
    masterBoard = grid;
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

  SudokuNumberWidget setupBoardFields(int index, List<int> flatGrid, int selectedIndex) {
    double result = index / 3;
    bool leftEndQuadrant = false;
    bool topEndQuadrant = false;
    double rows = index / 9;
    int quadrant = int.parse(((((index ~/ 3) / 3)).toString().split('.')[1].substring(0, 1)));

    int quadrantId = 0;
    if (rows.truncate() >= 0 && rows.truncate() <= 2) {
      if (quadrant == 0) {
        quadrantId = 0;
      } else if (quadrant == 3) {
        quadrantId = 1;
      } else if (quadrant == 6) {
        quadrantId = 2;
      }
    } else if (rows.truncate() >= 3 && rows.truncate() <= 5) {
      if (quadrant == 0) {
        quadrantId = 3;
      } else if (quadrant == 3) {
        quadrantId = 4;
      } else if (quadrant == 6) {
        quadrantId = 5;
      }
    } else if (rows.truncate() >= 6 && rows.truncate() <= 8) {
      if (quadrant == 0) {
        quadrantId = 6;
      } else if (quadrant == 3) {
        quadrantId = 7;
      } else if (quadrant == 6) {
        quadrantId = 8;
      }
    }

    int? col = int.parse((rows % 9).toString().split('.')[1].substring(0, 1));

    if (result.remainder(3) == 1 || result.remainder(3) == 2) {
      leftEndQuadrant = true;
    }
    if ((rows >= 3 && rows < 4) || rows >= 6 && rows < 7 || rows >= 8 && rows < 4) {
      topEndQuadrant = true;
    }

    SudokuNumberWidget sudokuNumber = SudokuNumberWidget(
      leftEndQuadrant: leftEndQuadrant,
      topEndQuadrant: topEndQuadrant,
      colId: col,
      quadrantId: quadrantId,
      rowId: rows.truncate(),
      number: flatGrid[index] == 0 ? '' : flatGrid[index].toString(),
      isLocked: flatGrid[index] != 0 ? true : false,
      index: -1,
      isSelected: selectedIndex != -1 ? true : false,
    );
    sudokuFields.value.add(sudokuNumber);

    return sudokuNumber;
  }

  checkSelectedFields(int col, int row) {
    for (var field in sudokuFields.value) {
      if (field.colId == col && field.rowId == row) {
        print('achou o campo');
        field.isSelected = true;
      } else {
        field.isSelected = false;
      }
    }

    notifyListeners();
  }
}

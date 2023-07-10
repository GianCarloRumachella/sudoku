import 'package:flutter/material.dart';
import 'package:sudoku_flutter/core/ui/widgets/sudoku_number_widget.dart';

class ExternalBorderBoardWidget extends StatefulWidget {
  const ExternalBorderBoardWidget({
    super.key,
  });

  @override
  State<ExternalBorderBoardWidget> createState() => _ExternalBorderBoardWidgetState();
}

class _ExternalBorderBoardWidgetState extends State<ExternalBorderBoardWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.5;
    double width = MediaQuery.of(context).size.width * 0.9;
    int itemCount = 81;
    return SizedBox(
      height: height,
      width: width,
      child: ClipRect(
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(color: Colors.black),
          child: ClipRect(
            child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: width / 9,
                      mainAxisExtent: (height / 9) * .989,
                    ),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      //TODO mover para uma função de setup
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

                      return SudokuNumberWidget(
                        leftEndQuadrant: leftEndQuadrant,
                        topEndQuadrant: topEndQuadrant,
                        colId: col,
                        quadrantId: quadrantId,
                        rowId: rows.truncate(),
                        number: quadrantId + col + rows.truncate(),
                      );
                    },
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

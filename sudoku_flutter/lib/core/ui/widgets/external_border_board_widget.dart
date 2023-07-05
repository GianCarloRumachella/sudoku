import 'package:flutter/material.dart';
import 'package:sudoku_flutter/core/ui/widgets/sudoku_number_widget.dart';

class ExternalBorderBoardWidget extends StatelessWidget {
  const ExternalBorderBoardWidget({
    super.key,
  });

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
                      // childAspectRatio: 3 / 2,
                    ),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      double result = index / 3;
                      bool leftEndQuadrant = false;
                      bool topEndQuadrant = false;
                      double rows = index / 9;

                      if (result.remainder(3) == 1 || result.remainder(3) == 2) {
                        leftEndQuadrant = true;
                      }
                      if ((rows >= 3 && rows < 4) || rows >= 6 && rows < 7 || rows >= 8 && rows < 4) {
                        topEndQuadrant = true;
                      }
                      return SudokuNumberWidget(
                        leftEndQuadrant: leftEndQuadrant,
                        topEndQuadrant: topEndQuadrant,
                        colId: 1,
                        quadrantId: 1,
                        rowId: 1,
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

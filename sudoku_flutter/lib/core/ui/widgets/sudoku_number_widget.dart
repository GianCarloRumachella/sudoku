import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku_flutter/home/presentation/controllers/home_controller.dart';

// ignore: must_be_immutable
class SudokuNumberWidget extends StatefulWidget {
  final bool leftEndQuadrant;
  final bool topEndQuadrant;
  final int rowId;
  final int colId;
  final int quadrantId;
  final String number;
  final bool isLocked;
  bool? isSelected;
  int index;

  SudokuNumberWidget({
    super.key,
    this.leftEndQuadrant = false,
    this.topEndQuadrant = false,
    required this.rowId,
    required this.colId,
    required this.quadrantId,
    required this.number,
    required this.isLocked,
    this.isSelected,
    required this.index,
  });

  @override
  State<SudokuNumberWidget> createState() => _SudokuNumberWidgetState();
}

class _SudokuNumberWidgetState extends State<SudokuNumberWidget> {
  bool isSelected = false;
  @override
  void initState() {
    isSelected = widget.isSelected ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border(
            left: widget.leftEndQuadrant ? const BorderSide(color: Colors.black, width: 2) : const BorderSide(color: Colors.grey),
            top: widget.topEndQuadrant ? const BorderSide(color: Colors.black, width: 2) : const BorderSide(color: Colors.grey),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(1),
          child: Container(
            decoration: BoxDecoration(
              color: widget.isLocked
                  ? Colors.grey[300]
                  : widget.index == -1
                      ? Colors.amber
                      : Colors.cyan,
            ),
            child: Center(child: Text(widget.number.toString())),
          ),
        ),
      ),
    );
  }
}

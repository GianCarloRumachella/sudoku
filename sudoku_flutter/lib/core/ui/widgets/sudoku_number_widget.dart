import 'package:flutter/material.dart';

class SudokuNumberWidget extends StatefulWidget {
  final bool leftEndQuadrant;
  final bool topEndQuadrant;
  final int rowId;
  final int colId;
  final int quadrantId;
  final String number;
  final bool isLocked;

  const SudokuNumberWidget({
    super.key,
    this.leftEndQuadrant = false,
    this.topEndQuadrant = false,
    required this.rowId,
    required this.colId,
    required this.quadrantId,
    required this.number,
    required this.isLocked,
  });

  @override
  State<SudokuNumberWidget> createState() => _SudokuNumberWidgetState();
}

class _SudokuNumberWidgetState extends State<SudokuNumberWidget> {
  bool isSelected = false;

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
        child: GestureDetector(
          onTap: !widget.isLocked
              ? () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                }
              : null,
          child: Container(
            padding: const EdgeInsets.all(1),
            child: Container(
              decoration: BoxDecoration(
                color: widget.isLocked
                    ? Colors.grey[300]
                    : isSelected
                        ? Colors.cyan
                        : Colors.white,
              ),
              child: Center(child: Text(widget.number.toString())),
            ),
          ),
        ),
      ),
    );
  }
}

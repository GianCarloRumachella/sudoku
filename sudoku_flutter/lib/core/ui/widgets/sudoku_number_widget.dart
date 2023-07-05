import 'package:flutter/material.dart';

class SudokuNumberWidget extends StatefulWidget {
  final bool leftEndQuadrant;
  final bool topEndQuadrant;
  final int rowId;
  final int colId;
  final int quadrantId;
  const SudokuNumberWidget({
    super.key,
    this.leftEndQuadrant = false,
    this.topEndQuadrant = false,
    required this.rowId,
    required this.colId,
    required this.quadrantId,
  });

  @override
  State<SudokuNumberWidget> createState() => _SudokuNumberWidgetState();
}

class _SudokuNumberWidgetState extends State<SudokuNumberWidget> {
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
            decoration: const BoxDecoration(color: Colors.white),
            child: const Center(child: Text('1')),
          ),
        ),
      ),
    );
  }
}

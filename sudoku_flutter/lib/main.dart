import 'package:flutter/material.dart';
import 'package:sudoku_flutter/core/ui/widgets/external_border_board_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ExternalBorderBoardWidget(),
        ),
      ),
    );
  }
}

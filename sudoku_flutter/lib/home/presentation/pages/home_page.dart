import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku_flutter/core/ui/widgets/external_border_board_widget.dart';
import 'package:sudoku_flutter/core/ui/widgets/number_button.dart';
import 'package:sudoku_flutter/home/presentation/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    _controller = Modular.get<HomeController>();
    _controller.solvedBoard = _controller.generateBoard();
    _controller.boardReady = _controller.hideNumbers(_controller.solvedBoard, 40);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Scaffold(
        appBar: AppBar(title: const Text('Sudoku')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ExternalBorderBoardWidget(
                filledGrid: _controller.boardReady,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        label: '1',
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        label: '2',
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        label: '3',
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        label: '4',
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        label: '5',
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        label: '6',
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        label: '7',
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        label: '8',
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        label: '9',
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

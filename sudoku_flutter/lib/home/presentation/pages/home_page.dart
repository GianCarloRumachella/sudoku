import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku_flutter/core/ui/widgets/board_widget.dart';
import 'package:sudoku_flutter/core/ui/widgets/number_button.dart';
import 'package:sudoku_flutter/home/presentation/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller = Modular.get<HomeController>();

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: BoardWidget(
                filledGrid: _controller.boardReady,
              ),
            ),
            numberButtons(),
          ],
        ),
      ),
    );
  }

  Padding numberButtons() {
    return const Padding(
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
    );
  }
}

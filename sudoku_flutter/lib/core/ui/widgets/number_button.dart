import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku_flutter/home/presentation/controllers/home_controller.dart';

class NumberButton extends StatelessWidget {
  final String label;
  const NumberButton({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print(Modular.get<HomeController>().sudokuFields.value.length);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(20, 50),
        padding: EdgeInsets.zero,
        fixedSize: const Size(5, 5),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      child: Text(label),
    );
  }
}

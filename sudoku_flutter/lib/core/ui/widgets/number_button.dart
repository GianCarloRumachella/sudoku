import 'package:flutter/material.dart';

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
        print(label);
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

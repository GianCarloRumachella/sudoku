import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku_flutter/home/presentation/controllers/home_controller.dart';

class BoardWidget extends StatefulWidget {
  final List<List<int>> filledGrid;

  const BoardWidget({
    super.key,
    required this.filledGrid,
  });

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  late final HomeController _controller;

  @override
  void initState() {
    _controller = Modular.get<HomeController>();
    super.initState();
  }

  int selectedindex = -1;
  List<int> flatGrid = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.5;
    double width = MediaQuery.of(context).size.width * 0.9;
    flatGrid = widget.filledGrid.expand((element) => element).toList();
    _controller.sudokuFields.value.clear();
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
                    maxCrossAxisExtent: (width / 9) * .989,
                    mainAxisExtent: (height / 9) * .989,
                  ),
                  itemCount: flatGrid.length,
                  itemBuilder: (context, index) {
                    return sudokuNumber(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget sudokuNumber(int index) {
    return GestureDetector(
      onTap: flatGrid[index] == 0
          ? () {
              setState(() {
                if (selectedindex != index) {
                  selectedindex = index;
                  print("xalala ${Modular.get<HomeController>().masterBoard.first}");
                } else {
                  selectedindex = -1;
                }
              });
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: flatGrid[index] != 0
              ? Colors.grey
              : selectedindex == index
                  ? Colors.green[300]
                  : Colors.white,
          border: const Border(
            right: BorderSide(
              color: Colors.black,
              width: 2,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
        child: Center(
          child: Text(
            flatGrid[index] == 0 ? '' : flatGrid[index].toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

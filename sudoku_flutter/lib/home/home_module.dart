import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku_flutter/app_routes.dart';
import 'package:sudoku_flutter/home/presentation/controllers/home_controller.dart';
import 'package:sudoku_flutter/home/presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<HomeController>((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (context, args) => const HomePage(),
        )
      ];
}

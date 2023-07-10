import 'package:flutter_modular/flutter_modular.dart';
import 'package:sudoku_flutter/core/ui/widgets/core_module.dart';
import 'package:sudoku_flutter/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: CoreModule()),
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];
}

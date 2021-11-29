import 'package:get/get.dart';
import 'package:pttifyme/controller/getbinding.dart';
import 'package:pttifyme/views/homepage.dart';

class RoutePages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(name: _Paths.home, page: () => HomePage(), binding: HomeBinding())
  ];
}
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const home = _Paths.home;
}

abstract class _Paths {
  static const home = '/home';
}

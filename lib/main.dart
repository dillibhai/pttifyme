import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pttifyme/constraints/routes.dart';
import 'package:pttifyme/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pttify',
      initialRoute: RoutePages.initial,
      getPages: RoutePages.routes,
      themeMode: ThemeMode.light,
      theme: ThemeData(),
    );
  }
}

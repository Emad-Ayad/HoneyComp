import 'package:flutter/material.dart';
import 'package:honey_comp/core/helper_functions/routes_generator.dart';
import 'package:honey_comp/features/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routerGenerator,
      initialRoute: SplashView.roteName,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:honey_comp/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:honey_comp/features/splash/presentation/view/splash_view.dart';

Route<dynamic> routerGenerator(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.roteName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.onBoardingRoute:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

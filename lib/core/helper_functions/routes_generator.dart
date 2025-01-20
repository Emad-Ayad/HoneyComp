import 'package:flutter/material.dart';
import 'package:honey_comp/features/auth/presentaion/view/login_view.dart';
import 'package:honey_comp/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:honey_comp/features/splash/presentation/view/splash_view.dart';

Route<dynamic> routerGenerator(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.roteName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.onBoardingRoute:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

      default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

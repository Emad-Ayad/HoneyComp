import 'package:flutter/material.dart';
import 'package:honey_comp/features/auth/presentaion/view/login_view.dart';
import 'package:honey_comp/features/auth/presentaion/view/sign_up_view.dart';
import 'package:honey_comp/features/best_selling/presentation/view/best_selling_view.dart';
import 'package:honey_comp/features/home/presentation/view/home_view.dart';
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

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

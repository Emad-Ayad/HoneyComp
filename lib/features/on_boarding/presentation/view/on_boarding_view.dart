
import 'package:flutter/material.dart';
import 'package:honey_comp/features/on_boarding/presentation/view/widgets/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const String onBoardingRoute='onBoarding';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingBody(),
    );
  }
}

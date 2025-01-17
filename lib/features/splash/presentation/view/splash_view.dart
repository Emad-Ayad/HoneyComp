import 'package:flutter/material.dart';
import 'package:honey_comp/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:honey_comp/gen/assets.gen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const roteName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    executeRouting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.65,
                width: MediaQuery.sizeOf(context).width * 0.65,
                child: Assets.images.honeySplash.image()),
          )
        ],
      ),
    );
  }

  void executeRouting() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.onBoardingRoute);
    });
  }
}

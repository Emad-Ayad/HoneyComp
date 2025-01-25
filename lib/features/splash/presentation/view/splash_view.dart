import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/constants.dart';
import 'package:honey_comp/core/services/shared_preferences_singleton.dart';
import 'package:honey_comp/features/auth/presentaion/view/login_view.dart';
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
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
        ),
      ),
    );
  }

  void executeRouting() {
    bool isOnBoardingSeen =
        SharedPreferenceSingleton.getBool(kIsOnBoardingSeen);
    Future.delayed(const Duration(seconds: 2), () {
      if (isOnBoardingSeen) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.onBoardingRoute);
      }
    });
  }
}

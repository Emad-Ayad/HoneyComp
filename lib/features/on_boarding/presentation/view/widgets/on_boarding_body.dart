import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/constants.dart';
import 'package:honey_comp/core/services/shared_preferences_singleton.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';
import 'package:honey_comp/features/auth/presentaion/view/login_view.dart';
import 'package:honey_comp/features/on_boarding/presentation/view/widgets/on_boarding_page_view.dart';
import 'package:honey_comp/generated/l10n.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.primaryColor
                .withOpacity(currentPage == 0 ? 0.5 : 1),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Visibility(
          visible: currentPage == 1 ,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(onPressed: () {
              SharedPreferenceSingleton.setBool(kIsOnBoardingSeen, true);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            }, title:S.of(context).startNow),
          ),
        ),
        const SizedBox(height: 34),
      ],
    );
  }
}

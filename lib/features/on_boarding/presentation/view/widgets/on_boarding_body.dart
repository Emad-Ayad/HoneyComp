import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/custom_button.dart';
import 'package:honey_comp/features/on_boarding/presentation/view/widgets/on_boarding_page_view.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Expanded(
          child: OnBoardingPageView(),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.secondaryColor,
            color: AppColors.secondaryColor.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: CustomButton(onPressed: (){}, title: "ابدأ الان"),
        ),
        const SizedBox(height: 34),
      ],
    );
  }
}

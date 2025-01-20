import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/features/on_boarding/presentation/view/widgets/on_boarding_item.dart';
import 'package:honey_comp/gen/assets.gen.dart';
import 'package:honey_comp/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnBoardingItem(
          isVisible: true,
          image: Assets.images.honeyPot,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).welcome, style: AppTextStyles.heading3),
              //TODO adjust it to be fine in en localization
              const Text("Comp", style: AppTextStyles.highlightedText),
              const Text("Honey", style: AppTextStyles.heading3),
            ],
          ),
          subTitle: S.of(context).onboard1,
        ),
        OnBoardingItem(
          isVisible: false,
          image: Assets.images.honeyPot2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).welcome2,
                style: AppTextStyles.heading3,
              ),
            ],
          ),
          subTitle: S.of(context).onboard2,
        ),
      ],
    );
  }
}

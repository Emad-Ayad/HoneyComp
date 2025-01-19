import 'package:flutter/material.dart';
import 'package:honey_comp/features/on_boarding/presentation/view/widgets/on_boarding_item.dart';
import 'package:honey_comp/gen/assets.gen.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        OnBoardingItem(
          image: Assets.images.honeyPot,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "مرحبًا بك في ",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Comp",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: Colors.orangeAccent),
              ),
              Text(
                "Honey",
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          subTitle:
              "اكتشف تجربة تسوق فريدة مع HoneyComp. استكشف مجموعتنا الواسعة من العسل الطبيعي الممتاز واحصل على أفضل العروض والجودة العالية.",
        ),
        OnBoardingItem(
          image: Assets.images.honeyPot2,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ابحث وتسوق",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          subTitle:
              "نقدم لك أفضل انواع العسل المختار بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار العسل المناسب.",
        ),
      ],
    );
  }
}

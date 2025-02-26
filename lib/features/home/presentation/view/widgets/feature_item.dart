import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/gen/assets.gen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import 'custom_features_button.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width * 0.85,
        height: MediaQuery.sizeOf(context).height * 0.2,
        child: Stack(
          children: [
            Positioned(
              right: width * 0.4,
              child: Image.asset(
                Assets.images.honeyStick.path,
                height: MediaQuery.sizeOf(context).height * 0.2,
              ),
            ),
            Container(
              width: width * 0.46,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4)),
                image: DecorationImage(
                    image: svg.Svg(Assets.images.ellipse), fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      "عروض رمضان",
                      style:
                          AppTextStyles.bodyText1.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      "خصم 30%",
                      style:
                          AppTextStyles.heading3.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    CustomFeaturesButton(
                      onPressed: () {},
                      title: "تسوق الان",
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

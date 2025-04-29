import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/gen/assets.gen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import 'custom_features_button.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width * 0.85,
        height: height * 0.2,
        child: Stack(
          children: [
            Positioned(
              right: width * 0.4,
              child: Image.asset(
                Assets.images.honeyStick.path,
                height: height * 0.2,
              ),
            ),

            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Container(
                width: width * 0.46,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.images.ellipse),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "عروض رمضان",
                        style: AppTextStyles.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "خصم 30%",
                        style: AppTextStyles.heading3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomFeaturesButton(
                        onPressed: () {},
                        title: "تسوق الان",
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

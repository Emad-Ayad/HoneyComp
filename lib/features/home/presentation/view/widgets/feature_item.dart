import 'package:honey_comp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/gen/assets.gen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import '../../../../../core/constants/app_colors.dart';
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
      child: Container(
        width: width * 0.85,
        height: height * 0.2,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColors.lightGray,
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ]),
        child: Stack(
          children: [
            Positioned.directional(
              textDirection: Directionality.of(context),
              start: width * 0.4,
              child: Image.asset(
                Assets.images.honeyStick.path,
                height: height * 0.2,
              ),
            ),

            ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(12),
                bottomStart: Radius.circular(12),
              ).resolve(Directionality.of(context)),
              child: Container(
                width: width * 0.46,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.images.ellipse),
                    fit: BoxFit.fill,
                    matchTextDirection: true,
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
                        S.of(context).ramadanOffers,
                        style: AppTextStyles.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        S.of(context).discount30,
                        style: AppTextStyles.heading3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomFeaturesButton(
                        onPressed: () {},
                        title: S.of(context).shopNow,
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

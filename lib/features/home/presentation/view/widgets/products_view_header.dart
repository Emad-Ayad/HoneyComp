import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../gen/assets.gen.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});

  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${productsLength} نتائج ",
            style:
                AppTextStyles.subtitle1.copyWith(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            // TODO on tap
            onTap: () {},
            child: SvgPicture.asset(Assets.images.icons.arrowSwapHorizontal),
          ),
        ],
      ),
    );
  }
}

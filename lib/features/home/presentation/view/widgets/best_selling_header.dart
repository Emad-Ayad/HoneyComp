import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "الأكثر مبيعاً",
            style:
                AppTextStyles.subtitle1.copyWith(fontWeight: FontWeight.bold),
          ),
          const Text(
            "المزيد",
            style: AppTextStyles.bodyText1,
          ),
        ],
      ),
    );
  }
}

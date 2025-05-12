import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({
    super.key,
    required this.text,
    required this.index,
  });

  final String text;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            backgroundColor: AppColors.lightGray.withValues(alpha: 0.5),
            radius: 12,
            child: Text(index)),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.bodyText2.copyWith(
            color: AppColors.gray,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

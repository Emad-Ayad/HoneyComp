import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 12,
          child: Icon(
            Icons.check,
            size: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.bodyText2.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

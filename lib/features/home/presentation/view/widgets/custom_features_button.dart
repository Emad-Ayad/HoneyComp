import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';

class CustomFeaturesButton extends StatelessWidget {
  const CustomFeaturesButton({super.key, required this.onPressed, required this.title});

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      width: MediaQuery.sizeOf(context).width *0.3,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(
          child: Text(
            title,
            style: AppTextStyles.buttonText.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}

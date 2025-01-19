import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title});

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

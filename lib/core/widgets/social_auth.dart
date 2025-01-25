import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({
    super.key,
    required this.onPressed,
    required this.title,
    required this.icon,
  });

  final VoidCallback onPressed;
  final String title;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xffDDDFDF), width: 1)),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: icon,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.buttonText.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

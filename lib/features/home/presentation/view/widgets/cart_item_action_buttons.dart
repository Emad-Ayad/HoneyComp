import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
            icon: Icons.add,
            iconColor: Colors.white,
            color: AppColors.primaryColor,
            onPressed: () {}),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("3",
              style: AppTextStyles.bodyText2
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        CartItemActionButton(
            icon: Icons.remove,
            iconColor: Colors.black54,
            color: Colors.white70,
            onPressed: () {}),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.color,
      required this.onPressed});

  final IconData icon;
  final Color iconColor, color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 24,
        width: 24,
        padding: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

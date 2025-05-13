import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isSelected,
      required this.onPressed});

  final String title, subtitle, price;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? AppColors.primaryColor : Colors.transparent),
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18,
                  width: 18,
                  decoration: ShapeDecoration(
                    color: isSelected
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    shape: const OvalBorder(
                        side: BorderSide(
                      width: 1,
                      color: AppColors.primaryColor,
                    )),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.subtitle2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodyText2,
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    price,
                    style: AppTextStyles.subtitle2
                        .copyWith(color: AppColors.primaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

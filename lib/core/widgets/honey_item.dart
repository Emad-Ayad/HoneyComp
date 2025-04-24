import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/gen/assets.gen.dart';

class HoneyItem extends StatelessWidget {
  const HoneyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  Assets.images.honey1.path,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),

              // Product Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "سدر جبلي",
                          style: AppTextStyles.bodyText1.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "200 جنيه / \n الكيلو",
                          style: AppTextStyles.subtitle2.copyWith(
                            color: AppColors.secondaryColor,
                            fontSize: 16
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
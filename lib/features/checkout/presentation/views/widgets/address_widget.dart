import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "عنوان التوصيل",
              style:
                  AppTextStyles.bodyText2.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Icon(
              Icons.edit,
              color: AppColors.gray,
            )
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppColors.gray,
              size: 32,
            ),
            Text(
              "شارع النيل، مبنى رقم ١٢٣",
              style: AppTextStyles.bodyText1,
            )
          ],
        )
      ],
    );
  }
}

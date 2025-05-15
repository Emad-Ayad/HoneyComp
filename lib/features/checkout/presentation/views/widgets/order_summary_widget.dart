import 'package:flutter/material.dart';

import '../../../../../core/constants/app_text_styles.dart';


class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "المجموع الفرعي :",
              style: AppTextStyles.bodyText2,
            ),
            const Spacer(),
            Text(
              "150 جنيه",
              style: AppTextStyles.bodyText1
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 9),
        const Row(
          children: [
            Text(
              "التوصيل  :",
              style: AppTextStyles.bodyText2,
            ),
            Spacer(),
            Text(
              "40 جنيه",
              style: AppTextStyles.bodyText2,
            ),
            SizedBox(width: 20),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
          child: Divider(
            thickness: 0.5,
          ),
        ),
        Row(
          children: [
            Text(
              "الكلي",
              style: AppTextStyles.bodyText1
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "180 جنيه",
              style: AppTextStyles.bodyText1
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

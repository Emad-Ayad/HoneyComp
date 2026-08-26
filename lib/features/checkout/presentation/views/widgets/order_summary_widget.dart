import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';

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
              "${context.read<OrdersEntity>().cartEntity.getTotalPrice()} جنيه",
              style:
                  AppTextStyles.bodyText1.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            const Text(
              "التوصيل  :",
              style: AppTextStyles.bodyText2,
            ),
            const Spacer(),
            Text(
              "${context.read<OrdersEntity>().payWithCash == true ? 40 : 0} جنيه",
              style: AppTextStyles.bodyText2,
            ),
            const SizedBox(width: 20),
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
              style:
                  AppTextStyles.bodyText1.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "${context.read<OrdersEntity>().cartEntity.getTotalPrice() + (context.read<OrdersEntity>().payWithCash == true ? 40 : 0)} جنيه",
              style:
                  AppTextStyles.bodyText1.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

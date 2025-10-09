import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';

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
            GestureDetector(
              child: const Icon(
                Icons.edit,
                color: AppColors.gray,
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
         Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.gray,
              size: 32,
            ),
            Text(
              "${context.read<OrdersEntity>().shippingAddressEntity}",
              style: AppTextStyles.bodyText1,
            )
          ],
        )
      ],
    );
  }
}

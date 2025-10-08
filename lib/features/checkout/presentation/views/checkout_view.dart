import 'package:flutter/material.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../home/domain/entities/cart_entity.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Provider.value(
        value: OrdersEntity(cartEntity),
        child: const CheckoutViewBody(),
      ),
    );
  }
}

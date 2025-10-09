import 'package:flutter/material.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../home/domain/entities/cart_entity.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  _CheckoutViewState createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late final OrdersEntity ordersEntity;

  @override
  void initState() {
    super.initState();
    ordersEntity = OrdersEntity(widget.cartEntity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Provider<OrdersEntity>(
        create: (_) => ordersEntity,
        child: const CheckoutViewBody(),
      ),
    );
  }
}

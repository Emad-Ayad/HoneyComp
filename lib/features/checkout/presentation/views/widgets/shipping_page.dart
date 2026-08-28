import 'package:honey_comp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingPage extends StatefulWidget {
  const ShippingPage({super.key});

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // this super is for the automatic Mixin above
    super.build(context);
    var orderEntity = context.read<OrdersEntity>();
    return Column(
      children: [
        const SizedBox(height: 32),
        ShippingItem(
          title: S.of(context).cashOnDelivery,
          subtitle: S.of(context).deliveryOnSpot,
          price: (orderEntity.cartEntity.getTotalPrice() + 40).toString(),
          onPressed: () {
            selectedIndex = 0;
            setState(() {});
            orderEntity.payWithCash = true;
          },
          isSelected: selectedIndex == 0,
        ),
        const SizedBox(height: 16),
        ShippingItem(
          title: S.of(context).onlinePayment,
          subtitle: S.of(context).deliveryOnSpot,
          price: context
              .read<OrdersEntity>()
              .cartEntity
              .getTotalPrice()
              .toString(),
          onPressed: () {
            selectedIndex = 1;
            setState(() {});
            orderEntity.payWithCash = false;
          },
          isSelected: selectedIndex == 1,
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

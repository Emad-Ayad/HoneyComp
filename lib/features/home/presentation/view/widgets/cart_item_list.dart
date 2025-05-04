import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/features/home/domain/entities/cart_item_entity.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartList});

  final List<CartItemEntity> cartList;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const Divider(
        color: AppColors.lightGray,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return CartItem(cartItemEntity: cartList[index]);
      },
    );
  }
}

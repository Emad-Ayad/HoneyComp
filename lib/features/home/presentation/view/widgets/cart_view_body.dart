import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

import '../../../../../core/widgets/build_app_bar.dart';
import 'cart_item_list.dart';
import 'cart_view_header.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(context,
                    title: "السلة", backButtonVisibility: false),
                const SizedBox(height: 8),
                const CartViewHeader(),
                const SizedBox(height: 8),
              ],
            ),
          ),
          CartItemList(
            cartList: context.watch<CartCubit>().cartEntity.cartList,
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: CustomCartButton(),
          )
        ],
      ),
    );
  }
}

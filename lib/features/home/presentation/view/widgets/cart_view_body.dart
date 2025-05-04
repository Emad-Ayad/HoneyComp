import 'package:flutter/material.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';

import '../../../../../core/widgets/build_app_bar.dart';
import 'cart_item_list.dart';
import 'cart_view_header.dart';

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
                    title: "السلة",
                  backButtonVisibility: false
                   ),
                const SizedBox(height: 8),
                const CartViewHeader(),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const CartItemList(cartList: []),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(onPressed: (){}, title: 'الدفع 120 جنيه'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

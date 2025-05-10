import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

import '../../../../../core/constants/app_colors.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF0B5).withValues(alpha: 0.7),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
            "لديك ${context.watch<CartCubit>().cartEntity.cartList.length} منتج في السلة ",
            style:
                AppTextStyles.bodyText2.copyWith(color: AppColors.darkBrown)),
      ),
    );
  }
}

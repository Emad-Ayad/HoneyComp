import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/features/home/domain/entities/cart_item_entity.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

import 'cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current){
        if(current is CartItemUpdated){
          if(current.cartItemEntity==cartItemEntity){
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicWidth(
          child: Row(
            children: [
              Container(
                height: 100,
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(cartItemEntity.productEntity.imageUrl!),
                ),
              ),
              const SizedBox(width: 17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: AppTextStyles.bodyText1,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .deleteFromCart(cartItemEntity);
                          },
                          child: const Icon(Icons.delete_outline),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        "${cartItemEntity.productEntity.unitAmount} كجم",
                        style: AppTextStyles.bodyText2
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                    Row(
                      children: [
                        CartItemActionButtons(
                          cartItemEntity: cartItemEntity,
                        ),
                        const Spacer(),
                        Text(
                          "${cartItemEntity.calculateTotalPrice()} جنيه",
                          style: AppTextStyles.subtitle1
                              .copyWith(color: AppColors.primaryColor),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

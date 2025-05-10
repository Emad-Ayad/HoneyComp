import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/widgets/build_snack_bar.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/products_view.dart';

import 'cart_view.dart';
import 'home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          buildSnackBar(context, "تمت اضافة المنتج الي السلة بنجاح");
        }
        if (state is CartItemRemoved) {
          buildSnackBar(context, "تم حذف المنتج من السلة بنجاح");
        }
      },
      child: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeView(),
            ProductsView(),
            CartView(),
          ],
        ),
      ),
    );
  }
}

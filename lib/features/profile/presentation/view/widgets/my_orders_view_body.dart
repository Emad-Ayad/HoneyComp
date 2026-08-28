import 'package:honey_comp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/features/profile/presentation/cubits/my_orders_cubit/my_orders_cubit.dart';
import 'package:honey_comp/features/profile/presentation/view/widgets/order_card.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        if (state is MyOrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MyOrdersFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: AppTextStyles.subtitle2,
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is MyOrdersSuccess) {
          if (state.orders.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noPreviousOrders,
                style: AppTextStyles.subtitle1,
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.orders.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return OrderCard(order: state.orders[index]);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}

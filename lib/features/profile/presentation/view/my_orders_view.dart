import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/features/checkout/domain/repos/orders_repo.dart';
import 'package:honey_comp/features/profile/presentation/cubits/my_orders_cubit/my_orders_cubit.dart';
import 'package:honey_comp/features/profile/presentation/view/widgets/my_orders_view_body.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';

class MyOrdersView extends StatelessWidget {
  static const String routeName = 'my_orders';

  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrdersCubit(getIt.get<OrdersRepo>())..fetchUserOrders(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'طلباتي',
            style: AppTextStyles.subtitle1,
          ),
          centerTitle: true,
        ),
        body: const MyOrdersViewBody(),
      ),
    );
  }
}

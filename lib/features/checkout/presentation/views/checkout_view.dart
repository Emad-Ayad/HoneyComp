import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:honey_comp/features/checkout/domain/repos/orders_repo.dart';
import 'package:honey_comp/features/checkout/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/helper_functions/get_user_data.dart';
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
    ordersEntity = OrdersEntity(widget.cartEntity, uId: getUser().id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (context) => OrdersCubit(getIt.get<OrdersRepo>()),
        child: Provider<OrdersEntity>(
          create: (_) => ordersEntity,
          child: const CheckoutViewBody(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/checkout_view_body.dart';

import '../../../../core/constants/app_colors.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const routeName = 'checkout';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: CheckoutViewBody(),
    );
  }
}

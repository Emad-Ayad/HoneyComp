import 'package:flutter/material.dart';
import 'package:honey_comp/core/widgets/build_app_bar.dart';

import 'checkout_steps.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          buildAppBar(context, title: "الشحن"),
          SizedBox(height: 8),
          CheckoutSteps()
        ],
      ),
    );
  }
}

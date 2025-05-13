import 'package:flutter/material.dart';
import 'package:honey_comp/core/widgets/build_app_bar.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';

import 'checkout_page_view.dart';
import 'checkout_steps.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          buildAppBar(context, title: "الشحن"),
          const SizedBox(height: 20),
          const CheckoutSteps(),
          CheckoutPageView(pageController: pageController),
          CustomButton(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn);
              },
              title: 'التالي'),
          const SizedBox(height: 32)
        ],
      ),
    );
  }
}

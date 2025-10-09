import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/address_page.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/payment_page.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/shipping_page.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView(
      {super.key,
      required this.pageController,
      required this.formKey,
      required this.valueListenable});

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: getSteps().length,
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return getPages()[index];
        },
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingPage(),
      AddressPage(
        formKey: formKey,
        valueListenable: valueListenable,
      ),
      PaymentPage(
        pageController: pageController,
      ),
    ];
  }
}

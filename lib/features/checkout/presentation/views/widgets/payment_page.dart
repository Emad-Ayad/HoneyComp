import 'package:honey_comp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/payment_item.dart';

import 'address_widget.dart';
import 'order_summary_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.pageController});

  final PageController pageController;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 32),
          PaymentItem(
            title: S.of(context).orderSummary,
            child: const OrderSummaryWidget(),
          ),
          const SizedBox(height: 16),
          PaymentItem(
            title: S.of(context).pleaseConfirmYourOrder,
            child: AddressWidget(pageController: pageController,),
          )
        ],
      ),
    );
  }
}

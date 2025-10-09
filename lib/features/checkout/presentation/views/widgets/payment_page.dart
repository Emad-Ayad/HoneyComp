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
          const PaymentItem(
            title: "ملخص الطلب:",
            child: OrderSummaryWidget(),
          ),
          const SizedBox(height: 16),
          PaymentItem(
            title: 'يرجي تأكيد  طلبك',
            child: AddressWidget(pageController: pageController,),
          )
        ],
      ),
    );
  }
}

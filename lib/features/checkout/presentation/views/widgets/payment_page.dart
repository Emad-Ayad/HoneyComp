import 'package:flutter/material.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/payment_item.dart';

import 'address_widget.dart';
import 'order_summary_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 32),
        PaymentItem(
          title: "ملخص الطلب:",
          child: OrderSummaryWidget(),
        ),
        SizedBox(height: 16),
        PaymentItem(
          title: 'يرجي تأكيد  طلبك',
          child: AddressWidget(),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/in_active_step_item.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPageIndex});

  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(getSteps().length, (index) {
      return Expanded(
        child: StepItem(
          text: getSteps()[index],
          index: (index + 1).toString(),
          isActive: currentPageIndex >= index,
        ),
      );
    }));
  }
}

List<String> getSteps() {
  return [
    'الشحن',
    'العنوان',
    'الدفع',
  ];
}

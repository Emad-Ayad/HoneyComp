import 'package:flutter/material.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/in_active_step_item.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});

  final int currentPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(getSteps().length, (index) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn);
          },
          child: StepItem(
            text: getSteps()[index],
            index: (index + 1).toString(),
            isActive: currentPageIndex >= index,
          ),
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

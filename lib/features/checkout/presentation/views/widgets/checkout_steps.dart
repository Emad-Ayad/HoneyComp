import 'package:honey_comp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/in_active_step_item.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/step_item.dart';

import '../../../../../core/widgets/build_snack_bar.dart';
import '../../../domain/entities/orders_entity.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});

  final int currentPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var orderEntity=context.read<OrdersEntity>();
    return Row(
        children: List.generate(getSteps(context).length, (index) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            if (index > currentPageIndex) {
              return;
            }
            if(orderEntity.payWithCash != null){
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn);
            }else{
              buildSnackBar(context,S.of(context).pleaseChoosePaymentMethod);
            }
          },
          child: StepItem(
            text: getSteps(context)[index],
            index: (index + 1).toString(),
            isActive: currentPageIndex >= index,
          ),
        ),
      );
    }));
  }
}

List<String> getSteps(BuildContext context) {
  return [
    S.of(context).shipping,
    S.of(context).address,
    S.of(context).payment,
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/widgets/build_app_bar.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';

import '../../../../../core/widgets/build_snack_bar.dart';
import 'checkout_page_view.dart';
import 'checkout_steps.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentPageIndex = 0;

  final GlobalKey<FormState> formKey = GlobalKey();
  final ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrdersEntity>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          buildAppBar(context, title: "الشحن"),
          const SizedBox(height: 20),
          CheckoutSteps(
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          CheckoutPageView(
            pageController: pageController,
            formKey: formKey,
            valueListenable: valueNotifier,
          ),
          CustomButton(
              onPressed: () {
                if (currentPageIndex == 0) {
                  _handelShippingSectionValidation(orderEntity, context);
                } else if (currentPageIndex == 1) {
                  _handelAddressValidation();
                }
              },
              title: 'التالي'),
          const SizedBox(height: 32)
        ],
      ),
    );
  }

  void _handelShippingSectionValidation(
      OrdersEntity orderEntity, BuildContext context) {
    if (orderEntity.payWithCash != null) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      buildSnackBar(context, "برجاء اختيار طريقة الدفع");
    }
  }

  void _handelAddressValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }
}

import 'package:honey_comp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/widgets/build_app_bar.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:honey_comp/features/checkout/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:honey_comp/features/checkout/presentation/cubits/orders_cubit/orders_state.dart';
import 'package:honey_comp/features/checkout/presentation/views/payment_webview.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:honey_comp/features/home/presentation/view/main_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) async {
        if (state is OrdersSuccess) {
          buildSnackBar(context, S.of(context).orderConfirmedSuccessfully);
          context.read<CartCubit>().clearCart();
          Navigator.pushNamedAndRemoveUntil(
              context, MainView.routeName, (route) => false);
        } else if (state is OrdersFailure) {
          buildSnackBar(context, state.errMessage);
        } else if (state is OrdersPaymentKeyGenerated) {
          // Launch Paymob WebView
          final bool? paymentSuccess = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentWebView(paymentKey: state.paymentKey),
            ),
          );
          
          if (paymentSuccess == true) {
            // If payment succeeds, tell Cubit to save to database
            if (!mounted) return;
            context.read<OrdersCubit>().saveOrderToDatabase(orderEntity);
          } else {
            // Payment failed or cancelled
            if (!mounted) return;
            buildSnackBar(context, S.of(context).electronicPaymentFailed);
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is OrdersLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                buildAppBar(context, title: S.of(context).shipping),
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
                      } else if (currentPageIndex == 2) {
                        context.read<OrdersCubit>().processCheckout(orderEntity);
                      }
                    },
                    title: currentPageIndex == 2 ? S.of(context).confirmOrder : 'التالي'),
                const SizedBox(height: 32)
              ],
            ),
          ),
        );
      },
    );
  }

  void _handelShippingSectionValidation(
      OrdersEntity orderEntity, BuildContext context) {
    if (orderEntity.payWithCash != null) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      buildSnackBar(context, S.of(context).pleaseChoosePaymentMethod);
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

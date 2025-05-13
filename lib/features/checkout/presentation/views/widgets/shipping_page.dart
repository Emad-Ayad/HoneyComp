import 'package:flutter/material.dart';
import 'package:honey_comp/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingPage extends StatefulWidget {
  const ShippingPage({super.key});

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        ShippingItem(
          title: "الدفع عند الاستلام",
          subtitle: 'التسليم في المكان',
          price: '40 جنيهاً',
          onPressed: () {
            selectedIndex = 0;
            setState(() {});
          },
          isSelected: selectedIndex == 0,
        ),
        const SizedBox(height: 16),
         ShippingItem(
          title: "الدفع اونلاين",
          subtitle: 'التسليم في المكان',
          price: '40 جنيهاً',
          onPressed: () {
            selectedIndex = 1;
            setState(() {});
          },
          isSelected: selectedIndex == 1,
        )
      ],
    );
  }
}

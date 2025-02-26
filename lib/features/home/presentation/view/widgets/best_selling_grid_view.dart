import 'package:flutter/material.dart';
import 'package:honey_comp/core/widgets/honey_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        mainAxisSpacing: 12,
        crossAxisSpacing: 16,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const HoneyItem();
      },
    );
  }
}

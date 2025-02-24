import 'package:flutter/material.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/feature_item.dart';

class FeaturesList extends StatelessWidget {
  const FeaturesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index){
          return const FeatureItem();
        })
      ),
    );
  }
}

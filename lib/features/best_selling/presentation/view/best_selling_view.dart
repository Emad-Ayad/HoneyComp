import 'package:flutter/material.dart';
import 'package:honey_comp/core/widgets/build_best_selling_app_bar.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = 'bestSellingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildBestSellingAppBar(context),
    );
  }
}

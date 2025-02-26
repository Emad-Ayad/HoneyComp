import 'package:flutter/material.dart';
import 'package:honey_comp/core/widgets/honey_item.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/best_selling_grid_view.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/custom_home_app_bar.dart';

import 'best_selling_header.dart';
import 'custom_search_field.dart';
import 'features_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                CustomSearchField(),
                FeaturesList(),
                SizedBox(height: 8),
                BestSellingHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridView(),

        ],
      ),
    );
  }
}

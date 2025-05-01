import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/widgets/build_app_bar.dart';
import 'package:honey_comp/features/home/presentation/cubits/products_cubit.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/products_view_header.dart';

import 'best_selling_grid_view_bloc_builder.dart';
import 'custom_search_field.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(context,
                    title: "المنتجات",
                    backButtonVisibility: false,
                    notificationVisibility: true),
                CustomSearchField(),
                SizedBox(height: 8),
                ProductsViewHeader(
                    productsLength:
                        context.read<ProductsCubit>().productsLength),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/helper_functions/dummy_product.dart';
import 'package:honey_comp/features/home/presentation/cubits/products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'products_grid_view.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.errMessage)));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(
              products: getDummyProducts(),
            ),
          );
        }
      },
    );
  }
}

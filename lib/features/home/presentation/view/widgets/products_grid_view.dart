import 'package:flutter/material.dart';
import 'package:honey_comp/core/widgets/honey_item.dart';
import 'package:honey_comp/features/home/domain/entities/product_entity.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        mainAxisSpacing: 12,
        crossAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return HoneyItem(
          productEntity: products[index],
        );
      },
    );
  }
}

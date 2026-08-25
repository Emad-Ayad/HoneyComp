import 'package:honey_comp/features/home/domain/entities/cart_item_entity.dart';
import 'package:honey_comp/features/home/data/models/product_model.dart';

class CartItemModel {
  final ProductModel productModel;
  final int count;

  CartItemModel({required this.productModel, required this.count});

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productModel: ProductModel.formJson(json['product']),
      count: json['count'],
    );
  }

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      productModel: ProductModel.fromEntity(entity.productEntity),
      count: entity.count,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': productModel.toJson(),
      'count': count,
    };
  }

  CartItemEntity toEntity() {
    return CartItemEntity(
      productEntity: productModel.toEntity(),
      count: count,
    );
  }
}

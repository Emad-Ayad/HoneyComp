import 'dart:io';

import '../../features/home/domain/entities/product_entity.dart';

ProductEntity dummyProduct = ProductEntity(
  name: 'Organic Honey',
  code: 'HON123',
  description: 'Fresh organic Honey from local farm',
  isFeatured: true,
  price: 4.99,
  image: File(''),
  expirationMonths: 6,
  numOfCalories: 95,
  unitAmount: 1,
  reviews: [],
  isOrganic: true,
);

List<ProductEntity> getDummyProducts() {
  return [
    dummyProduct,
    dummyProduct,
    dummyProduct,
    dummyProduct,
    dummyProduct,
    dummyProduct,
  ];
}

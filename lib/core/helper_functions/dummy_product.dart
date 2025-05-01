import 'dart:io';

import '../../features/home/domain/entities/product_entity.dart';

ProductEntity dummyProduct = ProductEntity(
    name: 'Organic Honey',
    code: 'HON123',
    description: 'Fresh organic Honey from local farm',
    isFeatured: true,
    price: 4.99,
    expirationMonths: 6,
    numOfCalories: 95,
    unitAmount: 1,
    reviews: [],
    isOrganic: true,
    avgRate: 3,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFphhoLs8JsIvWVih9BQHqbVp3v-xd_eyPAw&s');

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

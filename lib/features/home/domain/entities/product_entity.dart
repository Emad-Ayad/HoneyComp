import 'dart:io';

import 'package:honey_comp/features/home/domain/entities/review_entity.dart';

class ProductEntity {
  final String name, code, description;
  final num price;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;

  final int numOfCalories;
  final num avgRate = 0;
  final num ratingCount = 0;

  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductEntity(
      {required this.name,
      required this.code,
      required this.description,
      required this.isFeatured,
      required this.price,
      required this.image,
      required this.expirationMonths,
      required this.numOfCalories,
      required this.unitAmount,
      required this.reviews,
      this.isOrganic = false,
      this.imageUrl});
}

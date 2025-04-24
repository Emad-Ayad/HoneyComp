import 'dart:io';

import 'package:honey_comp/features/home/data/models/review_model.dart';
import 'package:honey_comp/features/home/domain/entities/product_entity.dart';


class ProductModel {
  final String name, code, description;
  final num price;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int sellingCount;
  final int numOfCalories;
  final num avgRate = 0;
  final num ratingCount = 0;

  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductModel({required this.name,
    required this.code,
    required this.description,
    required this.isFeatured,
    required this.price,
    required this.image,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.unitAmount,
    required this.sellingCount,
    required this.isOrganic,
    required this.reviews,
    this.imageUrl});


  factory ProductModel.formJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json['name'],
        code: json['code'],
        description: json['description'],
        isFeatured: json['name'],
        price: json['price'],
        image: File(json['image']),
        expirationMonths: json['expirationMonths'],
        numOfCalories: json['numOfCalories'],
        unitAmount: json['unitAmount'],
        isOrganic: json['isOrganic'],
        reviews: json['reviews'] != null
            ? List<ReviewModel>.from(
            json['reviews'].map((e) => ReviewModel.fromJson(e)))
            : [],
        sellingCount: json['sellingCount'],
        imageUrl: json['imageUrl']);
  }

  ProductEntity toEntity() {
    return ProductEntity(name: name,
        code: code,
        description: description,
        isFeatured: isFeatured,
        price: price,
        image: image,
        expirationMonths: expirationMonths,
        numOfCalories: numOfCalories,
        unitAmount: unitAmount,
        reviews: reviews.map((e)=> e.toEntity()).toList()
    );
  }


  toJson() {
    return {
      "name": name,
      "code": code,
      "description": description,
      'isFeatured': isFeatured,
      "price": price,
      "imageUrl": imageUrl,
      "expirationMonths": expirationMonths,
      "numOfCalories": numOfCalories,
      "unitAmount": unitAmount,
      "sellingCount": sellingCount,
      "isOrganic": isOrganic,
      "reviews": reviews.map((e) => e.toJson()).toList(),
    };
  }
}

import 'package:honey_comp/features/home/domain/entities/product_entity.dart';

import '../../domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String review;
  final num ratting;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.ratting,
    required this.review,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      ratting: reviewEntity.ratting,
      review: reviewEntity.review,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      date: json['date'],
      ratting: json['ratting'],
      review: json['review'],
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      date: date,
      ratting: ratting,
      review: review,
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'ratting': ratting,
      'review': review,
    };
  }
}

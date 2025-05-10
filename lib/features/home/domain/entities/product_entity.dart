import 'package:equatable/equatable.dart';
import 'package:honey_comp/features/home/domain/entities/review_entity.dart';

class ProductEntity extends Equatable{
  final String name, code, description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;

  final int numOfCalories;
  final num avgRate;
  final num ratingCount = 0;

  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductEntity(
      {required this.avgRate,
      required this.name,
      required this.code,
      required this.description,
      required this.isFeatured,
      required this.price,
      required this.expirationMonths,
      required this.numOfCalories,
      required this.unitAmount,
      required this.reviews,
      this.isOrganic = false,
      this.imageUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [code];
}

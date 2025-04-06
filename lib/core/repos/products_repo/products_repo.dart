
import 'package:dartz/dartz.dart';
import 'package:honey_comp/core/errors/failure.dart';
import 'package:honey_comp/features/home/domain/entities/product_entity.dart';

abstract class ProductsRepo{
  Future<Either<Failure,List<ProductEntity>>> getProducts();
  Future<Either<Failure,List<ProductEntity>>> getBestSellingProducts();
}
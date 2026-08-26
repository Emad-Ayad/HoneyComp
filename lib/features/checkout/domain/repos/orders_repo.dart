import 'package:dartz/dartz.dart';
import 'package:honey_comp/core/errors/failure.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder({required OrdersEntity order});
}

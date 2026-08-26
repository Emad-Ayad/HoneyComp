import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:honey_comp/core/errors/failure.dart';
import 'package:honey_comp/core/helper_functions/backend_endpoints.dart';
import 'package:honey_comp/core/services/database_service.dart';
import 'package:honey_comp/features/checkout/data/models/orders_model.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:honey_comp/features/checkout/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DataBaseService dataBaseService;

  OrdersRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, void>> addOrder({required OrdersEntity order}) async {
    try {
      OrdersModel orderModel = OrdersModel.fromEntity(order);
      await dataBaseService.addData(
        path: BackendEnpPoints.addOrderEndPoint,
        data: orderModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      log('Error in addOrder: $e');
      return Left(ServerFailure(errMessage: 'حدث خطأ أثناء إرسال الطلب. حاول مرة أخرى.'));
    }
  }
  @override
  Future<Either<Failure, List<OrdersEntity>>> fetchUserOrders({required String userId}) async {
    try {
      var data = await dataBaseService.getData(
        path: BackendEnpPoints.addOrderEndPoint,
        query: {
          'where': 'uId',
          'isEqualTo': userId,
        },
      ) as List<dynamic>;

      List<OrdersEntity> orders = data.map((e) {
        return OrdersModel.fromJson(e as Map<String, dynamic>).toEntity();
      }).toList();

      // Sort locally to avoid needing a Firestore composite index
      orders.sort((a, b) => b.date.compareTo(a.date));

      return Right(orders);
    } catch (e) {
      log('Error in fetchUserOrders: $e');
      return Left(ServerFailure(errMessage: 'حدث خطأ أثناء جلب الطلبات. حاول مرة أخرى.'));
    }
  }
}

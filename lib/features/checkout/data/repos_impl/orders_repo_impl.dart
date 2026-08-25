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
      return Left(ServerFailure(errMessage: 'حدث خطأ أثناء إرسال الطلب. حاول مرة أخرى.'));
    }
  }
}

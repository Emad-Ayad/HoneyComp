import 'package:dartz/dartz.dart';
import 'package:honey_comp/core/errors/failure.dart';
import 'package:honey_comp/core/helper_functions/backend_endpoints.dart';
import 'package:honey_comp/core/repos/products_repo/products_repo.dart';
import 'package:honey_comp/core/services/database_service.dart';
import 'package:honey_comp/features/home/data/models/product_model.dart';
import 'package:honey_comp/features/home/domain/entities/product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DataBaseService dataBaseService;

  ProductsRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await dataBaseService
          .getData(path: BackendEnpPoints.getProducts, query: {
        'limit': 10,
        'orderBy': 'sellingCount',
        'descending': true,
      }) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.formJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(errMessage: "Error while getting data"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await dataBaseService.getData(
          path: BackendEnpPoints.getProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.formJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(errMessage: "Error while getting data"));
    }
  }
}

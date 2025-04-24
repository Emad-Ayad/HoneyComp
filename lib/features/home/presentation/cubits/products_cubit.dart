import 'package:bloc/bloc.dart';
import 'package:honey_comp/core/repos/products_repo/products_repo.dart';
import 'package:honey_comp/features/home/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.errMessage)),
      (products) => emit(ProductsSuccess(products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.errMessage)),
      (products) => emit(ProductsSuccess(products)),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:honey_comp/features/checkout/domain/repos/orders_repo.dart';
import 'package:honey_comp/features/checkout/presentation/cubits/orders_cubit/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit(this.ordersRepo) : super(OrdersInitial());

  Future<void> addOrder(OrdersEntity orderEntity) async {
    emit(OrdersLoading());
    try {
      var result = await ordersRepo.addOrder(order: orderEntity);
      result.fold(
        (failure) => emit(OrdersFailure(errMessage: failure.errMessage)),
        (success) => emit(OrdersSuccess()),
      );
    } catch (e) {
      emit(OrdersFailure(errMessage: e.toString()));
    }
  }
}

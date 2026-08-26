import 'package:bloc/bloc.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:honey_comp/features/checkout/domain/repos/orders_repo.dart';
import 'package:honey_comp/features/checkout/presentation/cubits/orders_cubit/orders_state.dart';
import 'package:honey_comp/core/services/paymob_service.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;
  final PaymobService paymobService = PaymobService();

  OrdersCubit(this.ordersRepo) : super(OrdersInitial());

  Future<void> processCheckout(OrdersEntity orderEntity) async {
    emit(OrdersLoading());
    try {
      if (orderEntity.payWithCash == false) {
        // Online Payment chosen -> get Payment Key for WebView
        String paymentKey = await paymobService.getPaymentKey(order: orderEntity);
        emit(OrdersPaymentKeyGenerated(paymentKey: paymentKey));
      } else {
        // Cash on delivery -> directly save order
        await saveOrderToDatabase(orderEntity);
      }
    } catch (e) {
      emit(OrdersFailure(errMessage: e.toString()));
    }
  }

  Future<void> saveOrderToDatabase(OrdersEntity orderEntity) async {
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

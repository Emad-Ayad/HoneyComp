import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:honey_comp/features/checkout/domain/repos/orders_repo.dart';
import 'package:honey_comp/core/helper_functions/get_user_data.dart';

@immutable
abstract class MyOrdersState {}

class MyOrdersInitial extends MyOrdersState {}

class MyOrdersLoading extends MyOrdersState {}

class MyOrdersSuccess extends MyOrdersState {
  final List<OrdersEntity> orders;
  MyOrdersSuccess({required this.orders});
}

class MyOrdersFailure extends MyOrdersState {
  final String errMessage;
  MyOrdersFailure({required this.errMessage});
}

class MyOrdersCubit extends Cubit<MyOrdersState> {
  final OrdersRepo ordersRepo;

  MyOrdersCubit(this.ordersRepo) : super(MyOrdersInitial());

  Future<void> fetchUserOrders() async {
    emit(MyOrdersLoading());
    try {
      final user = getUser();
      var result = await ordersRepo.fetchUserOrders(userId: user.id);
      result.fold(
        (failure) => emit(MyOrdersFailure(errMessage: failure.errMessage)),
        (orders) => emit(MyOrdersSuccess(orders: orders)),
      );
    } catch (e) {
      emit(MyOrdersFailure(errMessage: e.toString()));
    }
  }
}

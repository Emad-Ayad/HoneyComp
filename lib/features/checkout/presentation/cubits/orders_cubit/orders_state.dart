import 'package:flutter/foundation.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccess extends OrdersState {}

class OrdersFailure extends OrdersState {
  final String errMessage;

  OrdersFailure({required this.errMessage});
}

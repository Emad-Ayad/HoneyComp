import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';
import 'package:honey_comp/features/home/data/models/cart_item_model.dart';
import 'package:honey_comp/features/checkout/data/models/shipping_address_model.dart';
import 'package:honey_comp/features/home/domain/entities/cart_entity.dart';

class OrdersModel {
  final double totalPrice;
  final String uId;
  final bool payWithCash;
  final ShippingAddressModel shippingAddressModel;
  final List<CartItemModel> cartItems;
  final String status;
  final String date;

  OrdersModel({
    required this.totalPrice,
    required this.uId,
    required this.payWithCash,
    required this.shippingAddressModel,
    required this.cartItems,
    required this.status,
    required this.date,
  });

  factory OrdersModel.fromEntity(OrdersEntity entity) {
    return OrdersModel(
      totalPrice: entity.cartEntity.getTotalPrice() + (entity.payWithCash == true ? 40.0 : 0.0), // Includes shipping if cash, etc. We just use the logic from OrderSummaryWidget where cash adds 40.
      uId: entity.uId,
      payWithCash: entity.payWithCash ?? true,
      shippingAddressModel: ShippingAddressModel.fromEntity(entity.shippingAddressEntity),
      cartItems: entity.cartEntity.cartList.map((e) => CartItemModel.fromEntity(e)).toList(),
      status: 'Pending',
      date: DateTime.now().toIso8601String(),
    );
  }

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      totalPrice: json['totalPrice']?.toDouble() ?? 0.0,
      uId: json['uId'] ?? '',
      payWithCash: json['payWithCash'] ?? true,
      shippingAddressModel: ShippingAddressModel.fromJson(json['shippingAddress'] ?? {}),
      cartItems: (json['cartItems'] as List?)?.map((e) => CartItemModel.fromJson(e)).toList() ?? [],
      status: json['status'] ?? 'Pending',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'payWithCash': payWithCash,
      'shippingAddress': shippingAddressModel.toJson(),
      'cartItems': cartItems.map((e) => e.toJson()).toList(),
      'status': status,
      'date': date,
    };
  }

  OrdersEntity toEntity() {
    return OrdersEntity(
      CartEntity(cartList: cartItems.map((e) => e.toEntity()).toList()),
      payWithCash: payWithCash,
      uId: uId,
      status: status,
      date: date,
    )..shippingAddressEntity = shippingAddressModel.toEntity();
  }
}
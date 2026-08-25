import 'package:honey_comp/features/checkout/domain/entities/shipping_Address_entity.dart';
import 'package:honey_comp/features/home/domain/entities/cart_item_entity.dart';

import '../../../home/domain/entities/cart_entity.dart';

class OrdersEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity();
  final String uId;

  OrdersEntity(this.cartEntity, {this.payWithCash, required this.uId});
}

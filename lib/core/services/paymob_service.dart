import 'package:dio/dio.dart';
import 'package:honey_comp/core/helper_functions/paymob_constants.dart';
import 'package:honey_comp/features/checkout/domain/entities/orders_entity.dart';

class PaymobService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://accept.paymob.com/api/',
      receiveDataWhenStatusError: true,
    ),
  );

  Future<String> getPaymentKey({required OrdersEntity order}) async {
    try {
      // 1. Get Auth Token
      String authToken = await _getAuthToken();
      
      // 2. Register Order
      String orderId = await _getOrderId(authToken: authToken, order: order);
      
      // 3. Get Payment Key
      String paymentKey = await _getPaymentKeyRequest(
        authToken: authToken,
        orderId: orderId,
        order: order,
      );

      return paymentKey;
    } catch (e) {
      throw Exception('فشل في إعداد بوابة الدفع: ${e.toString()}');
    }
  }

  Future<String> _getAuthToken() async {
    var response = await dio.post('auth/tokens', data: {
      'api_key': PaymobConstants.apiKey,
    });
    return response.data['token'];
  }

  Future<String> _getOrderId({required String authToken, required OrdersEntity order}) async {
    int amountCents = (order.cartEntity.getTotalPrice() * 100).toInt();

    var response = await dio.post('ecommerce/orders', data: {
      'auth_token': authToken,
      'delivery_needed': 'false',
      'amount_cents': amountCents.toString(),
      'currency': 'EGP',
      'items': [], // Can be filled with mapped cart items if desired
    });
    return response.data['id'].toString();
  }

  Future<String> _getPaymentKeyRequest({
    required String authToken,
    required String orderId,
    required OrdersEntity order,
  }) async {
    int amountCents = (order.cartEntity.getTotalPrice() * 100).toInt();

    var response = await dio.post('acceptance/payment_keys', data: {
      'auth_token': authToken,
      'amount_cents': amountCents.toString(),
      'expiration': 3600,
      'order_id': orderId,
      'billing_data': {
        'apartment': 'NA',
        'email': order.shippingAddressEntity.email ?? 'NA',
        'floor': 'NA',
        'first_name': order.shippingAddressEntity.fullName ?? 'NA',
        'street': order.shippingAddressEntity.address ?? 'NA',
        'building': 'NA',
        'phone_number': order.shippingAddressEntity.phone ?? 'NA',
        'shipping_method': 'NA',
        'postal_code': 'NA',
        'city': order.shippingAddressEntity.city ?? 'NA',
        'country': 'EG',
        'last_name': 'NA',
        'state': 'NA'
      },
      'currency': 'EGP',
      'integration_id': PaymobConstants.integrationId,
    });
    return response.data['token'];
  }
}

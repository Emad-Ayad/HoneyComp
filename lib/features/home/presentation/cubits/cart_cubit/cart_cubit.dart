import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:honey_comp/core/services/shared_preferences_singleton.dart';
import 'package:honey_comp/features/home/data/models/cart_item_model.dart';
import 'package:honey_comp/features/home/domain/entities/cart_entity.dart';
import 'package:honey_comp/features/home/domain/entities/cart_item_entity.dart';
import 'package:honey_comp/features/home/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

const String kCartData = 'cart_data';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    _loadCart();
  }

  CartEntity cartEntity = CartEntity(cartList: []);

  void _loadCart() {
    try {
      String? cartJson = SharedPreferenceSingleton.getString(kCartData);
      if (cartJson != null && cartJson.isNotEmpty) {
        List<dynamic> decodedList = jsonDecode(cartJson);
        List<CartItemEntity> items = decodedList
            .map((e) => CartItemModel.fromJson(e).toEntity())
            .toList();
        cartEntity = CartEntity(cartList: items);
        emit(CartItemAdded()); // Just to refresh UI
      }
    } catch (e) {
      log('Error loading cart: $e');
    }
  }

  void saveCart() {
    try {
      List<Map<String, dynamic>> encodedList = cartEntity.cartList
          .map((e) => CartItemModel.fromEntity(e).toJson())
          .toList();
      SharedPreferenceSingleton.setString(kCartData, jsonEncode(encodedList));
    } catch (e) {
      log('Error saving cart: $e');
    }
  }

  void addToCart(ProductEntity product) {
    bool isExist = cartEntity.isExist(product);
    var cartItem = cartEntity.getCartItem(product);
    if (isExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    saveCart();
    emit(CartItemAdded());
  }

  void deleteFromCart(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    saveCart();
    emit(CartItemRemoved());
  }

  void clearCart() {
    cartEntity.cartList.clear();
    saveCart();
    emit(CartItemRemoved());
  }
}


import 'package:bloc/bloc.dart';
import 'package:honey_comp/features/home/domain/entities/cart_entity.dart';
import 'package:honey_comp/features/home/domain/entities/cart_item_entity.dart';
import 'package:honey_comp/features/home/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartList: []);

  void addToCart(ProductEntity product) {
    bool isExist = cartEntity.isExist(product);
    var cartItem = cartEntity.getCartItem(product);
    if (isExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }

  void deleteFromCart(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}

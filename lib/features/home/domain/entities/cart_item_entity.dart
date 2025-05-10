import 'package:equatable/equatable.dart';
import 'package:honey_comp/features/home/domain/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalAmount() {
    return productEntity.unitAmount * count;
  }

  increaseCount() {
    count++;
  }

  decreaseCount() {
    if(count>1){
      count--;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../products/domain/entities/product.dart';

part 'cart_item.freezed.dart';

/// Cart item entity representing a product in the cart
@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    required int quantity,
  }) = _CartItem;

  const CartItem._();

  /// Calculate line total
  double get total => product.price * quantity;
  
  /// Create new cart item with updated quantity
  CartItem copyWithQuantity(int newQuantity) {
    return CartItem(product: product, quantity: newQuantity);
  }
  
  @override
  Product get product => throw UnimplementedError();
  
  @override
  int get quantity => throw UnimplementedError();
}

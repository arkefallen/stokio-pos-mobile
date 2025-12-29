import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/cart_item.dart';
import '../../../products/domain/entities/product.dart';

part 'cart_notifier.g.dart';

/// Cart notifier for managing shopping cart state
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  List<CartItem> build() {
    return [];
  }

  /// Add product to cart
  void addProduct(Product product) {
    final existingIndex =
        state.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      // Product already in cart, increase quantity
      final existingItem = state[existingIndex];
      final newQuantity = existingItem.quantity + 1;

      // Check stock availability
      if (newQuantity <= product.stockQuantity) {
        state = [
          ...state.sublist(0, existingIndex),
          existingItem.copyWithQuantity(newQuantity),
          ...state.sublist(existingIndex + 1),
        ];
      }
    } else {
      // Add new product to cart
      if (product.stockQuantity > 0) {
        state = [...state, CartItem(product: product, quantity: 1)];
      }
    }
  }

  /// Remove product from cart
  void removeProduct(Product product) {
    state = state.where((item) => item.product.id != product.id).toList();
  }

  /// Update quantity for a product
  void updateQuantity(Product product, int newQuantity) {
    if (newQuantity <= 0) {
      removeProduct(product);
      return;
    }

    final existingIndex =
        state.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      final existingItem = state[existingIndex];

      // Check stock availability
      if (newQuantity <= product.stockQuantity) {
        state = [
          ...state.sublist(0, existingIndex),
          existingItem.copyWithQuantity(newQuantity),
          ...state.sublist(existingIndex + 1),
        ];
      }
    }
  }

  /// Increase quantity by 1
  void increaseQuantity(Product product) {
    final existingIndex =
        state.indexWhere((item) => item.product.id == product.id);
    if (existingIndex >= 0) {
      final currentQuantity = state[existingIndex].quantity;
      updateQuantity(product, currentQuantity + 1);
    }
  }

  /// Decrease quantity by 1
  void decreaseQuantity(Product product) {
    final existingIndex =
        state.indexWhere((item) => item.product.id == product.id);
    if (existingIndex >= 0) {
      final currentQuantity = state[existingIndex].quantity;
      updateQuantity(product, currentQuantity - 1);
    }
  }

  /// Clear entire cart
  void clearCart() {
    state = [];
  }

  /// Get quantity for a specific product
  int getQuantity(Product product) {
    final item =
        state.where((item) => item.product.id == product.id).firstOrNull;
    return item?.quantity ?? 0;
  }

  /// Check if product is in cart
  bool isInCart(Product product) {
    return state.any((item) => item.product.id == product.id);
  }
}

/// Cart total provider
@riverpod
double cartTotal(Ref ref) {
  final items = ref.watch(cartNotifierProvider);
  return items.fold(0.0, (sum, item) => sum + item.total);
}

/// Cart items count provider
@riverpod
int cartItemsCount(Ref ref) {
  final items = ref.watch(cartNotifierProvider);
  return items.fold(0, (sum, item) => sum + item.quantity);
}

/// Cart is empty provider
@riverpod
bool cartIsEmpty(Ref ref) {
  final items = ref.watch(cartNotifierProvider);
  return items.isEmpty;
}

/// Alias for backward compatibility with Riverpod 3.0 naming convention
// ignore: non_constant_identifier_names
final cartNotifierProvider = cartProvider;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// Product entity representing an item for sale
@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String sku,
    required double price,
    @JsonKey(name: 'stock_qty') required int stockQuantity,
    @JsonKey(name: 'category_id') int? categoryId,
    Category? category,
    @JsonKey(name: 'image_url') String? imageUrl,
    String? description,
    @JsonKey(name: 'cost_price') double? costPrice,
    @JsonKey(name: 'min_stock') int? minStock,
    @JsonKey(name: 'is_low_stock') bool? isLowStockFlag,
    @JsonKey(name: 'is_in_stock') bool? isInStockFlag,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Check if product is in stock
  bool get isInStock => isInStockFlag ?? stockQuantity > 0;

  /// Check if product is low on stock (less than 10)
  bool get isLowStock =>
      isLowStockFlag ?? (stockQuantity > 0 && stockQuantity < 10);

  /// Check if product is out of stock
  bool get isOutOfStock => !isInStock;
  
  @override
  Category? get category => throw UnimplementedError();
  
  @override
  int? get categoryId => throw UnimplementedError();
  
  @override
  double? get costPrice => throw UnimplementedError();
  
  @override
  String? get description => throw UnimplementedError();
  
  @override
  int get id => throw UnimplementedError();
  
  @override
  String? get imageUrl => throw UnimplementedError();
  
  @override
  bool? get isActive => throw UnimplementedError();
  
  @override
  bool? get isInStockFlag => throw UnimplementedError();
  
  @override
  bool? get isLowStockFlag => throw UnimplementedError();
  
  @override
  int? get minStock => throw UnimplementedError();
  
  @override
  String get name => throw UnimplementedError();
  
  @override
  double get price => throw UnimplementedError();
  
  @override
  String get sku => throw UnimplementedError();
  
  @override
  int get stockQuantity => throw UnimplementedError();
  
  @override
  Map<String, dynamic> toJson() {

    throw UnimplementedError();
  }
}

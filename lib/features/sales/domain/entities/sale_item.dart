import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_item.freezed.dart';
part 'sale_item.g.dart';

/// SaleItem entity representing an item in a sale transaction
@freezed
class SaleItem with _$SaleItem {
  const factory SaleItem({
    required int id,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_sku') required String productSku,
    required int quantity,
    required double price,
    required double subtotal,
  }) = _SaleItem;

  const SaleItem._();

  factory SaleItem.fromJson(Map<String, dynamic> json) =>
      _$SaleItemFromJson(json);
      
        @override
        int get id => throw UnimplementedError();
      
        @override
        double get price => throw UnimplementedError();
      
        @override
        int get productId => throw UnimplementedError();
      
        @override
        String get productName => throw UnimplementedError();
      
        @override
        String get productSku => throw UnimplementedError();
      
        @override
        int get quantity => throw UnimplementedError();
      
        @override
        double get subtotal => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
}

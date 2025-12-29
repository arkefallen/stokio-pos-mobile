// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaleItem _$SaleItemFromJson(Map<String, dynamic> json) => _SaleItem(
  id: (json['id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  productName: json['product_name'] as String,
  productSku: json['product_sku'] as String,
  quantity: (json['quantity'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  subtotal: (json['subtotal'] as num).toDouble(),
);

Map<String, dynamic> _$SaleItemToJson(_SaleItem instance) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'product_name': instance.productName,
  'product_sku': instance.productSku,
  'quantity': instance.quantity,
  'price': instance.price,
  'subtotal': instance.subtotal,
};

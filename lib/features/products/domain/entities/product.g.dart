// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  sku: json['sku'] as String,
  price: (json['price'] as num).toDouble(),
  stockQuantity: (json['stock_qty'] as num).toInt(),
  categoryId: (json['category_id'] as num?)?.toInt(),
  category: json['category'] == null
      ? null
      : Category.fromJson(json['category'] as Map<String, dynamic>),
  imageUrl: json['image_url'] as String?,
  description: json['description'] as String?,
  costPrice: (json['cost_price'] as num?)?.toDouble(),
  minStock: (json['min_stock'] as num?)?.toInt(),
  isLowStockFlag: json['is_low_stock'] as bool?,
  isInStockFlag: json['is_in_stock'] as bool?,
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'sku': instance.sku,
  'price': instance.price,
  'stock_qty': instance.stockQuantity,
  'category_id': instance.categoryId,
  'category': instance.category,
  'image_url': instance.imageUrl,
  'description': instance.description,
  'cost_price': instance.costPrice,
  'min_stock': instance.minStock,
  'is_low_stock': instance.isLowStockFlag,
  'is_in_stock': instance.isInStockFlag,
  'is_active': instance.isActive,
};

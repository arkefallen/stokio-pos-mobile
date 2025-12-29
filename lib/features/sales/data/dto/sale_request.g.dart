// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateSaleRequest _$CreateSaleRequestFromJson(Map<String, dynamic> json) =>
    _CreateSaleRequest(
      paymentMethod: json['payment_method'] as String,
      cashGiven: (json['cash_given'] as num?)?.toDouble(),
      discountAmount: (json['discount_amount'] as num?)?.toDouble() ?? 0,
      taxAmount: (json['tax_amount'] as num?)?.toDouble() ?? 0,
      notes: json['notes'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => CreateSaleItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateSaleRequestToJson(_CreateSaleRequest instance) =>
    <String, dynamic>{
      'payment_method': instance.paymentMethod,
      'cash_given': instance.cashGiven,
      'discount_amount': instance.discountAmount,
      'tax_amount': instance.taxAmount,
      'notes': instance.notes,
      'items': instance.items,
    };

_CreateSaleItemRequest _$CreateSaleItemRequestFromJson(
  Map<String, dynamic> json,
) => _CreateSaleItemRequest(
  productId: (json['product_id'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$CreateSaleItemRequestToJson(
  _CreateSaleItemRequest instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'quantity': instance.quantity,
};

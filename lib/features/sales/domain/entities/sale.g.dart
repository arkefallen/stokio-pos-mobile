// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sale _$SaleFromJson(Map<String, dynamic> json) => _Sale(
  id: (json['id'] as num).toInt(),
  saleNumber: json['sale_number'] as String,
  status: json['status'] as String,
  paymentStatus: json['payment_status'] as String,
  paymentMethod: json['payment_method'] as String,
  subtotal: (json['subtotal'] as num).toDouble(),
  taxAmount: (json['tax_amount'] as num).toDouble(),
  discountAmount: (json['discount_amount'] as num).toDouble(),
  totalAmount: (json['total_amount'] as num).toDouble(),
  cashGiven: (json['cash_given'] as num?)?.toDouble(),
  changeReturn: (json['change_return'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  createdBy: json['created_by'] == null
      ? null
      : User.fromJson(json['created_by'] as Map<String, dynamic>),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => SaleItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$SaleToJson(_Sale instance) => <String, dynamic>{
  'id': instance.id,
  'sale_number': instance.saleNumber,
  'status': instance.status,
  'payment_status': instance.paymentStatus,
  'payment_method': instance.paymentMethod,
  'subtotal': instance.subtotal,
  'tax_amount': instance.taxAmount,
  'discount_amount': instance.discountAmount,
  'total_amount': instance.totalAmount,
  'cash_given': instance.cashGiven,
  'change_return': instance.changeReturn,
  'notes': instance.notes,
  'created_by': instance.createdBy,
  'items': instance.items,
  'created_at': instance.createdAt,
};

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleItem {

 int get id;@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'product_sku') String get productSku; int get quantity; double get price; double get subtotal;
/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleItemCopyWith<SaleItem> get copyWith => _$SaleItemCopyWithImpl<SaleItem>(this as SaleItem, _$identity);

  /// Serializes this SaleItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productSku, productSku) || other.productSku == productSku)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,productSku,quantity,price,subtotal);

@override
String toString() {
  return 'SaleItem(id: $id, productId: $productId, productName: $productName, productSku: $productSku, quantity: $quantity, price: $price, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class $SaleItemCopyWith<$Res>  {
  factory $SaleItemCopyWith(SaleItem value, $Res Function(SaleItem) _then) = _$SaleItemCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_sku') String productSku, int quantity, double price, double subtotal
});




}
/// @nodoc
class _$SaleItemCopyWithImpl<$Res>
    implements $SaleItemCopyWith<$Res> {
  _$SaleItemCopyWithImpl(this._self, this._then);

  final SaleItem _self;
  final $Res Function(SaleItem) _then;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? productSku = null,Object? quantity = null,Object? price = null,Object? subtotal = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productSku: null == productSku ? _self.productSku : productSku // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleItem].
extension SaleItemPatterns on SaleItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleItem value)  $default,){
final _that = this;
switch (_that) {
case _SaleItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleItem value)?  $default,){
final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_sku')  String productSku,  int quantity,  double price,  double subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.productSku,_that.quantity,_that.price,_that.subtotal);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_sku')  String productSku,  int quantity,  double price,  double subtotal)  $default,) {final _that = this;
switch (_that) {
case _SaleItem():
return $default(_that.id,_that.productId,_that.productName,_that.productSku,_that.quantity,_that.price,_that.subtotal);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_sku')  String productSku,  int quantity,  double price,  double subtotal)?  $default,) {final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.productSku,_that.quantity,_that.price,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleItem extends SaleItem {
  const _SaleItem({required this.id, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'product_name') required this.productName, @JsonKey(name: 'product_sku') required this.productSku, required this.quantity, required this.price, required this.subtotal}): super._();
  factory _SaleItem.fromJson(Map<String, dynamic> json) => _$SaleItemFromJson(json);

@override final  int id;
@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'product_sku') final  String productSku;
@override final  int quantity;
@override final  double price;
@override final  double subtotal;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleItemCopyWith<_SaleItem> get copyWith => __$SaleItemCopyWithImpl<_SaleItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productSku, productSku) || other.productSku == productSku)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,productSku,quantity,price,subtotal);

@override
String toString() {
  return 'SaleItem(id: $id, productId: $productId, productName: $productName, productSku: $productSku, quantity: $quantity, price: $price, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$SaleItemCopyWith<$Res> implements $SaleItemCopyWith<$Res> {
  factory _$SaleItemCopyWith(_SaleItem value, $Res Function(_SaleItem) _then) = __$SaleItemCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_sku') String productSku, int quantity, double price, double subtotal
});




}
/// @nodoc
class __$SaleItemCopyWithImpl<$Res>
    implements _$SaleItemCopyWith<$Res> {
  __$SaleItemCopyWithImpl(this._self, this._then);

  final _SaleItem _self;
  final $Res Function(_SaleItem) _then;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? productSku = null,Object? quantity = null,Object? price = null,Object? subtotal = null,}) {
  return _then(_SaleItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productSku: null == productSku ? _self.productSku : productSku // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

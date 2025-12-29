// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateSaleRequest {

@JsonKey(name: 'payment_method') String get paymentMethod;@JsonKey(name: 'cash_given') double? get cashGiven;@JsonKey(name: 'discount_amount') double get discountAmount;@JsonKey(name: 'tax_amount') double get taxAmount; String? get notes; List<CreateSaleItemRequest> get items;
/// Create a copy of CreateSaleRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSaleRequestCopyWith<CreateSaleRequest> get copyWith => _$CreateSaleRequestCopyWithImpl<CreateSaleRequest>(this as CreateSaleRequest, _$identity);

  /// Serializes this CreateSaleRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSaleRequest&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.cashGiven, cashGiven) || other.cashGiven == cashGiven)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentMethod,cashGiven,discountAmount,taxAmount,notes,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CreateSaleRequest(paymentMethod: $paymentMethod, cashGiven: $cashGiven, discountAmount: $discountAmount, taxAmount: $taxAmount, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class $CreateSaleRequestCopyWith<$Res>  {
  factory $CreateSaleRequestCopyWith(CreateSaleRequest value, $Res Function(CreateSaleRequest) _then) = _$CreateSaleRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'cash_given') double? cashGiven,@JsonKey(name: 'discount_amount') double discountAmount,@JsonKey(name: 'tax_amount') double taxAmount, String? notes, List<CreateSaleItemRequest> items
});




}
/// @nodoc
class _$CreateSaleRequestCopyWithImpl<$Res>
    implements $CreateSaleRequestCopyWith<$Res> {
  _$CreateSaleRequestCopyWithImpl(this._self, this._then);

  final CreateSaleRequest _self;
  final $Res Function(CreateSaleRequest) _then;

/// Create a copy of CreateSaleRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentMethod = null,Object? cashGiven = freezed,Object? discountAmount = null,Object? taxAmount = null,Object? notes = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,cashGiven: freezed == cashGiven ? _self.cashGiven : cashGiven // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CreateSaleItemRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSaleRequest].
extension CreateSaleRequestPatterns on CreateSaleRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSaleRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSaleRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSaleRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateSaleRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSaleRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSaleRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'cash_given')  double? cashGiven, @JsonKey(name: 'discount_amount')  double discountAmount, @JsonKey(name: 'tax_amount')  double taxAmount,  String? notes,  List<CreateSaleItemRequest> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSaleRequest() when $default != null:
return $default(_that.paymentMethod,_that.cashGiven,_that.discountAmount,_that.taxAmount,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'cash_given')  double? cashGiven, @JsonKey(name: 'discount_amount')  double discountAmount, @JsonKey(name: 'tax_amount')  double taxAmount,  String? notes,  List<CreateSaleItemRequest> items)  $default,) {final _that = this;
switch (_that) {
case _CreateSaleRequest():
return $default(_that.paymentMethod,_that.cashGiven,_that.discountAmount,_that.taxAmount,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'cash_given')  double? cashGiven, @JsonKey(name: 'discount_amount')  double discountAmount, @JsonKey(name: 'tax_amount')  double taxAmount,  String? notes,  List<CreateSaleItemRequest> items)?  $default,) {final _that = this;
switch (_that) {
case _CreateSaleRequest() when $default != null:
return $default(_that.paymentMethod,_that.cashGiven,_that.discountAmount,_that.taxAmount,_that.notes,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateSaleRequest implements CreateSaleRequest {
  const _CreateSaleRequest({@JsonKey(name: 'payment_method') required this.paymentMethod, @JsonKey(name: 'cash_given') this.cashGiven, @JsonKey(name: 'discount_amount') this.discountAmount = 0, @JsonKey(name: 'tax_amount') this.taxAmount = 0, this.notes, required final  List<CreateSaleItemRequest> items}): _items = items;
  factory _CreateSaleRequest.fromJson(Map<String, dynamic> json) => _$CreateSaleRequestFromJson(json);

@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey(name: 'cash_given') final  double? cashGiven;
@override@JsonKey(name: 'discount_amount') final  double discountAmount;
@override@JsonKey(name: 'tax_amount') final  double taxAmount;
@override final  String? notes;
 final  List<CreateSaleItemRequest> _items;
@override List<CreateSaleItemRequest> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CreateSaleRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSaleRequestCopyWith<_CreateSaleRequest> get copyWith => __$CreateSaleRequestCopyWithImpl<_CreateSaleRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateSaleRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSaleRequest&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.cashGiven, cashGiven) || other.cashGiven == cashGiven)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentMethod,cashGiven,discountAmount,taxAmount,notes,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CreateSaleRequest(paymentMethod: $paymentMethod, cashGiven: $cashGiven, discountAmount: $discountAmount, taxAmount: $taxAmount, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CreateSaleRequestCopyWith<$Res> implements $CreateSaleRequestCopyWith<$Res> {
  factory _$CreateSaleRequestCopyWith(_CreateSaleRequest value, $Res Function(_CreateSaleRequest) _then) = __$CreateSaleRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'cash_given') double? cashGiven,@JsonKey(name: 'discount_amount') double discountAmount,@JsonKey(name: 'tax_amount') double taxAmount, String? notes, List<CreateSaleItemRequest> items
});




}
/// @nodoc
class __$CreateSaleRequestCopyWithImpl<$Res>
    implements _$CreateSaleRequestCopyWith<$Res> {
  __$CreateSaleRequestCopyWithImpl(this._self, this._then);

  final _CreateSaleRequest _self;
  final $Res Function(_CreateSaleRequest) _then;

/// Create a copy of CreateSaleRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentMethod = null,Object? cashGiven = freezed,Object? discountAmount = null,Object? taxAmount = null,Object? notes = freezed,Object? items = null,}) {
  return _then(_CreateSaleRequest(
paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,cashGiven: freezed == cashGiven ? _self.cashGiven : cashGiven // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CreateSaleItemRequest>,
  ));
}


}


/// @nodoc
mixin _$CreateSaleItemRequest {

@JsonKey(name: 'product_id') int get productId; int get quantity;
/// Create a copy of CreateSaleItemRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSaleItemRequestCopyWith<CreateSaleItemRequest> get copyWith => _$CreateSaleItemRequestCopyWithImpl<CreateSaleItemRequest>(this as CreateSaleItemRequest, _$identity);

  /// Serializes this CreateSaleItemRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSaleItemRequest&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantity);

@override
String toString() {
  return 'CreateSaleItemRequest(productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CreateSaleItemRequestCopyWith<$Res>  {
  factory $CreateSaleItemRequestCopyWith(CreateSaleItemRequest value, $Res Function(CreateSaleItemRequest) _then) = _$CreateSaleItemRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') int productId, int quantity
});




}
/// @nodoc
class _$CreateSaleItemRequestCopyWithImpl<$Res>
    implements $CreateSaleItemRequestCopyWith<$Res> {
  _$CreateSaleItemRequestCopyWithImpl(this._self, this._then);

  final CreateSaleItemRequest _self;
  final $Res Function(CreateSaleItemRequest) _then;

/// Create a copy of CreateSaleItemRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSaleItemRequest].
extension CreateSaleItemRequestPatterns on CreateSaleItemRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSaleItemRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSaleItemRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSaleItemRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateSaleItemRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSaleItemRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSaleItemRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSaleItemRequest() when $default != null:
return $default(_that.productId,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _CreateSaleItemRequest():
return $default(_that.productId,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  int productId,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _CreateSaleItemRequest() when $default != null:
return $default(_that.productId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateSaleItemRequest implements CreateSaleItemRequest {
  const _CreateSaleItemRequest({@JsonKey(name: 'product_id') required this.productId, required this.quantity});
  factory _CreateSaleItemRequest.fromJson(Map<String, dynamic> json) => _$CreateSaleItemRequestFromJson(json);

@override@JsonKey(name: 'product_id') final  int productId;
@override final  int quantity;

/// Create a copy of CreateSaleItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSaleItemRequestCopyWith<_CreateSaleItemRequest> get copyWith => __$CreateSaleItemRequestCopyWithImpl<_CreateSaleItemRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateSaleItemRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSaleItemRequest&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantity);

@override
String toString() {
  return 'CreateSaleItemRequest(productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$CreateSaleItemRequestCopyWith<$Res> implements $CreateSaleItemRequestCopyWith<$Res> {
  factory _$CreateSaleItemRequestCopyWith(_CreateSaleItemRequest value, $Res Function(_CreateSaleItemRequest) _then) = __$CreateSaleItemRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') int productId, int quantity
});




}
/// @nodoc
class __$CreateSaleItemRequestCopyWithImpl<$Res>
    implements _$CreateSaleItemRequestCopyWith<$Res> {
  __$CreateSaleItemRequestCopyWithImpl(this._self, this._then);

  final _CreateSaleItemRequest _self;
  final $Res Function(_CreateSaleItemRequest) _then;

/// Create a copy of CreateSaleItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? quantity = null,}) {
  return _then(_CreateSaleItemRequest(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

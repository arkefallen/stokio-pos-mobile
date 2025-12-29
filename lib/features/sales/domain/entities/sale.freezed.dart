// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sale {

 int get id;@JsonKey(name: 'sale_number') String get saleNumber; String get status;@JsonKey(name: 'payment_status') String get paymentStatus;@JsonKey(name: 'payment_method') String get paymentMethod; double get subtotal;@JsonKey(name: 'tax_amount') double get taxAmount;@JsonKey(name: 'discount_amount') double get discountAmount;@JsonKey(name: 'total_amount') double get totalAmount;@JsonKey(name: 'cash_given') double? get cashGiven;@JsonKey(name: 'change_return') double? get changeReturn; String? get notes;@JsonKey(name: 'created_by') User? get createdBy; List<SaleItem>? get items;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleCopyWith<Sale> get copyWith => _$SaleCopyWithImpl<Sale>(this as Sale, _$identity);

  /// Serializes this Sale to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sale&&(identical(other.id, id) || other.id == id)&&(identical(other.saleNumber, saleNumber) || other.saleNumber == saleNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.cashGiven, cashGiven) || other.cashGiven == cashGiven)&&(identical(other.changeReturn, changeReturn) || other.changeReturn == changeReturn)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,saleNumber,status,paymentStatus,paymentMethod,subtotal,taxAmount,discountAmount,totalAmount,cashGiven,changeReturn,notes,createdBy,const DeepCollectionEquality().hash(items),createdAt);

@override
String toString() {
  return 'Sale(id: $id, saleNumber: $saleNumber, status: $status, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, subtotal: $subtotal, taxAmount: $taxAmount, discountAmount: $discountAmount, totalAmount: $totalAmount, cashGiven: $cashGiven, changeReturn: $changeReturn, notes: $notes, createdBy: $createdBy, items: $items, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SaleCopyWith<$Res>  {
  factory $SaleCopyWith(Sale value, $Res Function(Sale) _then) = _$SaleCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'sale_number') String saleNumber, String status,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'payment_method') String paymentMethod, double subtotal,@JsonKey(name: 'tax_amount') double taxAmount,@JsonKey(name: 'discount_amount') double discountAmount,@JsonKey(name: 'total_amount') double totalAmount,@JsonKey(name: 'cash_given') double? cashGiven,@JsonKey(name: 'change_return') double? changeReturn, String? notes,@JsonKey(name: 'created_by') User? createdBy, List<SaleItem>? items,@JsonKey(name: 'created_at') String createdAt
});


$UserCopyWith<$Res>? get createdBy;

}
/// @nodoc
class _$SaleCopyWithImpl<$Res>
    implements $SaleCopyWith<$Res> {
  _$SaleCopyWithImpl(this._self, this._then);

  final Sale _self;
  final $Res Function(Sale) _then;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? saleNumber = null,Object? status = null,Object? paymentStatus = null,Object? paymentMethod = null,Object? subtotal = null,Object? taxAmount = null,Object? discountAmount = null,Object? totalAmount = null,Object? cashGiven = freezed,Object? changeReturn = freezed,Object? notes = freezed,Object? createdBy = freezed,Object? items = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,saleNumber: null == saleNumber ? _self.saleNumber : saleNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,cashGiven: freezed == cashGiven ? _self.cashGiven : cashGiven // ignore: cast_nullable_to_non_nullable
as double?,changeReturn: freezed == changeReturn ? _self.changeReturn : changeReturn // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as User?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SaleItem>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sale].
extension SalePatterns on Sale {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sale value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sale() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sale value)  $default,){
final _that = this;
switch (_that) {
case _Sale():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sale value)?  $default,){
final _that = this;
switch (_that) {
case _Sale() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'sale_number')  String saleNumber,  String status, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'payment_method')  String paymentMethod,  double subtotal, @JsonKey(name: 'tax_amount')  double taxAmount, @JsonKey(name: 'discount_amount')  double discountAmount, @JsonKey(name: 'total_amount')  double totalAmount, @JsonKey(name: 'cash_given')  double? cashGiven, @JsonKey(name: 'change_return')  double? changeReturn,  String? notes, @JsonKey(name: 'created_by')  User? createdBy,  List<SaleItem>? items, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sale() when $default != null:
return $default(_that.id,_that.saleNumber,_that.status,_that.paymentStatus,_that.paymentMethod,_that.subtotal,_that.taxAmount,_that.discountAmount,_that.totalAmount,_that.cashGiven,_that.changeReturn,_that.notes,_that.createdBy,_that.items,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'sale_number')  String saleNumber,  String status, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'payment_method')  String paymentMethod,  double subtotal, @JsonKey(name: 'tax_amount')  double taxAmount, @JsonKey(name: 'discount_amount')  double discountAmount, @JsonKey(name: 'total_amount')  double totalAmount, @JsonKey(name: 'cash_given')  double? cashGiven, @JsonKey(name: 'change_return')  double? changeReturn,  String? notes, @JsonKey(name: 'created_by')  User? createdBy,  List<SaleItem>? items, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Sale():
return $default(_that.id,_that.saleNumber,_that.status,_that.paymentStatus,_that.paymentMethod,_that.subtotal,_that.taxAmount,_that.discountAmount,_that.totalAmount,_that.cashGiven,_that.changeReturn,_that.notes,_that.createdBy,_that.items,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'sale_number')  String saleNumber,  String status, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'payment_method')  String paymentMethod,  double subtotal, @JsonKey(name: 'tax_amount')  double taxAmount, @JsonKey(name: 'discount_amount')  double discountAmount, @JsonKey(name: 'total_amount')  double totalAmount, @JsonKey(name: 'cash_given')  double? cashGiven, @JsonKey(name: 'change_return')  double? changeReturn,  String? notes, @JsonKey(name: 'created_by')  User? createdBy,  List<SaleItem>? items, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Sale() when $default != null:
return $default(_that.id,_that.saleNumber,_that.status,_that.paymentStatus,_that.paymentMethod,_that.subtotal,_that.taxAmount,_that.discountAmount,_that.totalAmount,_that.cashGiven,_that.changeReturn,_that.notes,_that.createdBy,_that.items,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sale extends Sale {
  const _Sale({required this.id, @JsonKey(name: 'sale_number') required this.saleNumber, required this.status, @JsonKey(name: 'payment_status') required this.paymentStatus, @JsonKey(name: 'payment_method') required this.paymentMethod, required this.subtotal, @JsonKey(name: 'tax_amount') required this.taxAmount, @JsonKey(name: 'discount_amount') required this.discountAmount, @JsonKey(name: 'total_amount') required this.totalAmount, @JsonKey(name: 'cash_given') this.cashGiven, @JsonKey(name: 'change_return') this.changeReturn, this.notes, @JsonKey(name: 'created_by') this.createdBy, final  List<SaleItem>? items, @JsonKey(name: 'created_at') required this.createdAt}): _items = items,super._();
  factory _Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);

@override final  int id;
@override@JsonKey(name: 'sale_number') final  String saleNumber;
@override final  String status;
@override@JsonKey(name: 'payment_status') final  String paymentStatus;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override final  double subtotal;
@override@JsonKey(name: 'tax_amount') final  double taxAmount;
@override@JsonKey(name: 'discount_amount') final  double discountAmount;
@override@JsonKey(name: 'total_amount') final  double totalAmount;
@override@JsonKey(name: 'cash_given') final  double? cashGiven;
@override@JsonKey(name: 'change_return') final  double? changeReturn;
@override final  String? notes;
@override@JsonKey(name: 'created_by') final  User? createdBy;
 final  List<SaleItem>? _items;
@override List<SaleItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleCopyWith<_Sale> get copyWith => __$SaleCopyWithImpl<_Sale>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sale&&(identical(other.id, id) || other.id == id)&&(identical(other.saleNumber, saleNumber) || other.saleNumber == saleNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.cashGiven, cashGiven) || other.cashGiven == cashGiven)&&(identical(other.changeReturn, changeReturn) || other.changeReturn == changeReturn)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,saleNumber,status,paymentStatus,paymentMethod,subtotal,taxAmount,discountAmount,totalAmount,cashGiven,changeReturn,notes,createdBy,const DeepCollectionEquality().hash(_items),createdAt);

@override
String toString() {
  return 'Sale(id: $id, saleNumber: $saleNumber, status: $status, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, subtotal: $subtotal, taxAmount: $taxAmount, discountAmount: $discountAmount, totalAmount: $totalAmount, cashGiven: $cashGiven, changeReturn: $changeReturn, notes: $notes, createdBy: $createdBy, items: $items, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SaleCopyWith<$Res> implements $SaleCopyWith<$Res> {
  factory _$SaleCopyWith(_Sale value, $Res Function(_Sale) _then) = __$SaleCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'sale_number') String saleNumber, String status,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'payment_method') String paymentMethod, double subtotal,@JsonKey(name: 'tax_amount') double taxAmount,@JsonKey(name: 'discount_amount') double discountAmount,@JsonKey(name: 'total_amount') double totalAmount,@JsonKey(name: 'cash_given') double? cashGiven,@JsonKey(name: 'change_return') double? changeReturn, String? notes,@JsonKey(name: 'created_by') User? createdBy, List<SaleItem>? items,@JsonKey(name: 'created_at') String createdAt
});


@override $UserCopyWith<$Res>? get createdBy;

}
/// @nodoc
class __$SaleCopyWithImpl<$Res>
    implements _$SaleCopyWith<$Res> {
  __$SaleCopyWithImpl(this._self, this._then);

  final _Sale _self;
  final $Res Function(_Sale) _then;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? saleNumber = null,Object? status = null,Object? paymentStatus = null,Object? paymentMethod = null,Object? subtotal = null,Object? taxAmount = null,Object? discountAmount = null,Object? totalAmount = null,Object? cashGiven = freezed,Object? changeReturn = freezed,Object? notes = freezed,Object? createdBy = freezed,Object? items = freezed,Object? createdAt = null,}) {
  return _then(_Sale(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,saleNumber: null == saleNumber ? _self.saleNumber : saleNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,cashGiven: freezed == cashGiven ? _self.cashGiven : cashGiven // ignore: cast_nullable_to_non_nullable
as double?,changeReturn: freezed == changeReturn ? _self.changeReturn : changeReturn // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as User?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SaleItem>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}

// dart format on

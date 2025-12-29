// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

 int get id; String get name; String get sku; double get price;@JsonKey(name: 'stock_qty') int get stockQuantity;@JsonKey(name: 'category_id') int? get categoryId; Category? get category;@JsonKey(name: 'image_url') String? get imageUrl; String? get description;@JsonKey(name: 'cost_price') double? get costPrice;@JsonKey(name: 'min_stock') int? get minStock;@JsonKey(name: 'is_low_stock') bool? get isLowStockFlag;@JsonKey(name: 'is_in_stock') bool? get isInStockFlag;@JsonKey(name: 'is_active') bool? get isActive;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.minStock, minStock) || other.minStock == minStock)&&(identical(other.isLowStockFlag, isLowStockFlag) || other.isLowStockFlag == isLowStockFlag)&&(identical(other.isInStockFlag, isInStockFlag) || other.isInStockFlag == isInStockFlag)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sku,price,stockQuantity,categoryId,category,imageUrl,description,costPrice,minStock,isLowStockFlag,isInStockFlag,isActive);

@override
String toString() {
  return 'Product(id: $id, name: $name, sku: $sku, price: $price, stockQuantity: $stockQuantity, categoryId: $categoryId, category: $category, imageUrl: $imageUrl, description: $description, costPrice: $costPrice, minStock: $minStock, isLowStockFlag: $isLowStockFlag, isInStockFlag: $isInStockFlag, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 int id, String name, String sku, double price,@JsonKey(name: 'stock_qty') int stockQuantity,@JsonKey(name: 'category_id') int? categoryId, Category? category,@JsonKey(name: 'image_url') String? imageUrl, String? description,@JsonKey(name: 'cost_price') double? costPrice,@JsonKey(name: 'min_stock') int? minStock,@JsonKey(name: 'is_low_stock') bool? isLowStockFlag,@JsonKey(name: 'is_in_stock') bool? isInStockFlag,@JsonKey(name: 'is_active') bool? isActive
});


$CategoryCopyWith<$Res>? get category;

}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sku = null,Object? price = null,Object? stockQuantity = null,Object? categoryId = freezed,Object? category = freezed,Object? imageUrl = freezed,Object? description = freezed,Object? costPrice = freezed,Object? minStock = freezed,Object? isLowStockFlag = freezed,Object? isInStockFlag = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,minStock: freezed == minStock ? _self.minStock : minStock // ignore: cast_nullable_to_non_nullable
as int?,isLowStockFlag: freezed == isLowStockFlag ? _self.isLowStockFlag : isLowStockFlag // ignore: cast_nullable_to_non_nullable
as bool?,isInStockFlag: freezed == isInStockFlag ? _self.isInStockFlag : isInStockFlag // ignore: cast_nullable_to_non_nullable
as bool?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String sku,  double price, @JsonKey(name: 'stock_qty')  int stockQuantity, @JsonKey(name: 'category_id')  int? categoryId,  Category? category, @JsonKey(name: 'image_url')  String? imageUrl,  String? description, @JsonKey(name: 'cost_price')  double? costPrice, @JsonKey(name: 'min_stock')  int? minStock, @JsonKey(name: 'is_low_stock')  bool? isLowStockFlag, @JsonKey(name: 'is_in_stock')  bool? isInStockFlag, @JsonKey(name: 'is_active')  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.name,_that.sku,_that.price,_that.stockQuantity,_that.categoryId,_that.category,_that.imageUrl,_that.description,_that.costPrice,_that.minStock,_that.isLowStockFlag,_that.isInStockFlag,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String sku,  double price, @JsonKey(name: 'stock_qty')  int stockQuantity, @JsonKey(name: 'category_id')  int? categoryId,  Category? category, @JsonKey(name: 'image_url')  String? imageUrl,  String? description, @JsonKey(name: 'cost_price')  double? costPrice, @JsonKey(name: 'min_stock')  int? minStock, @JsonKey(name: 'is_low_stock')  bool? isLowStockFlag, @JsonKey(name: 'is_in_stock')  bool? isInStockFlag, @JsonKey(name: 'is_active')  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.name,_that.sku,_that.price,_that.stockQuantity,_that.categoryId,_that.category,_that.imageUrl,_that.description,_that.costPrice,_that.minStock,_that.isLowStockFlag,_that.isInStockFlag,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String sku,  double price, @JsonKey(name: 'stock_qty')  int stockQuantity, @JsonKey(name: 'category_id')  int? categoryId,  Category? category, @JsonKey(name: 'image_url')  String? imageUrl,  String? description, @JsonKey(name: 'cost_price')  double? costPrice, @JsonKey(name: 'min_stock')  int? minStock, @JsonKey(name: 'is_low_stock')  bool? isLowStockFlag, @JsonKey(name: 'is_in_stock')  bool? isInStockFlag, @JsonKey(name: 'is_active')  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.name,_that.sku,_that.price,_that.stockQuantity,_that.categoryId,_that.category,_that.imageUrl,_that.description,_that.costPrice,_that.minStock,_that.isLowStockFlag,_that.isInStockFlag,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product extends Product {
  const _Product({required this.id, required this.name, required this.sku, required this.price, @JsonKey(name: 'stock_qty') required this.stockQuantity, @JsonKey(name: 'category_id') this.categoryId, this.category, @JsonKey(name: 'image_url') this.imageUrl, this.description, @JsonKey(name: 'cost_price') this.costPrice, @JsonKey(name: 'min_stock') this.minStock, @JsonKey(name: 'is_low_stock') this.isLowStockFlag, @JsonKey(name: 'is_in_stock') this.isInStockFlag, @JsonKey(name: 'is_active') this.isActive}): super._();
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  int id;
@override final  String name;
@override final  String sku;
@override final  double price;
@override@JsonKey(name: 'stock_qty') final  int stockQuantity;
@override@JsonKey(name: 'category_id') final  int? categoryId;
@override final  Category? category;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override final  String? description;
@override@JsonKey(name: 'cost_price') final  double? costPrice;
@override@JsonKey(name: 'min_stock') final  int? minStock;
@override@JsonKey(name: 'is_low_stock') final  bool? isLowStockFlag;
@override@JsonKey(name: 'is_in_stock') final  bool? isInStockFlag;
@override@JsonKey(name: 'is_active') final  bool? isActive;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.minStock, minStock) || other.minStock == minStock)&&(identical(other.isLowStockFlag, isLowStockFlag) || other.isLowStockFlag == isLowStockFlag)&&(identical(other.isInStockFlag, isInStockFlag) || other.isInStockFlag == isInStockFlag)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sku,price,stockQuantity,categoryId,category,imageUrl,description,costPrice,minStock,isLowStockFlag,isInStockFlag,isActive);

@override
String toString() {
  return 'Product(id: $id, name: $name, sku: $sku, price: $price, stockQuantity: $stockQuantity, categoryId: $categoryId, category: $category, imageUrl: $imageUrl, description: $description, costPrice: $costPrice, minStock: $minStock, isLowStockFlag: $isLowStockFlag, isInStockFlag: $isInStockFlag, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String sku, double price,@JsonKey(name: 'stock_qty') int stockQuantity,@JsonKey(name: 'category_id') int? categoryId, Category? category,@JsonKey(name: 'image_url') String? imageUrl, String? description,@JsonKey(name: 'cost_price') double? costPrice,@JsonKey(name: 'min_stock') int? minStock,@JsonKey(name: 'is_low_stock') bool? isLowStockFlag,@JsonKey(name: 'is_in_stock') bool? isInStockFlag,@JsonKey(name: 'is_active') bool? isActive
});


@override $CategoryCopyWith<$Res>? get category;

}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sku = null,Object? price = null,Object? stockQuantity = null,Object? categoryId = freezed,Object? category = freezed,Object? imageUrl = freezed,Object? description = freezed,Object? costPrice = freezed,Object? minStock = freezed,Object? isLowStockFlag = freezed,Object? isInStockFlag = freezed,Object? isActive = freezed,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,minStock: freezed == minStock ? _self.minStock : minStock // ignore: cast_nullable_to_non_nullable
as int?,isLowStockFlag: freezed == isLowStockFlag ? _self.isLowStockFlag : isLowStockFlag // ignore: cast_nullable_to_non_nullable
as bool?,isInStockFlag: freezed == isInStockFlag ? _self.isInStockFlag : isInStockFlag // ignore: cast_nullable_to_non_nullable
as bool?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on

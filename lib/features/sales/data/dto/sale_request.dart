import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_request.freezed.dart';
part 'sale_request.g.dart';

/// Request payload for creating a sale
@freezed
class CreateSaleRequest with _$CreateSaleRequest {
  const factory CreateSaleRequest({
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'cash_given') double? cashGiven,
    @JsonKey(name: 'discount_amount') @Default(0) double discountAmount,
    @JsonKey(name: 'tax_amount') @Default(0) double taxAmount,
    String? notes,
    required List<CreateSaleItemRequest> items,
  }) = _CreateSaleRequest;

  factory CreateSaleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSaleRequestFromJson(json);
      
        @override
        double? get cashGiven => throw UnimplementedError();
      
        @override
        double get discountAmount => throw UnimplementedError();
      
        @override
        List<CreateSaleItemRequest> get items => throw UnimplementedError();
      
        @override
        String? get notes => throw UnimplementedError();
      
        @override
        String get paymentMethod => throw UnimplementedError();
      
        @override
        double get taxAmount => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
}

/// Item in the create sale request
@freezed
class CreateSaleItemRequest with _$CreateSaleItemRequest {
  const factory CreateSaleItemRequest({
    @JsonKey(name: 'product_id') required int productId,
    required int quantity,
  }) = _CreateSaleItemRequest;

  factory CreateSaleItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSaleItemRequestFromJson(json);
      
        @override
        int get productId => throw UnimplementedError();
      
        @override
        int get quantity => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
}

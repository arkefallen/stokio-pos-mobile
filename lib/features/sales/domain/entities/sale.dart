import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/user.dart';
import 'sale_item.dart';

part 'sale.freezed.dart';
part 'sale.g.dart';

/// Sale entity representing a complete sale transaction
@freezed
class Sale with _$Sale {
  const factory Sale({
    required int id,
    @JsonKey(name: 'sale_number') required String saleNumber,
    required String status,
    @JsonKey(name: 'payment_status') required String paymentStatus,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    required double subtotal,
    @JsonKey(name: 'tax_amount') required double taxAmount,
    @JsonKey(name: 'discount_amount') required double discountAmount,
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'cash_given') double? cashGiven,
    @JsonKey(name: 'change_return') double? changeReturn,
    String? notes,
    @JsonKey(name: 'created_by') User? createdBy,
    List<SaleItem>? items,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Sale;

  const Sale._();

  factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);

  /// Check if sale is completed
  bool get isCompleted => status == 'completed';

  /// Check if sale is cancelled
  bool get isCancelled => status == 'cancelled';

  /// Check if sale is pending
  bool get isPending => status == 'pending';

  /// Check if payment is fully paid
  bool get isPaid => paymentStatus == 'paid';

  /// Get formatted status for display
  String get statusDisplay {
    switch (status) {
      case 'completed':
        return 'Completed';
      case 'cancelled':
        return 'Cancelled';
      case 'pending':
        return 'Pending';
      default:
        return status;
    }
  }

  /// Get formatted payment method for display
  String get paymentMethodDisplay {
    switch (paymentMethod) {
      case 'cash':
        return 'Cash';
      case 'card':
        return 'Card';
      case 'transfer':
        return 'Transfer';
      case 'qris':
        return 'QRIS';
      default:
        return paymentMethod;
    }
  }

  /// Get item count
  int get itemCount => items?.fold(0, (sum, item) => sum! + item.quantity) ?? 0;
  
  @override
  double? get cashGiven => throw UnimplementedError();
  
  @override
  double? get changeReturn => throw UnimplementedError();
  
  @override
  String get createdAt => throw UnimplementedError();
  
  @override
  User? get createdBy => throw UnimplementedError();
  
  @override
  double get discountAmount => throw UnimplementedError();
  
  @override
  int get id => throw UnimplementedError();
  
  @override
  List<SaleItem>? get items => throw UnimplementedError();
  
  @override
  String? get notes => throw UnimplementedError();
  
  @override
  String get paymentMethod => throw UnimplementedError();
  
  @override
  String get paymentStatus => throw UnimplementedError();
  
  @override
  String get saleNumber => throw UnimplementedError();
  
  @override
  String get status => throw UnimplementedError();
  
  @override
  double get subtotal => throw UnimplementedError();
  
  @override
  double get taxAmount => throw UnimplementedError();
  
  @override
  Map<String, dynamic> toJson() {

    throw UnimplementedError();
  }
  
  @override
  double get totalAmount => throw UnimplementedError();
}

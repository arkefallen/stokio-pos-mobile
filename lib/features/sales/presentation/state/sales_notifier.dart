import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_config.dart';
import '../../../../core/network/dio_client.dart';
import '../../../cart/domain/entities/cart_item.dart';
import '../../domain/entities/sale.dart';

part 'sales_notifier.g.dart';

/// State for sales history
class SalesState {
  final List<Sale> sales;
  final bool isLoading;
  final String? error;
  final String? message;

  const SalesState({
    this.sales = const [],
    this.isLoading = false,
    this.error,
    this.message,
  });

  SalesState copyWith({
    List<Sale>? sales,
    bool? isLoading,
    String? error,
    String? message,
    bool clearError = false,
    bool clearMessage = false,
  }) {
    return SalesState(
      sales: sales ?? this.sales,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      message: clearMessage ? null : (message ?? this.message),
    );
  }

  /// Get completed sales only
  List<Sale> get completedSales => sales.where((s) => s.isCompleted).toList();

  /// Get cancelled sales only
  List<Sale> get cancelledSales => sales.where((s) => s.isCancelled).toList();

  /// Get today's sales
  List<Sale> get todaySales {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return sales.where((s) {
      try {
        final saleDate = DateTime.parse(s.createdAt);
        return saleDate.isAfter(today) || saleDate.isAtSameMomentAs(today);
      } catch (_) {
        return false;
      }
    }).toList();
  }

  /// Get today's total
  double get todayTotal => todaySales
      .where((s) => s.isCompleted)
      .fold(0.0, (sum, s) => sum + s.totalAmount);

  /// Check if sales are empty
  bool get isEmpty => sales.isEmpty && !isLoading;
}

/// Sales notifier for managing sales history
@Riverpod(keepAlive: true)
class SalesNotifier extends _$SalesNotifier {
  @override
  SalesState build() {
    // Schedule loading after build completes to avoid reading providers during build
    Future.microtask(() => _loadSales());
    return const SalesState(isLoading: true);
  }

  /// Load sales from API
  Future<void> _loadSales() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final dio = ref.read(dioProvider);
      final response = await dio.get(ApiConfig.sales);

      if (response.statusCode == 200) {
        final data = response.data;

        List<Sale> sales = [];

        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final salesList = data['data'] as List<dynamic>? ?? [];
          sales = salesList
              .map((json) => Sale.fromJson(json as Map<String, dynamic>))
              .toList();
        } else if (data is List) {
          sales = data
              .map((json) => Sale.fromJson(json as Map<String, dynamic>))
              .toList();
        }

        // Sort by date descending
        sales.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        state = SalesState(
          sales: sales,
          isLoading: false,
          message: sales.isEmpty ? 'No sales yet. Start selling!' : null,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: 'Failed to load sales history',
        );
      }
    } on DioException catch (e) {
      state = state.copyWith(isLoading: false, error: _parseError(e));
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  /// Refresh sales from API
  Future<void> refresh() async {
    await _loadSales();
  }

  /// Create a new sale
  Future<Sale?> createSale({
    required List<CartItem> items,
    required String paymentMethod,
    double? cashGiven,
    double discountAmount = 0,
    double taxAmount = 0,
    String? notes,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final dio = ref.read(dioProvider);

      // Build request payload matching backend API
      final payload = <String, dynamic>{
        'payment_method': paymentMethod,
        'discount_amount': discountAmount,
        'tax_amount': taxAmount,
        'items': items
            .map(
              (item) => {
                'product_id': item.product.id,
                'quantity': item.quantity,
              },
            )
            .toList(),
      };

      // Add optional fields
      if (cashGiven != null) {
        payload['cash_given'] = cashGiven;
      }
      if (notes != null && notes.isNotEmpty) {
        payload['notes'] = notes;
      }

      final response = await dio.post(ApiConfig.sales, data: payload);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        Sale? newSale;

        if (data is Map<String, dynamic>) {
          if (data.containsKey('data')) {
            newSale = Sale.fromJson(data['data'] as Map<String, dynamic>);
          } else {
            newSale = Sale.fromJson(data);
          }
        }

        if (newSale != null) {
          // Add to local state
          state = state.copyWith(
            sales: [newSale, ...state.sales],
            isLoading: false,
            message: 'Sale created successfully',
          );
          return newSale;
        }
      }

      state = state.copyWith(isLoading: false, error: 'Failed to create sale');
      return null;
    } on DioException catch (e) {
      state = state.copyWith(isLoading: false, error: _parseError(e));
      return null;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
      return null;
    }
  }

  /// Get sale details by ID
  Future<Sale?> getSaleDetail(int saleId) async {
    try {
      final dio = ref.read(dioProvider);
      final response = await dio.get(ApiConfig.saleDetail(saleId));

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is Map<String, dynamic> && data.containsKey('data')) {
          return Sale.fromJson(data['data'] as Map<String, dynamic>);
        } else if (data is Map<String, dynamic>) {
          return Sale.fromJson(data);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Cancel a sale
  Future<bool> cancelSale(int saleId) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final dio = ref.read(dioProvider);
      final response = await dio.post(ApiConfig.cancelSale(saleId));

      if (response.statusCode == 200) {
        // Update local state
        final updatedSales = state.sales.map((sale) {
          if (sale.id == saleId) {
            return sale.copyWith(status: 'cancelled');
          }
          return sale;
        }).toList();

        state = state.copyWith(
          sales: updatedSales,
          isLoading: false,
          message: 'Sale cancelled successfully',
        );
        return true;
      }

      state = state.copyWith(isLoading: false, error: 'Failed to cancel sale');
      return false;
    } on DioException catch (e) {
      state = state.copyWith(isLoading: false, error: _parseError(e));
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
      return false;
    }
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  /// Clear info message
  void clearMessage() {
    state = state.copyWith(clearMessage: true);
  }

  /// Parse Dio error to user-friendly message
  String _parseError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return 'Connection timed out. Please try again.';
    }
    if (e.type == DioExceptionType.connectionError) {
      return 'Unable to connect to server. Please check your connection.';
    }
    if (e.response?.statusCode == 401) {
      return 'Session expired. Please login again.';
    }
    if (e.response?.statusCode == 404) {
      return 'Sale not found';
    }
    if (e.response?.statusCode == 422) {
      // Validation error
      final data = e.response?.data;
      if (data is Map && data.containsKey('message')) {
        return data['message'];
      }
      return 'Invalid request';
    }
    if (e.response?.statusCode == 500) {
      return 'Server error. Please try again later.';
    }
    return e.message ?? 'An error occurred';
  }
}

/// Today's sales count provider
@riverpod
int todaySalesCount(Ref ref) {
  final salesState = ref.watch(salesNotifierProvider);
  return salesState.todaySales.where((s) => s.isCompleted).length;
}

/// Today's total revenue provider
@riverpod
double todayRevenue(Ref ref) {
  final salesState = ref.watch(salesNotifierProvider);
  return salesState.todayTotal;
}

/// Alias for backward compatibility
final salesNotifierProvider = salesProvider;

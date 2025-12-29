import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_config.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';

part 'product_notifier.g.dart';

/// State for products - holds list of products and selected category filter
class ProductsState {
  final List<Product> products;
  final List<Category> categories;
  final int? selectedCategoryId;
  final bool isLoading;
  final String? error;
  final String? message;

  const ProductsState({
    this.products = const [],
    this.categories = const [],
    this.selectedCategoryId,
    this.isLoading = false,
    this.error,
    this.message,
  });

  ProductsState copyWith({
    List<Product>? products,
    List<Category>? categories,
    int? selectedCategoryId,
    bool? isLoading,
    String? error,
    String? message,
    bool clearCategoryFilter = false,
    bool clearError = false,
    bool clearMessage = false,
  }) {
    return ProductsState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      selectedCategoryId: clearCategoryFilter
          ? null
          : (selectedCategoryId ?? this.selectedCategoryId),
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      message: clearMessage ? null : (message ?? this.message),
    );
  }

  /// Get filtered products based on selected category
  List<Product> get filteredProducts {
    if (selectedCategoryId == null) return products;
    return products.where((p) => p.category?.id == selectedCategoryId).toList();
  }

  /// Check if products are empty
  bool get isEmpty => products.isEmpty && !isLoading;
}

/// Product notifier for managing product state
@Riverpod(keepAlive: true)
class ProductNotifier extends _$ProductNotifier {
  @override
  ProductsState build() {
    // Schedule loading after build completes to avoid reading providers during build
    Future.microtask(() => _loadProducts());
    return const ProductsState(isLoading: true);
  }

  /// Load products from API
  Future<void> _loadProducts() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final dio = ref.read(dioProvider);
      final response = await dio.get(ApiConfig.products);

      if (response.statusCode == 200) {
        final data = response.data;

        // Parse products from response
        List<Product> products = [];
        List<Category> categories = [];

        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final productsList = data['data'] as List<dynamic>? ?? [];
          products = productsList
              .map((json) => Product.fromJson(json as Map<String, dynamic>))
              .toList();

          // Extract unique categories from products
          final categorySet = <int, Category>{};
          for (final product in products) {
            if (product.category != null) {
              categorySet[product.category!.id] = product.category!;
            }
          }
          categories = categorySet.values.toList();
        } else if (data is List) {
          products = data
              .map((json) => Product.fromJson(json as Map<String, dynamic>))
              .toList();

          // Extract unique categories
          final categorySet = <int, Category>{};
          for (final product in products) {
            if (product.category != null) {
              categorySet[product.category!.id] = product.category!;
            }
          }
          categories = categorySet.values.toList();
        }

        state = ProductsState(
          products: products,
          categories: categories,
          isLoading: false,
          message: products.isEmpty ? 'No products available' : null,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: 'Failed to load products',
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

  /// Refresh products from API
  Future<void> refresh() async {
    await _loadProducts();
  }

  /// Filter products by category
  void filterByCategory(int? categoryId) {
    if (categoryId == state.selectedCategoryId) {
      state = state.copyWith(clearCategoryFilter: true);
    } else {
      state = state.copyWith(selectedCategoryId: categoryId);
    }
  }

  /// Clear category filter
  void clearFilter() {
    state = state.copyWith(clearCategoryFilter: true);
  }

  /// Search products by name
  List<Product> searchProducts(String query) {
    if (query.isEmpty) return state.filteredProducts;
    final lowerQuery = query.toLowerCase();
    return state.filteredProducts
        .where((p) => p.name.toLowerCase().contains(lowerQuery))
        .toList();
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
    if (e.response?.statusCode == 500) {
      return 'Server error. Please try again later.';
    }
    return e.message ?? 'Failed to load products';
  }
}

/// Selected category provider
@riverpod
Category? selectedCategory(Ref ref) {
  final state = ref.watch(productNotifierProvider);
  if (state.selectedCategoryId == null) return null;
  return state.categories.firstWhere(
    (c) => c.id == state.selectedCategoryId,
    orElse: () => const Category(id: 0, name: 'Unknown'),
  );
}

/// Alias for backward compatibility
final productNotifierProvider = productProvider;

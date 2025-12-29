import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/core.dart';
import '../../products/presentation/state/product_notifier.dart';
import '../../products/presentation/widgets/category_chips.dart';
import '../../products/presentation/widgets/product_grid.dart';
import '../../cart/presentation/widgets/cart_sheet.dart';
import '../../cart/presentation/state/cart_notifier.dart';

/// Main POS Screen with product grid and cart
class PosScreen extends ConsumerStatefulWidget {
  const PosScreen({super.key});

  @override
  ConsumerState<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends ConsumerState<PosScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showCartSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CartSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(productProvider);
    final cartTotal = ref.watch(cartTotalProvider);
    final cartIsEmpty = ref.watch(cartIsEmptyProvider);

    // Listen for error/message changes
    ref.listen<ProductsState>(productProvider, (previous, next) {
      if (next.error != null && previous?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: AppColors.error,
            action: SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: () => ref.read(productProvider.notifier).refresh(),
            ),
          ),
        );
        ref.read(productProvider.notifier).clearError();
      }
      if (next.message != null && previous?.message != next.message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message!),
            backgroundColor: AppColors.info,
          ),
        );
        ref.read(productProvider.notifier).clearMessage();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stokio POS',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              DateFormatter.formatFull(DateTime.now()),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
            ),
          ],
        ),
        actions: [
          // Refresh button
          IconButton(
            onPressed: () => ref.read(productProvider.notifier).refresh(),
            icon: const Icon(PhosphorIconsRegular.arrowClockwise),
            tooltip: 'Refresh',
          ),
          // Cart button with total
          if (!cartIsEmpty)
            Padding(
              padding: const EdgeInsets.only(right: AppDimens.spacing8),
              child: InkWell(
                onTap: _showCartSheet,
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.spacing12,
                    vertical: AppDimens.spacing8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                    boxShadow: AppTheme.buttonShadow,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        PhosphorIconsBold.shoppingCart,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: AppDimens.spacing8),
                      Text(
                        CurrencyFormatter.format(cartTotal),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 200.ms).slideX(begin: 0.2, end: 0),
              ),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(productProvider.notifier).refresh(),
        color: AppColors.primary,
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(AppDimens.spacing16),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(PhosphorIconsRegular.magnifyingGlass),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(PhosphorIconsRegular.x),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                ),
              ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.2, end: 0),
            ),

            // Category chips (only show if not loading and has categories)
            if (!productsState.isLoading && productsState.categories.isNotEmpty)
              const CategoryChips()
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 300.ms),

            const SizedBox(height: AppDimens.spacing8),

            // Product grid with states
            Expanded(
              child: _buildProductContent(productsState),
            ),
          ],
        ),
      ),
      // Floating cart button on mobile when cart has items
      floatingActionButton: cartIsEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: _showCartSheet,
              backgroundColor: AppColors.primary,
              icon: const Icon(PhosphorIconsBold.shoppingCart),
              label: Text(CurrencyFormatter.format(cartTotal)),
            )
              .animate()
              .scale(begin: const Offset(0.8, 0.8), duration: 200.ms)
              .fadeIn(),
    );
  }

  Widget _buildProductContent(ProductsState state) {
    // Loading state
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      );
    }

    // Error state
    if (state.error != null && state.products.isEmpty) {
      return _buildErrorState(state.error!);
    }

    // Empty state
    if (state.products.isEmpty) {
      return _buildEmptyState();
    }

    // Products grid
    return ProductGrid(
      products: _searchQuery.isEmpty
          ? state.filteredProducts
          : ref.read(productProvider.notifier).searchProducts(_searchQuery),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.spacing32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              PhosphorIconsLight.warning,
              size: 64,
              color: AppColors.error.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppDimens.spacing16),
            Text(
              'Failed to load products',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
            ),
            const SizedBox(height: AppDimens.spacing8),
            Text(
              error,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiaryLight,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimens.spacing24),
            ElevatedButton.icon(
              onPressed: () => ref.read(productProvider.notifier).refresh(),
              icon: const Icon(PhosphorIconsBold.arrowClockwise),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    ).animate().fadeIn();
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.spacing32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              PhosphorIconsLight.package,
              size: 64,
              color: AppColors.textTertiaryLight,
            ),
            const SizedBox(height: AppDimens.spacing16),
            Text(
              'No products available',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
            ),
            const SizedBox(height: AppDimens.spacing8),
            Text(
              'Products will appear here once added',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiaryLight,
                  ),
            ),
            const SizedBox(height: AppDimens.spacing24),
            OutlinedButton.icon(
              onPressed: () => ref.read(productProvider.notifier).refresh(),
              icon: const Icon(PhosphorIconsRegular.arrowClockwise),
              label: const Text('Refresh'),
            ),
          ],
        ),
      ),
    ).animate().fadeIn();
  }
}

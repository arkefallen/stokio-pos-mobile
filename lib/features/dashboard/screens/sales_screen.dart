import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/core.dart';
import '../../sales/presentation/state/sales_notifier.dart';
import '../../sales/presentation/widgets/sale_card.dart';
import '../../sales/presentation/screens/sale_detail_screen.dart';

/// Sales history screen
class SalesScreen extends ConsumerWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesState = ref.watch(salesNotifierProvider);
    final todaySales = ref.watch(todaySalesCountProvider);
    final todayRevenue = ref.watch(todayRevenueProvider);

    // Listen for error/message changes
    ref.listen<SalesState>(salesNotifierProvider, (previous, next) {
      if (next.error != null && previous?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: AppColors.error,
            action: SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: () =>
                  ref.read(salesNotifierProvider.notifier).refresh(),
            ),
          ),
        );
        ref.read(salesNotifierProvider.notifier).clearError();
      }
      if (next.message != null && previous?.message != next.message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message!),
            backgroundColor: AppColors.success,
          ),
        );
        ref.read(salesNotifierProvider.notifier).clearMessage();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Sales History'),
        actions: [
          IconButton(
            onPressed: () => ref.read(salesNotifierProvider.notifier).refresh(),
            icon: const Icon(PhosphorIconsRegular.arrowClockwise),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          // Today's summary card
          Container(
            margin: const EdgeInsets.all(AppDimens.spacing16),
            padding: const EdgeInsets.all(AppDimens.spacing20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.primaryDark],
              ),
              borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
              boxShadow: AppTheme.cardShadowElevated,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Revenue",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                      ),
                      const SizedBox(height: AppDimens.spacing4),
                      Text(
                        CurrencyFormatter.format(todayRevenue),
                        style: AppTypography.priceHero().copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppDimens.spacing16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        PhosphorIconsBold.receipt,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(height: AppDimens.spacing4),
                      Text(
                        '$todaySales',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        'sales',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2, end: 0),

          // Sales list with states
          Expanded(
            child: _buildSalesContent(context, ref, salesState),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesContent(
      BuildContext context, WidgetRef ref, SalesState state) {
    // Loading state
    if (state.isLoading && state.sales.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    // Error state with no data
    if (state.error != null && state.sales.isEmpty) {
      return _buildErrorState(context, ref, state.error!);
    }

    // Empty state
    if (state.sales.isEmpty) {
      return _buildEmptyState(context, ref);
    }

    // Sales list
    return RefreshIndicator(
      onRefresh: () => ref.read(salesNotifierProvider.notifier).refresh(),
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing16),
        itemCount: state.sales.length,
        itemBuilder: (context, index) {
          final sale = state.sales[index];
          return SaleCard(
            sale: sale,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SaleDetailScreen(sale: sale),
                ),
              );
            },
          )
              .animate()
              .fadeIn(
                  delay: Duration(milliseconds: 50 * index), duration: 300.ms)
              .slideX(begin: 0.1, end: 0);
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String error) {
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
              'Failed to load sales',
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
              onPressed: () =>
                  ref.read(salesNotifierProvider.notifier).refresh(),
              icon: const Icon(PhosphorIconsBold.arrowClockwise),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    ).animate().fadeIn();
  }

  Widget _buildEmptyState(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.spacing32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              PhosphorIconsLight.receipt,
              size: 64,
              color: AppColors.textTertiaryLight,
            ),
            const SizedBox(height: AppDimens.spacing16),
            Text(
              'No sales yet',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
            ),
            const SizedBox(height: AppDimens.spacing8),
            Text(
              'Start selling to see your sales history here',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiaryLight,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimens.spacing24),
            OutlinedButton.icon(
              onPressed: () =>
                  ref.read(salesNotifierProvider.notifier).refresh(),
              icon: const Icon(PhosphorIconsRegular.arrowClockwise),
              label: const Text('Refresh'),
            ),
          ],
        ),
      ),
    ).animate().fadeIn();
  }
}

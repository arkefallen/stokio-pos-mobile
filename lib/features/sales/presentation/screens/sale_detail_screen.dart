import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/core.dart';
import '../../domain/entities/sale.dart';
import '../state/sales_notifier.dart';

/// Detail screen for a specific sale
class SaleDetailScreen extends ConsumerWidget {
  final Sale sale;

  const SaleDetailScreen({super.key, required this.sale});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(title: Text(sale.saleNumber)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status card
            _buildStatusCard(
              context,
            ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.1, end: 0),

            const SizedBox(height: AppDimens.spacing16),

            // Details card
            _buildDetailsCard(
              context,
            ).animate().fadeIn(delay: 100.ms, duration: 300.ms),

            const SizedBox(height: AppDimens.spacing16),

            // Items card
            _buildItemsCard(
              context,
            ).animate().fadeIn(delay: 200.ms, duration: 300.ms),

            const SizedBox(height: AppDimens.spacing16),

            // Summary card
            _buildSummaryCard(
              context,
            ).animate().fadeIn(delay: 300.ms, duration: 300.ms),

            const SizedBox(height: AppDimens.spacing24),

            // Cancel button (only for completed sales)
            if (sale.isCompleted)
              OutlinedButton.icon(
                onPressed: () => _showCancelDialog(context, ref),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.error,
                  side: const BorderSide(color: AppColors.error),
                ),
                icon: const Icon(PhosphorIconsBold.xCircle),
                label: const Text('Cancel Sale'),
              ).animate().fadeIn(delay: 400.ms, duration: 300.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: sale.isCompleted
              ? [AppColors.success, AppColors.success.withValues(alpha: 0.8)]
              : [AppColors.error, AppColors.error.withValues(alpha: 0.8)],
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.spacing12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              sale.isCompleted
                  ? PhosphorIconsBold.checkCircle
                  : PhosphorIconsBold.xCircle,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: AppDimens.spacing16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sale.isCompleted ? 'Completed' : 'Cancelled',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppDimens.spacing4),
                Text(
                  DateFormatter.formatDateTime(DateTime.parse(sale.createdAt)),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          Text(
            CurrencyFormatter.format(sale.totalAmount),
            style: AppTypography.priceHero().copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transaction Details',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppDimens.spacing16),
          _DetailRow(label: 'Transaction ID', value: sale.saleNumber),
          const SizedBox(height: AppDimens.spacing12),
          _DetailRow(
            label: 'Date',
            value: DateFormatter.formatFull(DateTime.parse(sale.createdAt)),
          ),
          const SizedBox(height: AppDimens.spacing12),
          _DetailRow(
            label: 'Time',
            value: DateFormatter.formatTime(DateTime.parse(sale.createdAt)),
          ),
          const SizedBox(height: AppDimens.spacing12),
          _DetailRow(
            label: 'Payment Method',
            value: sale.paymentMethod.toUpperCase(),
            icon: sale.paymentMethod == 'qris'
                ? PhosphorIconsRegular.qrCode
                : PhosphorIconsRegular.money,
          ),
        ],
      ),
    );
  }

  Widget _buildItemsCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                '${sale.itemCount} items',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacing16),
          ...(sale.items ?? []).map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppDimens.spacing12),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                    ),
                    child: Center(
                      child: Text(
                        '${item.quantity}x',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacing12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.productName,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '@ ${CurrencyFormatter.format(item.price)}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.textSecondaryLight),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    CurrencyFormatter.format(item.subtotal),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
              ),
              Text(
                CurrencyFormatter.format(sale.subtotal),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacing8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax (0%)',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
              ),
              Text(
                CurrencyFormatter.format(0),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacing12),
          const Divider(),
          const SizedBox(height: AppDimens.spacing12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                CurrencyFormatter.format(sale.totalAmount),
                style: AppTypography.priceHero(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCancelDialog(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmationDialog.show(
      context: context,
      title: 'Cancel Sale',
      message:
          'Are you sure you want to cancel this sale? This action cannot be undone.',
      confirmLabel: 'Yes, Cancel',
      cancelLabel: 'No, Keep It',
      type: ConfirmationDialogType.danger,
      icon: PhosphorIconsBold.xCircle,
    );

    if (confirmed == true && context.mounted) {
      await ref.read(salesNotifierProvider.notifier).cancelSale(sale.id);
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sale cancelled successfully'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    }
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  const _DetailRow({required this.label, required this.value, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondaryLight),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: AppColors.primary),
              const SizedBox(width: AppDimens.spacing4),
            ],
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}

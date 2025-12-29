import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/core.dart';
import '../../domain/entities/sale.dart';

/// Card displaying sale summary in sales list
class SaleCard extends StatelessWidget {
  final Sale sale;
  final VoidCallback onTap;

  const SaleCard({super.key, required this.sale, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimens.spacing12),
        padding: const EdgeInsets.all(AppDimens.spacing16),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                // Transaction icon
                Container(
                  padding: const EdgeInsets.all(AppDimens.spacing10),
                  decoration: BoxDecoration(
                    color: _getStatusColor().withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  ),
                  child: Icon(
                    _getStatusIcon(),
                    color: _getStatusColor(),
                    size: 20,
                  ),
                ),
                const SizedBox(width: AppDimens.spacing12),
                // Transaction number and time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sale.saleNumber,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacing2),
                      Text(
                        DateFormatter.formatRelative(
                          _parseDate(sale.createdAt),
                        ),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                // Amount
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      CurrencyFormatter.format(sale.totalAmount),
                      style: AppTypography.priceCard().copyWith(
                        color: sale.isCancelled
                            ? AppColors.textTertiaryLight
                            : AppColors.primary,
                        decoration: sale.isCancelled
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    const SizedBox(height: AppDimens.spacing2),
                    _buildStatusBadge(context),
                  ],
                ),
              ],
            ),

            const SizedBox(height: AppDimens.spacing12),
            const Divider(height: 1),
            const SizedBox(height: AppDimens.spacing12),

            // Items summary
            Row(
              children: [
                Icon(
                  PhosphorIconsRegular.package,
                  size: 16,
                  color: AppColors.textSecondaryLight,
                ),
                const SizedBox(width: AppDimens.spacing6),
                Text(
                  '${sale.itemCount} items',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(width: AppDimens.spacing16),
                Icon(
                  _getPaymentIcon(),
                  size: 16,
                  color: AppColors.textSecondaryLight,
                ),
                const SizedBox(width: AppDimens.spacing6),
                Text(
                  sale.paymentMethod.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
                ),
                const Spacer(),
                Icon(
                  PhosphorIconsRegular.caretRight,
                  size: 16,
                  color: AppColors.textTertiaryLight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.spacing8,
        vertical: AppDimens.spacing2,
      ),
      decoration: BoxDecoration(
        color: _getStatusColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        sale.status.toUpperCase(),
        style: TextStyle(
          color: _getStatusColor(),
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getStatusColor() {
    return sale.isCompleted ? AppColors.success : AppColors.error;
  }

  IconData _getStatusIcon() {
    return sale.isCompleted
        ? PhosphorIconsBold.checkCircle
        : PhosphorIconsBold.xCircle;
  }

  IconData _getPaymentIcon() {
    return sale.paymentMethod == 'qris'
        ? PhosphorIconsRegular.qrCode
        : PhosphorIconsRegular.money;
  }

  /// Parse date string to DateTime, with fallback
  DateTime _parseDate(String dateStr) {
    try {
      return DateTime.parse(dateStr);
    } catch (_) {
      return DateTime.now();
    }
  }
}

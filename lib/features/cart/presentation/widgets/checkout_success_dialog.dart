import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/core.dart';
import '../state/cart_notifier.dart';

/// Success dialog shown after checkout
class CheckoutSuccessDialog extends ConsumerWidget {
  final String paymentMethod;
  final double total;

  const CheckoutSuccessDialog({
    super.key,
    required this.paymentMethod,
    required this.total,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.spacing24),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success icon
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: AppColors.success,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                PhosphorIconsBold.check,
                color: Colors.white,
                size: 40,
              ),
            )
                .animate()
                .scale(
                    begin: const Offset(0.5, 0.5),
                    duration: 400.ms,
                    curve: Curves.elasticOut)
                .fadeIn(),

            const SizedBox(height: AppDimens.spacing24),

            // Success message
            Text(
              'Payment Successful!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.success,
                  ),
            ).animate().fadeIn(delay: 200.ms, duration: 300.ms),

            const SizedBox(height: AppDimens.spacing8),

            Text(
              'Transaction completed via ${paymentMethod.toUpperCase()}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
            ).animate().fadeIn(delay: 300.ms, duration: 300.ms),

            const SizedBox(height: AppDimens.spacing24),

            // Amount
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppDimens.spacing16),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              ),
              child: Column(
                children: [
                  Text(
                    'Total Amount',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondaryLight,
                        ),
                  ),
                  const SizedBox(height: AppDimens.spacing4),
                  Text(
                    CurrencyFormatter.format(total),
                    style: AppTypography.priceHero(),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 400.ms, duration: 300.ms),

            const SizedBox(height: AppDimens.spacing8),

            // Transaction number
            Text(
              'TRX-${DateTime.now().toString().substring(0, 10).replaceAll('-', '')}-${DateTime.now().millisecondsSinceEpoch.toString().substring(10)}',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.textTertiaryLight,
                    fontFamily: 'monospace',
                  ),
            ).animate().fadeIn(delay: 500.ms, duration: 300.ms),

            const SizedBox(height: AppDimens.spacing24),

            // Done button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Clear cart
                  ref.read(cartNotifierProvider.notifier).clearCart();
                  // Close the success dialog
                  Navigator.of(context).pop();
                },
                icon: const Icon(PhosphorIconsBold.checkCircle),
                label: const Text('Done'),
              ),
            )
                .animate()
                .fadeIn(delay: 600.ms, duration: 300.ms)
                .slideY(begin: 0.2, end: 0),
          ],
        ),
      ),
    );
  }
}

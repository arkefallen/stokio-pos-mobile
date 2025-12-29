import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/core.dart';
import '../../../sales/presentation/state/sales_notifier.dart';
import '../state/cart_notifier.dart';
import '../../domain/entities/cart_item.dart';
import 'checkout_success_dialog.dart';

/// Bottom sheet displaying cart contents and checkout
class CartSheet extends ConsumerWidget {
  const CartSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartNotifierProvider);
    final cartTotal = ref.watch(cartTotalProvider);
    final cartCount = ref.watch(cartItemsCountProvider);

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusXLarge),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: AppDimens.spacing12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.borderLight,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(AppDimens.spacing16),
            child: Row(
              children: [
                const Icon(
                  PhosphorIconsBold.shoppingCart,
                  color: AppColors.primary,
                ),
                const SizedBox(width: AppDimens.spacing8),
                Text(
                  'Cart',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(width: AppDimens.spacing8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.spacing8,
                    vertical: AppDimens.spacing2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                  ),
                  child: Text(
                    '$cartCount items',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const Spacer(),
                if (cartItems.isNotEmpty)
                  TextButton.icon(
                    onPressed: () => _showClearCartConfirmation(context, ref),
                    icon: const Icon(PhosphorIconsRegular.trash, size: 18),
                    label: const Text('Clear'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.error,
                    ),
                  ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Cart items list
          Flexible(
            child: cartItems.isEmpty
                ? _buildEmptyCart(context)
                : ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(AppDimens.spacing16),
                    itemCount: cartItems.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: AppDimens.spacing12),
                    itemBuilder: (context, index) {
                      return CartItemTile(
                        item: cartItems[index],
                      )
                          .animate()
                          .fadeIn(delay: Duration(milliseconds: 50 * index))
                          .slideX(begin: 0.1, end: 0);
                    },
                  ),
          ),

          // Checkout section
          if (cartItems.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(AppDimens.spacing16),
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    // Total row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          CurrencyFormatter.format(cartTotal),
                          style: AppTypography.priceHero(),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.spacing16),
                    // Checkout button
                    Row(
                      children: [
                        // Cash button
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                _handleCheckout(context, ref, 'cash'),
                            icon: const Icon(PhosphorIconsBold.money),
                            label: const Text('Cash'),
                          ),
                        ),
                        const SizedBox(width: AppDimens.spacing12),
                        // QRIS button
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () =>
                                _handleCheckout(context, ref, 'qris'),
                            icon: const Icon(PhosphorIconsBold.qrCode),
                            label: const Text('QRIS'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn().slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.spacing32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              PhosphorIconsLight.shoppingCart,
              size: 64,
              color: AppColors.textTertiaryLight,
            ),
            const SizedBox(height: AppDimens.spacing16),
            Text(
              'Your cart is empty',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
            ),
            const SizedBox(height: AppDimens.spacing8),
            Text(
              'Tap on products to add them',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiaryLight,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleCheckout(
      BuildContext context, WidgetRef ref, String paymentMethod) async {
    // Capture cart info before processing
    final cartItems = ref.read(cartNotifierProvider);
    final total = ref.read(cartTotalProvider);
    final itemCount = ref.read(cartItemsCountProvider);

    if (cartItems.isEmpty) return;

    // Show confirmation dialog
    final confirmed = await ConfirmationDialog.show(
      context: context,
      title: 'Confirm Payment',
      message: 'Process payment via ${paymentMethod.toUpperCase()}?',
      confirmLabel: 'Confirm',
      cancelLabel: 'Cancel',
      type: paymentMethod == 'cash'
          ? ConfirmationDialogType.success
          : ConfirmationDialogType.primary,
      icon: paymentMethod == 'cash'
          ? PhosphorIconsBold.money
          : PhosphorIconsBold.qrCode,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Process payment via ${paymentMethod.toUpperCase()}?',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
          ),
          const SizedBox(height: AppDimens.spacing12),
          Container(
            padding: const EdgeInsets.all(AppDimens.spacing12),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$itemCount item(s)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondaryLight,
                      ),
                ),
                Text(
                  CurrencyFormatter.format(total),
                  style: AppTypography.priceCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );

      // Create sale via API
      final sale = await ref.read(salesNotifierProvider.notifier).createSale(
            items: cartItems,
            paymentMethod: paymentMethod,
          );

      // Close loading
      if (context.mounted) {
        Navigator.pop(context);
      }

      if (sale != null && context.mounted) {
        // Close cart sheet
        Navigator.pop(context);

        // Clear cart
        ref.read(cartNotifierProvider.notifier).clearCart();

        // Show success dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => CheckoutSuccessDialog(
            paymentMethod: paymentMethod,
            total: total,
          ),
        );
      } else if (context.mounted) {
        // Show error
        final error = ref.read(salesNotifierProvider).error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error ?? 'Failed to create sale'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  /// Show confirmation dialog before clearing the cart
  void _showClearCartConfirmation(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmationDialog.show(
      context: context,
      title: 'Clear Cart?',
      message:
          'Are you sure you want to remove all items from your cart? This action cannot be undone.',
      confirmLabel: 'Clear All',
      cancelLabel: 'Cancel',
      type: ConfirmationDialogType.danger,
      icon: PhosphorIconsBold.trash,
    );

    if (confirmed == true) {
      ref.read(cartNotifierProvider.notifier).clearCart();
    }
  }
}

/// Individual cart item tile with quantity controls
class CartItemTile extends ConsumerWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing12),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      child: Row(
        children: [
          // Product icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
            ),
            child: Center(
              child: Text(
                item.product.category?.icon ?? '📦',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(width: AppDimens.spacing12),
          // Product info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppDimens.spacing4),
                Text(
                  CurrencyFormatter.format(item.product.price),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondaryLight,
                      ),
                ),
              ],
            ),
          ),
          // Quantity controls
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _QuantityButton(
                icon: PhosphorIconsBold.minus,
                onTap: () {
                  ref
                      .read(cartNotifierProvider.notifier)
                      .decreaseQuantity(item.product);
                },
              ),
              Container(
                constraints: const BoxConstraints(minWidth: 32),
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.spacing8),
                child: Text(
                  '${item.quantity}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              _QuantityButton(
                icon: PhosphorIconsBold.plus,
                onTap: () {
                  ref
                      .read(cartNotifierProvider.notifier)
                      .increaseQuantity(item.product);
                },
              ),
            ],
          ),
          const SizedBox(width: AppDimens.spacing12),
          // Line total
          Text(
            CurrencyFormatter.format(item.total),
            style: AppTypography.priceCard(),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
      child: Container(
        padding: const EdgeInsets.all(AppDimens.spacing6),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Icon(
          icon,
          size: 16,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

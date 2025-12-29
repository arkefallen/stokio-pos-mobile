import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../state/product_notifier.dart';

/// Horizontal scrollable category filter chips
class CategoryChips extends ConsumerWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productProvider);
    final categories = productsState.categories;
    final selectedId = productsState.selectedCategoryId;

    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing16),
        itemCount: categories.length + 1, // +1 for "All" chip
        itemBuilder: (context, index) {
          if (index == 0) {
            // "All" chip
            return Padding(
              padding: const EdgeInsets.only(right: AppDimens.spacing8),
              child: _CategoryChip(
                label: 'All',
                icon: '📦',
                isSelected: selectedId == null,
                onTap: () {
                  ref.read(productProvider.notifier).clearFilter();
                },
              ),
            );
          }

          final category = categories[index - 1];
          return Padding(
            padding: const EdgeInsets.only(right: AppDimens.spacing8),
            child: _CategoryChip(
              label: category.name,
              icon: category.icon ?? '📦',
              isSelected: selectedId == category.id,
              color: category.color != null ? Color(category.color!) : null,
              onTap: () {
                ref
                    .read(productProvider.notifier)
                    .filterByCategory(category.id);
              },
            )
                .animate()
                .fadeIn(
                    delay: Duration(milliseconds: 50 * index), duration: 200.ms)
                .slideX(begin: 0.2, end: 0),
          );
        },
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final String icon;
  final bool isSelected;
  final Color? color;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.primary;

    return AnimatedContainer(
      duration: AppDimens.animationFast,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.spacing16,
              vertical: AppDimens.spacing8,
            ),
            decoration: BoxDecoration(
              color: isSelected ? chipColor : AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              border: Border.all(
                color: isSelected ? chipColor : AppColors.borderLight,
                width: 1.5,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: chipColor.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  icon,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: AppDimens.spacing6),
                Text(
                  label,
                  style: TextStyle(
                    color:
                        isSelected ? Colors.white : AppColors.textPrimaryLight,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

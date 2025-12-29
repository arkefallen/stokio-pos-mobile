import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/core.dart';
import '../../cart/presentation/state/cart_notifier.dart';
import '../screens/pos_screen.dart';
import '../screens/sales_screen.dart';
import '../screens/settings_screen.dart';

/// Main dashboard with bottom navigation
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    PosScreen(),
    SalesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final cartCount = ref.watch(cartItemsCountProvider);
    
    return Scaffold(
      body: AnimatedSwitcher(
        duration: AppDimens.animationNormal,
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.spacing8,
              vertical: AppDimens.spacing8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: PhosphorIconsRegular.storefront,
                  activeIcon: PhosphorIconsBold.storefront,
                  label: 'POS',
                  isActive: _currentIndex == 0,
                  onTap: () => _onNavTap(0),
                  badge: cartCount > 0 ? cartCount : null,
                ),
                _NavItem(
                  icon: PhosphorIconsRegular.receipt,
                  activeIcon: PhosphorIconsBold.receipt,
                  label: 'Sales',
                  isActive: _currentIndex == 1,
                  onTap: () => _onNavTap(1),
                ),
                _NavItem(
                  icon: PhosphorIconsRegular.gear,
                  activeIcon: PhosphorIconsBold.gear,
                  label: 'Settings',
                  isActive: _currentIndex == 2,
                  onTap: () => _onNavTap(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onNavTap(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}

/// Custom navigation item with badge support
class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final int? badge;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      child: AnimatedContainer(
        duration: AppDimens.animationFast,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing16,
          vertical: AppDimens.spacing8,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  isActive ? activeIcon : icon,
                  size: 24,
                  color: isActive ? AppColors.primary : AppColors.secondary,
                ),
                if (badge != null)
                  Positioned(
                    right: -8,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Text(
                        badge! > 99 ? '99+' : badge.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                        .animate()
                        .scale(
                          begin: const Offset(0.5, 0.5),
                          end: const Offset(1, 1),
                          duration: 200.ms,
                        ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive ? AppColors.primary : AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    )
        .animate(target: isActive ? 1 : 0)
        .scaleXY(begin: 0.95, end: 1.0, duration: 100.ms);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/core.dart';
import '../../auth/presentation/state/auth_notifier.dart';

/// Settings screen
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimens.spacing16),
        children: [
          // User profile card
          Container(
            padding: const EdgeInsets.all(AppDimens.spacing20),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
              boxShadow: AppTheme.cardShadow,
            ),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: AppTheme.buttonShadow,
                  ),
                  child: Center(
                    child: Text(
                      user?.initials ?? 'U',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                const SizedBox(width: AppDimens.spacing16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.name ?? 'User',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: AppDimens.spacing4),
                      Text(
                        user?.email ?? '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textSecondaryLight,
                            ),
                      ),
                      const SizedBox(height: AppDimens.spacing4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.spacing8,
                          vertical: AppDimens.spacing2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius:
                              BorderRadius.circular(AppTheme.radiusSmall),
                        ),
                        child: Text(
                          user?.role.toUpperCase() ?? 'CASHIER',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // TODO: Edit profile
                  },
                  icon: const Icon(PhosphorIconsRegular.pencilSimple),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.1, end: 0),

          const SizedBox(height: AppDimens.spacing24),

          // Settings sections
          _buildSection(
            context,
            title: 'App Settings',
            children: [
              _SettingsTile(
                icon: PhosphorIconsRegular.bell,
                title: 'Notifications',
                subtitle: 'Manage notification preferences',
                onTap: () {},
              ),
              _SettingsTile(
                icon: PhosphorIconsRegular.moon,
                title: 'Dark Mode',
                subtitle: 'Coming soon',
                trailing: Switch(
                  value: false,
                  onChanged: null,
                  activeThumbColor: AppColors.primary,
                ),
                onTap: () {},
              ),
              _SettingsTile(
                icon: PhosphorIconsRegular.globe,
                title: 'Language',
                subtitle: 'English',
                onTap: () {},
              ),
            ],
          )
              .animate()
              .fadeIn(delay: 100.ms, duration: 300.ms)
              .slideY(begin: 0.1, end: 0),

          const SizedBox(height: AppDimens.spacing16),

          _buildSection(
            context,
            title: 'Support',
            children: [
              _SettingsTile(
                icon: PhosphorIconsRegular.question,
                title: 'Help Center',
                onTap: () {},
              ),
              _SettingsTile(
                icon: PhosphorIconsRegular.chatCircle,
                title: 'Contact Support',
                onTap: () {},
              ),
              _SettingsTile(
                icon: PhosphorIconsRegular.info,
                title: 'About',
                subtitle: 'Version 1.0.0',
                onTap: () {},
              ),
            ],
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 300.ms)
              .slideY(begin: 0.1, end: 0),

          const SizedBox(height: AppDimens.spacing24),

          // Logout button
          ElevatedButton.icon(
            onPressed: () {
              _showLogoutDialog(context, ref);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            icon: const Icon(PhosphorIconsBold.signOut),
            label: const Text('Logout'),
          ).animate().fadeIn(delay: 300.ms, duration: 300.ms),

          const SizedBox(height: AppDimens.spacing32),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppDimens.spacing4,
            bottom: AppDimens.spacing8,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.textSecondaryLight,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
            boxShadow: AppTheme.cardShadow,
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmationDialog.show(
      context: context,
      title: 'Logout',
      message:
          'Are you sure you want to logout? You will need to sign in again.',
      confirmLabel: 'Logout',
      cancelLabel: 'Cancel',
      type: ConfirmationDialogType.danger,
      icon: PhosphorIconsBold.signOut,
    );

    if (confirmed == true) {
      ref.read(authNotifierProvider.notifier).logout();
    }
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing16,
          vertical: AppDimens.spacing12,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimens.spacing8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
              ),
              child: Icon(
                icon,
                size: 20,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: AppDimens.spacing12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondaryLight,
                          ),
                    ),
                ],
              ),
            ),
            trailing ??
                Icon(
                  PhosphorIconsRegular.caretRight,
                  size: 20,
                  color: AppColors.textTertiaryLight,
                ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../theme/app_colors.dart';
import '../constants/app_dimens.dart';
import '../theme/app_theme.dart';

/// Configuration for confirmation dialog styling
enum ConfirmationDialogType {
  /// Default primary action (blue)
  primary,

  /// Success action (green)
  success,

  /// Danger/destructive action (red)
  danger,

  /// Warning action (orange)
  warning,
}

/// A reusable confirmation dialog with consistent styling across the app.
///
/// Usage:
/// ```dart
/// final confirmed = await ConfirmationDialog.show(
///   context: context,
///   title: 'Delete Item',
///   message: 'Are you sure you want to delete this item?',
///   confirmLabel: 'Delete',
///   type: ConfirmationDialogType.danger,
/// );
/// if (confirmed == true) {
///   // Handle confirmation
/// }
/// ```
class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final ConfirmationDialogType type;
  final IconData? icon;
  final Widget? content;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = 'Confirm',
    this.cancelLabel = 'Cancel',
    this.type = ConfirmationDialogType.primary,
    this.icon,
    this.content,
  });

  /// Shows the confirmation dialog and returns true if confirmed, false otherwise.
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    ConfirmationDialogType type = ConfirmationDialogType.primary,
    IconData? icon,
    Widget? content,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (_) => ConfirmationDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        type: type,
        icon: icon,
        content: content,
      ),
    );
  }

  Color get _primaryColor {
    switch (type) {
      case ConfirmationDialogType.primary:
        return AppColors.primary;
      case ConfirmationDialogType.success:
        return AppColors.success;
      case ConfirmationDialogType.danger:
        return AppColors.error;
      case ConfirmationDialogType.warning:
        return AppColors.warning;
    }
  }

  IconData get _defaultIcon {
    switch (type) {
      case ConfirmationDialogType.primary:
        return PhosphorIconsBold.question;
      case ConfirmationDialogType.success:
        return PhosphorIconsBold.checkCircle;
      case ConfirmationDialogType.danger:
        return PhosphorIconsBold.warning;
      case ConfirmationDialogType.warning:
        return PhosphorIconsBold.warningCircle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.spacing8),
            decoration: BoxDecoration(
              color: _primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
            ),
            child: Icon(
              icon ?? _defaultIcon,
              color: _primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: AppDimens.spacing12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
      content: content ??
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
          ),
      actionsPadding: const EdgeInsets.fromLTRB(
        AppDimens.spacing16,
        AppDimens.spacing8,
        AppDimens.spacing16,
        AppDimens.spacing16,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context, false),
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: AppDimens.spacing12),
                ),
                child: Text(cancelLabel),
              ),
            ),
            const SizedBox(width: AppDimens.spacing12),
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryColor,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: AppDimens.spacing12),
                ),
                child: Text(confirmLabel),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

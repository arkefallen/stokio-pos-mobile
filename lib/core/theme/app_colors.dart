import 'package:flutter/material.dart';

/// Stokio Premium Color Palette
/// A Teal & Slate theme conveying stability and freshness.
abstract class AppColors {
  // ============================================
  // Primary - Teal
  // ============================================

  /// Primary brand color - Teal #0D9488
  /// Used for: Action buttons, active states, primary accents
  static const Color primary = Color(0xFF0D9488);

  /// Lighter teal for hover/pressed states
  static const Color primaryLight = Color(0xFF14B8A6);

  /// Darker teal for emphasis
  static const Color primaryDark = Color(0xFF0F766E);

  // ============================================
  // Secondary - Slate
  // ============================================

  /// Secondary color - Slate #475569
  /// Used for: Secondary text, inactive icons, subtle elements
  static const Color secondary = Color(0xFF475569);

  /// Lighter slate for borders, dividers
  static const Color secondaryLight = Color(0xFF64748B);

  /// Darker slate for headings, prominent text
  static const Color secondaryDark = Color(0xFF334155);

  // ============================================
  // Surfaces & Backgrounds
  // ============================================

  /// Light mode surface (cards, modals)
  static const Color surfaceLight = Color(0xFFFFFFFF);

  /// Dark mode surface
  static const Color surfaceDark = Color(0xFF0F172A);

  /// Light mode background
  static const Color backgroundLight = Color(0xFFF1F5F9);

  /// Dark mode background
  static const Color backgroundDark = Color(0xFF020617);

  // ============================================
  // Semantic Colors
  // ============================================

  /// Error state - Rose #E11D48
  static const Color error = Color(0xFFE11D48);

  /// Error light for backgrounds
  static const Color errorLight = Color(0xFFFECDD3);

  /// Success state - Emerald #10B981
  static const Color success = Color(0xFF10B981);

  /// Success light for backgrounds
  static const Color successLight = Color(0xFFD1FAE5);

  /// Warning state - Amber
  static const Color warning = Color(0xFFF59E0B);

  /// Warning light for backgrounds
  static const Color warningLight = Color(0xFFFEF3C7);

  /// Info state - Blue
  static const Color info = Color(0xFF3B82F6);

  /// Info light for backgrounds
  static const Color infoLight = Color(0xFFDBEAFE);

  // ============================================
  // Text Colors
  // ============================================

  /// Primary text (light mode)
  static const Color textPrimaryLight = Color(0xFF0F172A);

  /// Secondary text (light mode)
  static const Color textSecondaryLight = Color(0xFF64748B);

  /// Tertiary/muted text (light mode)
  static const Color textTertiaryLight = Color(0xFF94A3B8);

  /// Primary text (dark mode)
  static const Color textPrimaryDark = Color(0xFFF8FAFC);

  /// Secondary text (dark mode)
  static const Color textSecondaryDark = Color(0xFF94A3B8);

  /// Tertiary/muted text (dark mode)
  static const Color textTertiaryDark = Color(0xFF64748B);

  // ============================================
  // Utility
  // ============================================

  /// Border color (light mode)
  static const Color borderLight = Color(0xFFE2E8F0);

  /// Border color (dark mode)
  static const Color borderDark = Color(0xFF334155);

  /// Divider color (light mode)
  static const Color dividerLight = Color(0xFFE2E8F0);

  /// Divider color (dark mode)
  static const Color dividerDark = Color(0xFF1E293B);

  /// Overlay for modals/dialogs
  static const Color overlay = Color(0x80000000);

  /// Shadow color
  static const Color shadow = Color(0x0D000000); // 5% black
}

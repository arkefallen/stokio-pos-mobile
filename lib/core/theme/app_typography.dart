import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Stokio Premium Typography
/// Using Inter font for clean, highly readable UI text
abstract class AppTypography {
  // ============================================
  // Text Theme Generator
  // ============================================
  
  /// Creates the text theme for light mode
  static TextTheme get lightTextTheme => _createTextTheme(isLight: true);
  
  /// Creates the text theme for dark mode
  static TextTheme get darkTextTheme => _createTextTheme(isLight: false);

  static TextTheme _createTextTheme({required bool isLight}) {
    final Color primaryColor = isLight 
        ? AppColors.textPrimaryLight 
        : AppColors.textPrimaryDark;
    final Color secondaryColor = isLight 
        ? AppColors.textSecondaryLight 
        : AppColors.textSecondaryDark;

    return TextTheme(
      // Display styles (rarely used in mobile)
      displayLarge: GoogleFonts.inter(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: primaryColor,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),

      // Headline styles
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),

      // Title styles - H1, H2, H3 from design system
      titleLarge: GoogleFonts.inter(
        fontSize: 24, // H1
        fontWeight: FontWeight.w700,
        color: primaryColor,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 20, // H2
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 16, // H3
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),

      // Body styles
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14, // Body standard
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12, // Caption
        fontWeight: FontWeight.w400,
        color: secondaryColor,
      ),

      // Label styles
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: primaryColor,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: primaryColor,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: secondaryColor,
      ),
    );
  }

  // ============================================
  // Custom Text Styles (Design System Specific)
  // ============================================

  /// Price display style - 28sp Bold with tabular numbers
  static TextStyle priceHero({bool isLight = true}) {
    return GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: isLight ? AppColors.textPrimaryLight : AppColors.textPrimaryDark,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }

  /// Price in cards - smaller price display
  static TextStyle priceCard({bool isLight = true}) {
    return GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }

  /// Button text style
  static TextStyle button({bool isLight = true}) {
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: Colors.white,
    );
  }

  /// Small caption with muted color
  static TextStyle caption({bool isLight = true}) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: isLight ? AppColors.textTertiaryLight : AppColors.textTertiaryDark,
    );
  }

  /// Badge/chip text
  static TextStyle badge() {
    return GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    );
  }
}

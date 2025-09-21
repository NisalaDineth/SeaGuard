import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppDesignSystem {
  // Spacing constants
  static const double paddingXS = 4.0;
  static const double paddingSM = 8.0;
  static const double paddingMD = 16.0;
  static const double paddingLG = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;

  // Border radius
  static const double borderRadiusSM = 8.0;
  static const double borderRadiusMD = 12.0;
  static const double borderRadiusLG = 16.0;
  static const double borderRadiusXL = 20.0;

  // Elevation/Shadow
  static const double elevationSM = 2.0;
  static const double elevationMD = 4.0;
  static const double elevationLG = 8.0;

  // Card styling
  static BoxDecoration cardDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(borderRadiusLG),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  // Primary card with gradient
  static BoxDecoration primaryCardDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: AppColors.primaryGradient,
      borderRadius: BorderRadius.circular(borderRadiusLG),
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  // Icon container decoration
  static BoxDecoration iconContainerDecoration(Color color) {
    return BoxDecoration(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(borderRadiusMD),
    );
  }

  // Standard page padding
  static EdgeInsets pagePadding = const EdgeInsets.all(paddingMD);
  static EdgeInsets sectionPadding = const EdgeInsets.symmetric(
    horizontal: paddingMD,
    vertical: paddingLG,
  );

  // Text styles extensions - optimized for forced light theme
  static TextStyle sectionHeaderStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall!.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.grey[800], // Always light theme color
    );
  }

  static TextStyle cardTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.w600,
      color: Colors.grey[800], // Always light theme color
    );
  }

  static TextStyle cardSubtitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Colors.grey[600], // Always light theme color
    );
  }

  // AppBar styling
  static AppBar standardAppBar({
    required String title,
    bool centerTitle = true,
    List<Widget>? actions,
  }) {
    return AppBar(
      title: Text(title),
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      centerTitle: centerTitle,
      elevation: 0,
      actions: actions,
    );
  }

  // Standard section spacing
  static const SizedBox sectionSpacing = SizedBox(height: paddingLG);
  static const SizedBox itemSpacing = SizedBox(height: paddingMD);
  static const SizedBox smallSpacing = SizedBox(height: paddingSM);

  // Additional helper methods for consistent color usage
  static Color getPrimaryColor() => AppColors.primary;
  static Color getSecondaryColor() => AppColors.secondary;

  // Since app is forced to light theme, these always return light theme colors
  static Color getBackgroundColor(BuildContext context) {
    return AppColors.lightBackground;
  }

  static Color getSurfaceColor(BuildContext context) {
    return AppColors.lightSurface;
  }

  static Color getTextColor(BuildContext context) {
    return AppColors.textPrimary;
  }
}

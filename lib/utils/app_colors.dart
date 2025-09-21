import 'package:flutter/material.dart';

/// Centralized color scheme for SeaGuard app
/// This ensures consistency across all screens and components
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary brand colors - Ocean theme
  static const Color primary = Color(0xFF2E7D8E); // Main ocean blue
  static const Color primaryDark = Color(0xFF1E5A6B); // Darker ocean blue
  static const Color primaryLight = Color(0xFF4A9BAE); // Lighter ocean blue
  static const Color primaryVeryLight = Color(
    0xFFE4F6FB,
  ); // Very light blue for backgrounds

  // Secondary colors - Ocean complementary
  static const Color secondary = Color(0xFF5FB3C3); // Aqua blue
  static const Color secondaryDark = Color(0xFF3E8A9A); // Darker aqua
  static const Color secondaryLight = Color(0xFF8FCDD8); // Light aqua

  // Accent colors - Purposeful and limited
  static const Color accent = Color(0xFF00BCD4); // Cyan accent for highlights
  static const Color accentOrange = Color(
    0xFFFF8A50,
  ); // Warm coral for important actions

  // Semantic colors
  static const Color success = Color(0xFF4CAF50); // Green for success states
  static const Color warning = Color(0xFFFF9800); // Orange for warnings
  static const Color error = Color(0xFFF44336); // Red for errors
  static const Color info = Color(0xFF2196F3); // Blue for information

  // Neutral colors - Light theme
  static const Color lightBackground = Color(
    0xFFF5F9FA,
  ); // Very light blue-gray
  static const Color lightSurface = Color(0xFFFFFFFF); // Pure white for cards
  static const Color lightSurfaceVariant = Color(0xFFF8FDFF); // Light variant

  // Neutral colors - Dark theme
  static const Color darkBackground = Color(0xFF0A0A0A); // Near black
  static const Color darkSurface = Color(0xFF1A1A1A); // Dark gray for cards
  static const Color darkSurfaceVariant = Color(
    0xFF2A2A2A,
  ); // Lighter dark variant

  // Text colors
  static const Color textPrimary = Color(0xFF212121); // Primary text
  static const Color textSecondary = Color(0xFF757575); // Secondary text
  static const Color textHint = Color(0xFF9E9E9E); // Hint text
  static const Color textOnPrimary = Colors.white; // Text on primary color
  static const Color textOnDark = Colors.white; // Text on dark backgrounds

  // Border and divider colors
  static const Color border = Color(0xFFE0E0E0); // Light border
  static const Color borderDark = Color(0xFF424242); // Dark border
  static const Color divider = Color(0xFFEEEEEE); // Divider color

  // Stats/KPI specific colors (consistent set)
  static const Color kpiBlue = Color(0xFF2196F3); // Blue for primary metrics
  static const Color kpiTeal = Color(
    0xFF009688,
  ); // Teal for environmental metrics
  static const Color kpiGreen = Color(0xFF4CAF50); // Green for achievements
  static const Color kpiAmber = Color(0xFFFF6F00); // Amber for points/rewards

  // Category colors (for action categories, lesson types, etc.)
  static const Color categoryPlastic = Color(
    0xFFE91E63,
  ); // Pink for plastic reduction
  static const Color categoryCarbon = Color(
    0xFF607D8B,
  ); // Blue-gray for carbon footprint
  static const Color categoryMarine = Color(
    0xFF00BCD4,
  ); // Cyan for marine protection
  static const Color categoryDirect = Color(
    0xFF8BC34A,
  ); // Light green for direct action
  static const Color categoryEducation = Color(
    0xFF9C27B0,
  ); // Purple for education

  // Gradient definitions for consistent usage
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [primary, primaryDark, Color(0xFF0D3A42)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Helper methods for consistent color usage
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  // Get appropriate text color based on background
  static Color getTextColorForBackground(Color backgroundColor) {
    // Calculate luminance to determine if background is light or dark
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? textPrimary : textOnDark;
  }

  // Get category color by name
  static Color getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'plastic reduction':
      case 'plastic':
        return categoryPlastic;
      case 'carbon footprint':
      case 'carbon':
        return categoryCarbon;
      case 'marine protection':
      case 'marine':
        return categoryMarine;
      case 'direct action':
      case 'action':
        return categoryDirect;
      case 'education':
      case 'learning':
        return categoryEducation;
      default:
        return primary; // Default to primary color
    }
  }

  // Get KPI color by type
  static Color getKpiColor(String type) {
    switch (type.toLowerCase()) {
      case 'points':
      case 'score':
        return kpiAmber;
      case 'actions':
      case 'completed':
        return kpiGreen;
      case 'impact':
      case 'environmental':
        return kpiTeal;
      default:
        return kpiBlue;
    }
  }
}

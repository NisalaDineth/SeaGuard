import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/auth_splash_screen.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const SeaGuardApp());
}

class SeaGuardApp extends StatelessWidget {
  const SeaGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SeaGuard',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light, // Force light theme always
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.lightBackground,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
        ),
        cardColor: AppColors.lightSurface,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.lightSurface,
          background: AppColors.lightBackground,
          error: AppColors.error,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textOnPrimary,
          ),
        ),
      ),
      // Dark theme removed since app is forced to light theme
      home: const AuthSplashScreen(),
    );
  }
}

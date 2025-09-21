import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/tab_screen.dart';

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
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF2E7D8E),
        scaffoldBackgroundColor: const Color(0xFFF5F9FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2E7D8E),
          foregroundColor: Colors.white,
        ),
        cardColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D8E)),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF2E7D8E),
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2E7D8E),
          foregroundColor: Colors.white,
        ),
        cardColor: const Color(0xFF1A1A1A),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D8E)),
        ),
      ),
      home: const TabScreen(),
    );
  }
}

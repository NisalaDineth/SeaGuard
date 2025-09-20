import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/tab_screen.dart';

void main() {
  runApp(const SeaGuard());
}

class SeaGuard extends StatelessWidget {
  const SeaGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SeaGuard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(
            0xFF2E7D8E,
          ), // Ocean blue color for SeaGuard theme
        ),
        useMaterial3: true,
      ),
      home: const TabScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

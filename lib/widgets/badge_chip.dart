import 'package:flutter/material.dart';

class BadgeChip extends StatelessWidget {
  final String label;
  final Color color;

  const BadgeChip({super.key, required this.label, this.color = const Color(0xFF2E7D8E)});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: color.withOpacity(0.1),
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.bold),
    );
  }
}

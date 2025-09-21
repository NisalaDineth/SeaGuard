import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String time;
  final double progress;
  final VoidCallback? onTap;

  const LessonCard({
    super.key,
    required this.title,
    required this.time,
    required this.progress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircularProgressIndicator(
          value: progress,
          color: const Color(0xFF2E7D8E),
        ),
        title: Text(title),
        subtitle: Text("$time • Tap to read"),
        onTap: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/awareness_card.dart';
import 'lesson_details_screen.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {
        "title": "Reduce Single-Use Plastics",
        "subtitle": "Tips to avoid daily plastic usage",
        "image": "assets/images/plastic.jpg",
        "points": [
          "Use reusable bags and bottles",
          "Avoid straws and single-use cutlery",
          "Recycle plastics properly"
        ],
      },
      {
        "title": "Safe Sunscreen Choices",
        "subtitle": "Protect marine life while staying safe",
        "image": "assets/images/coral.jpeg",
        "points": [
          "Use reef-safe sunscreen",
          "Avoid chemical-heavy lotions",
          "Protect marine ecosystems"
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Learn"), backgroundColor: const Color(0xFF2E7D8E), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LessonDetailScreen(
                    title: lesson["title"] as String,
                    subtitle: lesson["subtitle"] as String,
                    imagePath: lesson["image"] as String,
                    keyPoints: lesson["points"] as List<String>,
                  ),
                ),
              );
            },
            child: AwarenessCard(
              title: lesson["title"] as String,
              subtitle: lesson["subtitle"] as String,
              imagePath: lesson["image"] as String,
            ),
          );
        },
      ),
    );
  }
}

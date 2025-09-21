import 'package:flutter/material.dart';
import '../widgets/action_card.dart';
import 'action_details_screen.dart';

class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      {
        "title": "Skip Plastic Straws",
        "points": 10,
        "icon": Icons.local_drink,
        "description": "Use reusable straws or skip them to reduce plastic waste."
      },
      {
        "title": "Beach Clean-up (5 items)",
        "points": 25,
        "icon": Icons.cleaning_services,
        "description": "Pick up 5 pieces of litter from your local beach."
      },
      {
        "title": "Use Public Transport",
        "points": 15,
        "icon": Icons.directions_bus,
        "description": "Take bus/train instead of private car to reduce CO2 emissions."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Action Hub"),
        backgroundColor: const Color(0xFF2E7D8E),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          final action = actions[index];
          return ActionCard(
            title: action["title"] as String,
            points: action["points"] as int,
            icon: action["icon"] as IconData,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ActionDetailScreen(
                    title: action["title"] as String,
                    description: action["description"] as String,
                    points: action["points"] as int,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

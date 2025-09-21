import 'package:flutter/material.dart';
import '../widgets/badge_chip.dart';

class ProfileScreen extends StatelessWidget {
  final int totalPoints; // total points from actions
  const ProfileScreen({super.key, this.totalPoints = 50}); // default mock points

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final badges = [
      "🌊 Ocean Guardian",
      "🏖️ Coastline Champion",
      "♻️ Plastic Free Hero"
    ];

    // Mock reward ideas
    final rewards = [
      {"title": "Eco Badge Unlock", "cost": 20},
      {"title": "Printable Ocean Postcard", "cost": 15},
      {"title": "Virtual Cleanup Access", "cost": 30},
      {"title": "Donate Points to Clean Beaches", "cost": 25},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: const Color(0xFF2E7D8E),
        centerTitle: true
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Avatar
          CircleAvatar(
            radius: 50,
            backgroundColor: theme.primaryColor,
            child: const Text(
              "G",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              "Gayan Maduwantha",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              "Eco-warrior",
              style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
            ),
          ),
          const SizedBox(height: 24),

          // Total Points Display
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: theme.primaryColor.withOpacity(0.9),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Points",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFFFC107)),
                      const SizedBox(width: 4),
                      Text(
                        "$totalPoints",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Badges Section
          Text(
            "Your Badges",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: badges.map((b) => BadgeChip(label: b)).toList(),
          ),
          const SizedBox(height: 24),

          // Stats Section
          Text(
            "Stats",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.local_drink, color: theme.primaryColor),
            title: const Text("Plastic Saved"),
            trailing: const Text("12 kg"),
          ),
          ListTile(
            leading: Icon(Icons.co2, color: theme.primaryColor),
            title: const Text("CO₂ Avoided"),
            trailing: const Text("3.5 kg"),
          ),
          ListTile(
            leading: Icon(Icons.beach_access, color: theme.primaryColor),
            title: const Text("Beaches Cleaned"),
            trailing: const Text("5"),
          ),
          const SizedBox(height: 24),

          // Rewards / Spend Points Section
          Text(
            "Redeem Points",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Column(
  children: rewards.map((reward) {
    final canRedeem = totalPoints >= (reward["cost"] as int); // <-- cast to int
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(reward["title"] as String),
        trailing: ElevatedButton(
          onPressed: canRedeem
              ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${reward["title"]} Redeemed! 🌊"),
                      backgroundColor: theme.primaryColor,
                    ),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: canRedeem ? theme.primaryColor : Colors.grey,
          ),
          child: Text("Cost: ${reward["cost"]} pts"),
        ),
      ),
    );
  }).toList(),
),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

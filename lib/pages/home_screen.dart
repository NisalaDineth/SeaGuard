import 'package:flutter/material.dart';
import '../widgets/kpi_card.dart';
import '../widgets/awareness_card.dart';
import '../utils/tab_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final kpis = [
      {"title": "Plastic Saved", "value": "12 kg", "icon": Icons.recycling},
      {"title": "CO₂ Avoided", "value": "3.5 kg", "icon": Icons.co2},
      {"title": "Beaches Cleaned", "value": "5", "icon": Icons.beach_access},
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("SeaGuard", style: TextStyle(color: Colors.white)),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFF006D77), const Color(0xFF83C5BE)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome section
                  Text("Welcome back, Eco Warrior!",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 8),
                  Text("Together, we're making waves of change 🌊",
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
                  const SizedBox(height: 24),

                  // KPI Cards
                  Text("Your Impact", style: theme.textTheme.displaySmall),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: kpis.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final kpi = kpis[index];
                        return KpiCard(
                          title: kpi["title"] as String,
                          value: kpi["value"] as String,
                          icon: kpi["icon"] as IconData,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Daily Challenge
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.eco, color: theme.colorScheme.primary),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Today's Challenge",
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text("Bring a reusable water bottle",
                                    style: theme.textTheme.bodyMedium),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => TabNavigation.changeTab(2),
                            child: const Text("Start"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Awareness Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Learn & Protect", style: theme.textTheme.displaySmall),
                      TextButton(
                        onPressed: () => TabNavigation.changeTab(1),
                        child: const Text("See all"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              AwarenessCard(
                title: "Protect Coral Reefs",
                subtitle: "Learn how plastics affect marine life",
                imagePath: "assets/images/coral.jpeg",
              ),
              AwarenessCard(
                title: "Reduce Plastic Waste",
                subtitle: "Small actions create big impacts",
                imagePath: "assets/images/plastic.jpg",
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../utils/design_system.dart';
import '../utils/app_colors.dart';
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
        "description":
            "Use reusable straws or skip them to reduce plastic waste.",
        "category": "Plastic Reduction",
      },
      {
        "title": "Beach Clean-up (5 items)",
        "points": 25,
        "icon": Icons.cleaning_services,
        "description": "Pick up 5 pieces of litter from your local beach.",
        "category": "Direct Action",
      },
      {
        "title": "Use Public Transport",
        "points": 15,
        "icon": Icons.directions_bus,
        "description":
            "Take bus/train instead of private car to reduce CO2 emissions.",
        "category": "Carbon Footprint",
      },
      {
        "title": "Reef-Safe Sunscreen",
        "points": 20,
        "icon": Icons.wb_sunny,
        "description": "Switch to coral-safe sunscreen to protect marine life.",
        "category": "Marine Protection",
      },
    ];

    return Scaffold(
      appBar: AppDesignSystem.standardAppBar(title: "Action Hub"),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: AppDesignSystem.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderSection(context),

                  AppDesignSystem.sectionSpacing,

                  _buildStatsSection(context),

                  AppDesignSystem.sectionSpacing,

                  Text(
                    "Available Actions",
                    style: AppDesignSystem.sectionHeaderStyle(context),
                  ),

                  AppDesignSystem.itemSpacing,
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final action = actions[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  AppDesignSystem.paddingMD,
                  0,
                  AppDesignSystem.paddingMD,
                  AppDesignSystem.paddingMD,
                ),
                child: _buildEnhancedActionCard(context, action),
              );
            }, childCount: actions.length),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
      decoration: AppDesignSystem.primaryCardDecoration(context),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.textOnPrimary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                AppDesignSystem.borderRadiusMD,
              ),
            ),
            child: const Icon(
              Icons.eco,
              color: AppColors.textOnPrimary,
              size: 28,
            ),
          ),
          const SizedBox(width: AppDesignSystem.paddingLG),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Take Action Today",
                  style: TextStyle(
                    color: AppColors.textOnPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppDesignSystem.smallSpacing,
                Text(
                  "Every action counts for our ocean's future",
                  style: TextStyle(
                    color: AppColors.textOnPrimary.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            "Today's Goal",
            "3 Actions",
            Icons.today,
            AppColors.warning,
          ),
        ),
        const SizedBox(width: AppDesignSystem.paddingMD),
        Expanded(
          child: _buildStatCard(
            context,
            "Total Points",
            "125 pts",
            Icons.stars,
            AppColors.kpiAmber,
          ),
        ),
        const SizedBox(width: AppDesignSystem.paddingMD),
        Expanded(
          child: _buildStatCard(
            context,
            "This Week",
            "8 Actions",
            Icons.calendar_today,
            AppColors.success,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
      decoration: AppDesignSystem.cardDecoration(context),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                AppDesignSystem.borderRadiusMD,
              ),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          AppDesignSystem.smallSpacing,
          Text(
            value,
            style: AppDesignSystem.cardTitleStyle(
              context,
            ).copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppDesignSystem.cardSubtitleStyle(
              context,
            ).copyWith(fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedActionCard(
    BuildContext context,
    Map<String, dynamic> action,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ActionDetailScreen(
              title: action["title"] as String,
              points: action["points"] as int,
              description: action["description"] as String,
            ),
          ),
        );
      },
      child: Container(
        decoration: AppDesignSystem.cardDecoration(context),
        child: Padding(
          padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: AppDesignSystem.iconContainerDecoration(
                      AppColors.primary,
                    ),
                    child: Icon(
                      action["icon"] as IconData,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: AppDesignSystem.paddingMD),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          action["title"] as String,
                          style: AppDesignSystem.cardTitleStyle(context),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDesignSystem.paddingSM,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              AppDesignSystem.borderRadiusSM,
                            ),
                          ),
                          child: Text(
                            action["category"] as String,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDesignSystem.paddingMD,
                      vertical: AppDesignSystem.paddingSM,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(
                        AppDesignSystem.borderRadiusLG,
                      ),
                    ),
                    child: Text(
                      "+${action["points"]} pts",
                      style: const TextStyle(
                        color: AppColors.textOnPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              AppDesignSystem.itemSpacing,

              // Description
              Text(
                action["description"] as String,
                style: AppDesignSystem.cardSubtitleStyle(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              AppDesignSystem.itemSpacing,

              // Action button
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle action completion
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Great job! You earned ${action["points"]} points!',
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D8E).withOpacity(0.1),
                    foregroundColor: const Color(0xFF2E7D8E),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDesignSystem.borderRadiusMD,
                      ),
                      side: const BorderSide(
                        color: Color(0xFF2E7D8E),
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Complete Action",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/badge_chip.dart';
import '../utils/design_system.dart';
import '../utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  final int totalPoints;
  const ProfileScreen({super.key, this.totalPoints = 125});

  @override
  Widget build(BuildContext context) {
    final badges = [
      "🌊 Ocean Guardian",
      "🏖️ Coastline Champion",
      "♻️ Plastic Free Hero",
      "🐠 Marine Protector",
    ];

    final achievements = [
      {
        "title": "First Action",
        "description": "Complete your first eco-action",
        "completed": true,
      },
      {
        "title": "Week Warrior",
        "description": "Complete 7 actions in a week",
        "completed": true,
      },
      {
        "title": "Ocean Hero",
        "description": "Earn 100 points",
        "completed": true,
      },
      {
        "title": "Plastic Fighter",
        "description": "Complete 5 plastic reduction actions",
        "completed": false,
      },
    ];

    return Scaffold(
      appBar: AppDesignSystem.standardAppBar(
        title: "My Profile",
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: AppDesignSystem.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileHeader(context),

                  AppDesignSystem.sectionSpacing,

                  _buildStatsSection(context),

                  AppDesignSystem.sectionSpacing,

                  _buildBadgesSection(context, badges),

                  AppDesignSystem.sectionSpacing,

                  _buildAchievementsSection(context, achievements),

                  AppDesignSystem.sectionSpacing,

                  _buildQuickActionsSection(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
      decoration: AppDesignSystem.primaryCardDecoration(context),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.textOnPrimary.withOpacity(0.2),
            child: Text(
              "G",
              style: TextStyle(
                fontSize: 40,
                color: AppColors.textOnPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          AppDesignSystem.itemSpacing,

          const Text(
            "Gayan Maduwantha",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textOnPrimary,
            ),
          ),

          AppDesignSystem.smallSpacing,

          Text(
            "Ocean Conservation Enthusiast",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textOnPrimary.withOpacity(0.9),
            ),
          ),

          AppDesignSystem.itemSpacing,

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDesignSystem.paddingLG,
              vertical: AppDesignSystem.paddingSM,
            ),
            decoration: BoxDecoration(
              color: AppColors.textOnPrimary,
              borderRadius: BorderRadius.circular(
                AppDesignSystem.borderRadiusLG,
              ),
            ),
            child: Text(
              "$totalPoints Total Points",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
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
            "Actions\nCompleted",
            "23",
            Icons.check_circle,
          ),
        ),
        const SizedBox(width: AppDesignSystem.paddingMD),
        Expanded(
          child: _buildStatCard(
            context,
            "Days\nActive",
            "15",
            Icons.calendar_today,
          ),
        ),
        const SizedBox(width: AppDesignSystem.paddingMD),
        Expanded(
          child: _buildStatCard(context, "CO₂\nSaved", "8.5kg", Icons.eco),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
      decoration: AppDesignSystem.cardDecoration(context),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 32),
          AppDesignSystem.smallSpacing,
          Text(
            value,
            style: AppDesignSystem.cardTitleStyle(
              context,
            ).copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppDesignSystem.cardSubtitleStyle(
              context,
            ).copyWith(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesSection(BuildContext context, List<String> badges) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Earned Badges",
          style: AppDesignSystem.sectionHeaderStyle(context),
        ),
        AppDesignSystem.itemSpacing,
        Container(
          padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
          decoration: AppDesignSystem.cardDecoration(context),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppDesignSystem.paddingMD,
                  mainAxisSpacing: AppDesignSystem.paddingMD,
                  childAspectRatio: 3,
                ),
                itemCount: badges.length,
                itemBuilder: (context, index) {
                  return BadgeChip(label: badges[index]);
                },
              ),
              AppDesignSystem.itemSpacing,
              TextButton(
                onPressed: () {
                  // Show all badges
                },
                child: const Text(
                  "View All Badges",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementsSection(
    BuildContext context,
    List<Map<String, dynamic>> achievements,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Achievements",
          style: AppDesignSystem.sectionHeaderStyle(context),
        ),
        AppDesignSystem.itemSpacing,
        Container(
          padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
          decoration: AppDesignSystem.cardDecoration(context),
          child: Column(
            children: achievements.map((achievement) {
              final isCompleted = achievement["completed"] as bool;
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: AppDesignSystem.paddingMD,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? AppColors.primary.withOpacity(0.1)
                            : AppColors.textHint.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          AppDesignSystem.borderRadiusMD,
                        ),
                      ),
                      child: Icon(
                        isCompleted
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: isCompleted
                            ? AppColors.primary
                            : AppColors.textHint,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: AppDesignSystem.paddingMD),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            achievement["title"] as String,
                            style: AppDesignSystem.cardTitleStyle(context)
                                .copyWith(
                                  color: isCompleted
                                      ? null
                                      : AppColors.textHint,
                                ),
                          ),
                          Text(
                            achievement["description"] as String,
                            style: AppDesignSystem.cardSubtitleStyle(
                              context,
                            ).copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Actions",
          style: AppDesignSystem.sectionHeaderStyle(context),
        ),
        AppDesignSystem.itemSpacing,
        Container(
          decoration: AppDesignSystem.cardDecoration(context),
          child: Column(
            children: [
              _buildQuickActionTile(context, "Edit Profile", Icons.edit, () {}),
              _buildQuickActionTile(
                context,
                "Share Progress",
                Icons.share,
                () {},
              ),
              _buildQuickActionTile(
                context,
                "Invite Friends",
                Icons.person_add,
                () {},
              ),
              _buildQuickActionTile(
                context,
                "Settings",
                Icons.settings,
                () {},
                showDivider: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: AppDesignSystem.iconContainerDecoration(
              AppColors.primary,
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          title: Text(title, style: AppDesignSystem.cardTitleStyle(context)),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.textHint,
          ),
          onTap: onTap,
        ),
        if (showDivider)
          Divider(height: 1, indent: 72, color: AppColors.divider),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/awareness_card.dart';
import '../utils/design_system.dart';
import '../utils/app_colors.dart';
import 'lesson_details_screen.dart';

class LearnScreenNew extends StatelessWidget {
  const LearnScreenNew({super.key});

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
          "Recycle plastics properly",
        ],
      },
      {
        "title": "Safe Sunscreen Choices",
        "subtitle": "Protect marine life while staying safe",
        "image": "assets/images/coral.jpeg",
        "points": [
          "Use reef-safe sunscreen",
          "Avoid chemical-heavy lotions",
          "Protect marine ecosystems",
        ],
      },
    ];

    return Scaffold(
      appBar: AppDesignSystem.standardAppBar(title: "Learn"),
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

                  Text(
                    "Educational Content",
                    style: AppDesignSystem.sectionHeaderStyle(context),
                  ),

                  AppDesignSystem.itemSpacing,
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final lesson = lessons[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  AppDesignSystem.paddingMD,
                  0,
                  AppDesignSystem.paddingMD,
                  AppDesignSystem.paddingMD,
                ),
                child: _buildLessonCard(context, lesson),
              );
            }, childCount: lessons.length),
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
              Icons.school,
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
                  "Ocean Education Hub",
                  style: TextStyle(
                    color: AppColors.textOnPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppDesignSystem.smallSpacing,
                Text(
                  "Learn how to protect our marine ecosystems",
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

  Widget _buildLessonCard(BuildContext context, Map<String, dynamic> lesson) {
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
      child: Container(
        decoration: AppDesignSystem.cardDecoration(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppDesignSystem.borderRadiusLG),
                topRight: Radius.circular(AppDesignSystem.borderRadiusLG),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  lesson["image"] as String,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.primary.withOpacity(0.1),
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 48,
                        color: AppColors.primary,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Content section
            Padding(
              padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson["title"] as String,
                    style: AppDesignSystem.cardTitleStyle(
                      context,
                    ).copyWith(fontSize: 18),
                  ),

                  AppDesignSystem.smallSpacing,

                  Text(
                    lesson["subtitle"] as String,
                    style: AppDesignSystem.cardSubtitleStyle(context),
                  ),

                  AppDesignSystem.itemSpacing,

                  // Key points preview
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDesignSystem.paddingMD,
                          vertical: AppDesignSystem.paddingSM,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(
                            AppDesignSystem.borderRadiusLG,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.lightbulb_outline,
                              size: 16,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${(lesson["points"] as List).length} Tips",
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.textHint,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../widgets/kpi_card.dart';
// import '../widgets/awareness_card.dart';
// import '../utils/tab_navigation.dart';
// import '../utils/design_system.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final kpis = [
//       {"title": "Plastic Saved", "value": "12 kg", "icon": Icons.recycling},
//       {"title": "CO₂ Avoided", "value": "3.5 kg", "icon": Icons.co2},
//       {"title": "Beaches Cleaned", "value": "5", "icon": Icons.beach_access},
//     ];

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 120,
//             floating: false,
//             pinned: true,
//             elevation: 0,
//             backgroundColor: const Color(0xFF2E7D8E),
//             foregroundColor: Colors.white,
//             flexibleSpace: FlexibleSpaceBar(
//               title: const Text(
//                 "SeaGuard",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               background: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF2E7D8E), Color(0xFF1E5A6B)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: AppDesignSystem.pagePadding,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Welcome section
//                   _buildWelcomeSection(context),
                  
//                   AppDesignSystem.sectionSpacing,
                  
//                   // KPI Cards
//                   _buildKPISection(context, kpis),
                  
//                   AppDesignSystem.sectionSpacing,
                  
//                   // Daily Challenge
//                   _buildDailyChallengeCard(context),
                  
//                   AppDesignSystem.sectionSpacing,
                  
//                   // Quick Actions
//                   _buildQuickActionsSection(context),
                  
//                   AppDesignSystem.sectionSpacing,
                  
//                   // Awareness Section
//                   _buildAwarenessSection(context),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildWelcomeSection(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
//       decoration: AppDesignSystem.cardDecoration(context),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Welcome back, Eco Warrior!",
//             style: AppDesignSystem.sectionHeaderStyle(context),
//           ),
//           AppDesignSystem.smallSpacing,
//           Text(
//             "Together, we're making waves of change 🌊",
//             style: AppDesignSystem.cardSubtitleStyle(context),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildKPISection(BuildContext context, List<Map<String, dynamic>> kpis) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Your Impact",
//           style: AppDesignSystem.sectionHeaderStyle(context),
//         ),
//         AppDesignSystem.itemSpacing,
//         SizedBox(
//           height: 130,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: kpis.length,
//             separatorBuilder: (_, __) => const SizedBox(width: AppDesignSystem.paddingMD),
//             itemBuilder: (context, index) {
//               final kpi = kpis[index];
//               return KpiCard(
//                 title: kpi["title"] as String,
//                 value: kpi["value"] as String,
//                 icon: kpi["icon"] as IconData,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDailyChallengeCard(BuildContext context) {
//     final theme = Theme.of(context);
    
//     return Container(
//       padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
//       decoration: AppDesignSystem.primaryCardDecoration(context),
//       child: Row(
//         children: [
//           Container(
//             width: 56,
//             height: 56,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(AppDesignSystem.borderRadiusMD),
//             ),
//             child: const Icon(
//               Icons.eco,
//               color: Colors.white,
//               size: 28,
//             ),
//           ),
//           const SizedBox(width: AppDesignSystem.paddingLG),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Today's Challenge",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 AppDesignSystem.smallSpacing,
//                 Text(
//                   "Bring a reusable water bottle",
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.9),
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: AppDesignSystem.paddingMD,
//               vertical: AppDesignSystem.paddingSM,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(AppDesignSystem.borderRadiusLG),
//             ),
//             child: const Text(
//               "+15 pts",
//               style: TextStyle(
//                 color: Color(0xFF2E7D8E),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuickActionsSection(BuildContext context) {
//     final quickActions = [
//       {"title": "Beach Cleanup", "icon": Icons.cleaning_services},
//       {"title": "Learn More", "icon": Icons.school},
//       {"title": "Track Progress", "icon": Icons.timeline},
//       {"title": "Share Impact", "icon": Icons.share},
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Quick Actions",
//           style: AppDesignSystem.sectionHeaderStyle(context),
//         ),
//         AppDesignSystem.itemSpacing,
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: AppDesignSystem.paddingMD,
//             mainAxisSpacing: AppDesignSystem.paddingMD,
//             childAspectRatio: 1.5,
//           ),
//           itemCount: quickActions.length,
//           itemBuilder: (context, index) {
//             final action = quickActions[index];
//             return _buildQuickActionCard(
//               context,
//               action["title"] as String,
//               action["icon"] as IconData,
//               index,
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildQuickActionCard(BuildContext context, String title, IconData icon, int index) {
//     return GestureDetector(
//       onTap: () => _handleQuickAction(context, index),
//       child: Container(
//         padding: const EdgeInsets.all(AppDesignSystem.paddingLG),
//         decoration: AppDesignSystem.cardDecoration(context),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 48,
//               height: 48,
//               decoration: AppDesignSystem.iconContainerDecoration(
//                 const Color(0xFF2E7D8E),
//               ),
//               child: Icon(
//                 icon,
//                 color: const Color(0xFF2E7D8E),
//                 size: 24,
//               ),
//             ),
//             AppDesignSystem.smallSpacing,
//             Text(
//               title,
//               style: AppDesignSystem.cardTitleStyle(context).copyWith(fontSize: 14),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildAwarenessSection(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Ocean Awareness",
//           style: AppDesignSystem.sectionHeaderStyle(context),
//         ),
//         AppDesignSystem.itemSpacing,
//         const AwarenessCard(
//           title: "Marine Life Protection",
//           subtitle: "Learn how your actions protect sea creatures",
//           imagePath: "assets/images/coral.jpeg",
//         ),
//       ],
//     );
//   }

//   void _handleQuickAction(BuildContext context, int index) {
//     switch (index) {
//       case 0: // Beach Cleanup
//         navigateToActions(context);
//         break;
//       case 1: // Learn More
//         navigateToLearn(context);
//         break;
//       case 2: // Track Progress
//         // Handle track progress
//         break;
//       case 3: // Share Impact
//         // Handle share impact
//         break;
//     }
//   }
//                               ],
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () => TabNavigation.changeTab(2),
//                             child: const Text("Start"),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // Awareness Section
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Learn & Protect", style: theme.textTheme.displaySmall),
//                       TextButton(
//                         onPressed: () => TabNavigation.changeTab(1),
//                         child: const Text("See all"),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                 ],
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate([
//               AwarenessCard(
//                 title: "Protect Coral Reefs",
//                 subtitle: "Learn how plastics affect marine life",
//                 imagePath: "assets/images/coral.jpeg",
//               ),
//               AwarenessCard(
//                 title: "Reduce Plastic Waste",
//                 subtitle: "Small actions create big impacts",
//                 imagePath: "assets/images/plastic.jpg",
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
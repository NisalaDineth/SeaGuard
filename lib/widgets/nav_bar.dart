import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChange;

  const NavbBar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: onTabChange,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(
            0xFF2E7D8E,
          ), // Ocean blue color for SeaGuard theme
          unselectedItemColor: Colors.grey[600],
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          items: [
            BottomNavigationBarItem(
              icon: _buildCustomIcon('home_outline.svg', 'home_fill.svg', 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildCustomIcon('learn_outline.svg', 'learn_fill.svg', 1),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: _buildCustomIcon(
                'action_outline.svg',
                'action_fill.svg',
                2,
              ),
              label: 'Actions',
            ),
            BottomNavigationBarItem(
              icon: _buildCustomIcon(
                'profile_outline.svg',
                'profile_fill.svg',
                3,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomIcon(String inactiveIcon, String activeIcon, int index) {
    bool isSelected = currentIndex == index;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      // decoration: BoxDecoration(
      //   color: isSelected
      //       ? const Color(0xFF2E7D8E).withValues(alpha: 0.1)
      //       : Colors.transparent,
      //   borderRadius: BorderRadius.circular(12),
      // ),
      child: SvgPicture.asset(
        'assets/icons/${isSelected ? activeIcon : inactiveIcon}',
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          isSelected ? const Color(0xFF2E7D8E) : Colors.grey[600]!,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

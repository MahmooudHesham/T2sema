import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t2sema/core/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 70,
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black.withAlpha(25),
            border: Border.all(color: Colors.white.withAlpha(50), width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, 'assets/icons/ic_football_field.svg'),
              _buildNavItem(1, 'assets/icons/ic_scoreboard.svg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String assetPath) {
    final bool isSelected = currentIndex == index;
    return IconButton(
      onPressed: () => onTap(index),
      icon: SvgPicture.asset(
        assetPath,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.selected : AppColors.primaryText,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

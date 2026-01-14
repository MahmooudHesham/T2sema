import 'package:flutter/material.dart';
import 'package:t2sema/features/home/presentation/views/widgets/add_player_button.dart';
import 'package:t2sema/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:t2sema/features/home/presentation/views/widgets/generate_team_button.dart';

class HomeButtonOverlay extends StatelessWidget {
  const HomeButtonOverlay({
    super.key,
    required this.currentIndex,
    required this.onNavTap,
  });

  final int currentIndex;
  final ValueChanged<int> onNavTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Left Button
            _AnimatedFader(
              isVisible: currentIndex == 0,
              child: const AddPlayerButton(),
            ),

            //Center Nav Bar
            CustomBottomNavBar(currentIndex: currentIndex, onTap: onNavTap),

            // Right Button
            _AnimatedFader(
              isVisible: currentIndex == 0,
              child: const GenerateTeamButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedFader extends StatelessWidget {
  const _AnimatedFader({required this.isVisible, required this.child});

  final bool isVisible;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      opacity: isVisible ? 1.0 : 0.0,
      child: IgnorePointer(ignoring: !isVisible, child: child),
    );
  }
}

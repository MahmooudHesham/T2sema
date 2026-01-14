import 'package:flutter/material.dart';
import 'package:t2sema/features/history/presentation/views/history_view.dart';
import 'package:t2sema/features/home/presentation/views/widgets/home_button_overlay.dart';
import 'package:t2sema/features/match/presentation/views/player_selection_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;
  final List<Widget> _pages = const [PlayerSelectionView(), HistoryView()];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IndexedStack(index: currentIndex, children: _pages),

        HomeButtonOverlay(
          currentIndex: currentIndex,
          onNavTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ],
    );
  }
}

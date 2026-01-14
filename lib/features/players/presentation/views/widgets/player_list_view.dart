import 'package:flutter/material.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_card.dart';

class PlayersListView extends StatelessWidget {
  const PlayersListView({
    super.key,
    required this.playerNames,
    required this.selectedIndices,
    required this.onPlayerToggle,
  });

  final List<String> playerNames;
  final Set<int> selectedIndices;
  final ValueChanged<int> onPlayerToggle;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 120),
      itemCount: playerNames.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final bool isSelected = selectedIndices.contains(index);
        return PlayerCard(
          name: playerNames[index],
          // TODO: Replace with real image logic later
          image: index == 0
              ? 'assets/images/IMG-20220820-WA0029-01.jpeg'
              : null,
          isSelected: isSelected,
          onTap: () => onPlayerToggle(index),
        );
      },
    );
  }
}

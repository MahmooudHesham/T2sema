import 'package:flutter/material.dart';
import 'package:t2sema/features/players/data/models/player_model.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_card.dart';

class PlayersListView extends StatelessWidget {
  const PlayersListView({
    super.key,
    required this.players,
    required this.selectedIndices,
    required this.onPlayerToggle,
  });

  final List<PlayerModel> players;
  final Set<int> selectedIndices;
  final ValueChanged<int> onPlayerToggle;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 120),
      itemCount: players.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final bool isSelected = selectedIndices.contains(index);
        return PlayerCard(
          name: players[index].name,
          // TODO: Replace with real image logic later
          image: players[index].imagePath,
          isSelected: isSelected,
          onTap: () => onPlayerToggle(index),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/core/widgets/custom_snack_bar.dart';
import 'package:t2sema/features/players/data/models/player_model.dart';
import 'package:t2sema/features/players/presentation/manager/players/players_cubit.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_card.dart';

class PlayersListView extends StatelessWidget {
  const PlayersListView({
    super.key,
    required this.players,
    required this.selectedPlayerIds,
    required this.onPlayerToggle,
  });

  final List<PlayerModel> players;
  final Set<String> selectedPlayerIds;
  final ValueChanged<String> onPlayerToggle;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 120),
      itemCount: players.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final player = players[index];
        final bool isSelected = selectedPlayerIds.contains(player.id);
        return Dismissible(
          key: Key(player.id),
          direction: DismissDirection.endToStart,
          background: _buildSwipeBackground(),
          confirmDismiss: (direction) =>
              _showDeleteConfirmation(context, player),
          onDismissed: (direction) => _deletePlayer(context, player),
          child: PlayerCard(
            name: player.name,
            image: player.imagePath,
            isSelected: isSelected,
            onTap: () => onPlayerToggle(player.id),
          ),
        );
      },
    );
  }

  Container _buildSwipeBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: AppColors.error.withAlpha(150),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.delete, color: Colors.white, size: 30),
    );
  }

  Future<bool?> _showDeleteConfirmation(
    BuildContext context,
    PlayerModel player,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: Text('Are you sure you want to delete ${player.name} '),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                "Delete",
                style: AppStyles.textStyleMedium14.copyWith(
                  color: AppColors.error,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deletePlayer(BuildContext context, PlayerModel player) {
    context.read<PlayersCubit>().deletePlayer(player);
    showCustomSnackBar(context, message: "${player.name} deleted");
  }
}

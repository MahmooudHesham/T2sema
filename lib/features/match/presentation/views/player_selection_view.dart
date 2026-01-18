import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/core/widgets/custom_snack_bar.dart';
import 'package:t2sema/features/players/data/models/player_model.dart';
import 'package:t2sema/features/players/presentation/manager/players/players_cubit.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_list_view.dart';

class PlayerSelectionView extends StatefulWidget {
  const PlayerSelectionView({super.key});

  @override
  State<PlayerSelectionView> createState() => _PlayerSelectionViewState();
}

class _PlayerSelectionViewState extends State<PlayerSelectionView> {
  final Set<String> selectedPlayerIds = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            'Player Selected #${selectedPlayerIds.length}',
            style: AppStyles.textStyleSemiBold16,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: BlocConsumer<PlayersCubit, PlayersState>(
              listener: (context, state) {
                if (state is PlayersSuccess) {
                  _syncSelectionWithData(state);
                } else if (state is PlayersFailure) {
                  showCustomSnackBar(
                    context,
                    message: state.errMsg,
                    isError: true,
                  );
                }
              },
              builder: (context, state) {
                if (state is PlayersSuccess) {
                  final sortedPlayers = List<PlayerModel>.from(state.players);
                  sortedPlayers.sort((a, b) {
                    final isASelected = selectedPlayerIds.contains(a.id);
                    final isBSelected = selectedPlayerIds.contains(b.id);

                    if (isASelected && !isBSelected) return -1;
                    if (!isASelected && isBSelected) return 1;
                    return 0;
                  });
                  return PlayersListView(
                    players: sortedPlayers,
                    selectedPlayerIds: selectedPlayerIds,
                    onPlayerToggle: _toggleSelection,
                  );
                } else if (state is PlayersFailure) {
                  return Center(
                    child: Text(
                      "Something went wrong: ${state.errMsg}",
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyleMedium14,
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _syncSelectionWithData(PlayersSuccess state) {
    setState(() {
      final validIds = state.players.map((e) => e.id).toSet();
      selectedPlayerIds.retainAll(validIds);
    });
  }

  void _toggleSelection(String playerId) {
    setState(() {
      if (selectedPlayerIds.contains(playerId)) {
        selectedPlayerIds.remove(playerId);
      } else {
        selectedPlayerIds.add(playerId);
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/players/presentation/manager/players/players_cubit.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_list_view.dart';

class PlayerSelectionView extends StatefulWidget {
  const PlayerSelectionView({super.key});

  @override
  State<PlayerSelectionView> createState() => _PlayerSelectionViewState();
}

class _PlayerSelectionViewState extends State<PlayerSelectionView> {
  // final List<String> playerNames = [
  //   "Mahmoud Hesham",
  //   "Nasooh Nabil",
  //   "Muhammed AlKady",
  //   "ElKholy",
  //   "Khalaf",
  //   "Mahmoud Hamed",
  //   "Ahmed Hesham",
  //   "Nussairy",
  //   "MO Salah",
  //   "Messi",
  //   "CR7",
  // ];

  final Set<int> selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            'Player Selected #${selectedIndices.length}',
            style: AppStyles.textStyleSemiBold16,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: BlocBuilder<PlayersCubit, PlayersState>(
              builder: (context, state) {
                if (state is PlayersSuccess) {
                  return PlayersListView(
                    players: state.players,
                    selectedIndices: selectedIndices,
                    onPlayerToggle: _toggleSelection,
                  );
                } else if (state is PlayersFailure) {
                  return Center(child: Text(state.errMsg));
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

  void _toggleSelection(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
    });
  }
}

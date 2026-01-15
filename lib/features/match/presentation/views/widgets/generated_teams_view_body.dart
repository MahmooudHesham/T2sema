import 'package:flutter/material.dart';
import 'package:t2sema/features/match/presentation/views/widgets/compact_players_list.dart';

class GeneratedTeamsViewBody extends StatelessWidget {
  const GeneratedTeamsViewBody({
    super.key,
    required this.teamA,
    required this.teamB,
  });
  final List<String> teamA;
  final List<String> teamB;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CompactPlayersList(names: teamA, isTeamA: true),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: CompactPlayersList(names: teamB, isTeamA: false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

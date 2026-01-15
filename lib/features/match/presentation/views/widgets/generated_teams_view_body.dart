import 'package:flutter/material.dart';
import 'package:t2sema/features/match/presentation/views/widgets/generated_teams_bottom_bar.dart';
import 'package:t2sema/features/match/presentation/views/widgets/team_column.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ==== Left Side (Team A)====
                Expanded(
                  child: TeamColumn(
                    title: 'Team A',
                    players: teamA,
                    isTeamA: true,
                  ),
                ),

                // Spacing between teams
                const SizedBox(width: 15),

                // ==== Right Side (Team B)====
                Expanded(
                  child: TeamColumn(
                    players: teamB,
                    title: 'Team B',
                    isTeamA: false,
                  ),
                ),
              ],
            ),
          ),
          const SafeArea(
            top: false,
            minimum: EdgeInsets.only(bottom: 20),
            child: GeneratedTeamsBottomBar(),
          ),
        ],
      ),
    );
  }
}

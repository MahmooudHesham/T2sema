import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/match/presentation/views/widgets/compact_players_list.dart';

class TeamColumn extends StatelessWidget {
  const TeamColumn({
    super.key,
    required this.players,
    required this.title,
    required this.isTeamA,
  });

  final String title;
  final List<String> players;
  final bool isTeamA;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: AppStyles.textStyleBold32),
        const SizedBox(height: 10),
        Flexible(
          child: CompactPlayersList(names: players, isTeamA: isTeamA),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t2sema/features/match/presentation/views/widgets/compact_player_card.dart';

class GeneratedTeamsListView extends StatelessWidget {
  const GeneratedTeamsListView({
    super.key,
    required this.names,
    required this.isTeamA,
  });
  final List<String> names;
  final bool isTeamA;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: names.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 15);
      },
      itemBuilder: (context, index) {
        return CompactPlayerCard(name: names[index], teamA: isTeamA);
      },
    );
  }
}

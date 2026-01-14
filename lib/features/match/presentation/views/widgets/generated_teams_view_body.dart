import 'package:flutter/material.dart';
import 'package:t2sema/features/match/presentation/views/widgets/compact_player_card.dart';

class GeneratedTeamsViewBody extends StatelessWidget {
  const GeneratedTeamsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30),
        CompactPlayerCard(name: 'Mahmoud Hesham', teamA: true),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t2sema/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:t2sema/features/match/presentation/views/widgets/generated_teams_view_body.dart';

class GeneratedTeamsView extends StatelessWidget {
  const GeneratedTeamsView({
    super.key,
    required this.teamA,
    required this.teamB,
  });
  final List<String> teamA;
  final List<String> teamB;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: GeneratedTeamsViewBody(teamA: teamA, teamB: teamB),
      ),
    );
  }
}

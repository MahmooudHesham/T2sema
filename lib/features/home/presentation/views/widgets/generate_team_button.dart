import 'package:flutter/material.dart';
import 'package:t2sema/core/widgets/glass_circle_button.dart';

class GenerateTeamButton extends StatelessWidget {
  const GenerateTeamButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCircleButton(
      iconPath: 'assets/icons/ic_generate.svg',
      onTap: () {},
    );
  }
}

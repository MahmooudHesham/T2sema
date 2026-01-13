import 'package:flutter/material.dart';
import 'package:t2sema/core/widgets/glass_circle_button.dart';

class AddPlayerButton extends StatelessWidget {
  const AddPlayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCircleButton(
      iconPath: 'assets/icons/ic_add_player.svg',
      onTap: () {},
    );
  }
}

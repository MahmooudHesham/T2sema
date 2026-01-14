import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';

class PlayerPicture extends StatelessWidget {
  const PlayerPicture({
    super.key,
    required this.image,
    required this.name,
    this.radius = 32.5,
  });

  final String? image;
  final String name;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white.withAlpha(100),
      radius: radius,
      backgroundImage: image != null ? AssetImage(image!) : null,
      child: image == null
          ? Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: AppStyles.textStyleRegular11.copyWith(fontSize: (radius)),
            )
          : null,
    );
  }
}

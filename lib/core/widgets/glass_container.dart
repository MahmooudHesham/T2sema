import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius = 50,
    this.blurStrength = 3.0,
    required this.child,
  });

  final double? width, height;
  final double borderRadius, blurStrength;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurStrength, sigmaY: blurStrength),
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.black.withAlpha(25),
            border: Border.all(color: Colors.white.withAlpha(50), width: 1.5),
          ),
          child: child,
        ),
      ),
    );
  }
}

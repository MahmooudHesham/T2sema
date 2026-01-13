import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onTap,
    this.color = AppColors.primary,
    this.width = 130,
    this.height = 50,
    this.borderRadius,
  });

  final String label;
  final VoidCallback? onTap;
  final Color? color;
  final double? width;
  final double height;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: onTap == null ? Colors.grey : color,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,

      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(label, style: AppStyles.textStyleSemiBold20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t2sema/core/utils/app_colors.dart';

abstract class AppStyles {
  static final TextStyle _baseStyle = GoogleFonts.rubik(
    color: AppColors.primaryText,
  );

  //Light
  static TextStyle textStyleLight20 = _baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );

  //Regular
  static TextStyle textStyleRegular11 = _baseStyle.copyWith(fontSize: 11);
  static TextStyle textStyleRegular16 = _baseStyle.copyWith(fontSize: 16);

  //Medium
  static TextStyle textStyleMedium16 = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyleMedium24 = _baseStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  //semi-Bold

  static TextStyle textStyleSemiBold16 = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textStyleSemiBold20 = _baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  //Bold
  static TextStyle textStyleBold32 = _baseStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyleBold40 = _baseStyle.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
}

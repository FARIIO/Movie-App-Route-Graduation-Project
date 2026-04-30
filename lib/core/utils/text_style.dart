import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static final TextStyle bold24White = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: AppColors.whiteColor,
  );
  static final TextStyle regular20Weight = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: AppColors.whiteColor,
  );
  static final TextStyle regular14Weight = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.whiteColor,
  );
  static final TextStyle bold14Yellow = GoogleFonts.roboto(
    fontWeight: FontWeight.w900,
    fontSize: 14,
    color: AppColors.yellowColor,
  );
  static final TextStyle regular16Weight = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.whiteColor,
  );
  static final TextStyle regular14Yellow = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.yellowColor,
  );
}

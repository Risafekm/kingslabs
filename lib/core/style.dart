import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingslabs/core/colors.dart';

class AppStyles {
  static TextStyle appBarTitle = GoogleFonts.cabin(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: AppColors.secondaryColor,
  );

  static TextStyle bodyTextHead = GoogleFonts.lato(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static TextStyle bodyText = GoogleFonts.actor(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
  static TextStyle bodyModuleText = GoogleFonts.actor(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle buttonText = GoogleFonts.lato(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryColor,
  );
}

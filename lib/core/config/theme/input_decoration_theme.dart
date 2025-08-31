import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:limak_courier/core/config/constants/app_colors.dart';

class LimakInputDecorationTheme {
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.inter().fontFamily,
      color: AppColors.blueColor,
    ),
    floatingLabelStyle: TextStyle(
      color: AppColors.blueColor,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.all(12),
    hintStyle: TextStyle(
      color: AppColors.gray500,
      fontWeight: FontWeight.w500,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    ),
  );
}

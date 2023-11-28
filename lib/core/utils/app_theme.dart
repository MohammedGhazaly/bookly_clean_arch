import 'package:bookly_clean_arch/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // static ThemeData mainTheme = ThemeData(
  //     scaffoldBackgroundColor: AppColors.primaryColor,
  //     useMaterial3: true,
  //     brightness: Brightness.dark);
  static ThemeData mainTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.primaryColor,
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.montserratTextTheme(
      ThemeData.dark().textTheme,
    ),
  );
}

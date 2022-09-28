import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/src/core/shared/themes/app_colors.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.urbanist(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    headline1: GoogleFonts.urbanist(
      color: AppColors.black,
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    headline2: GoogleFonts.urbanist(
      color: AppColors.black,
      fontSize: 21,
      fontWeight: FontWeight.w700,
    ),
    headline3: GoogleFonts.urbanist(
      color: AppColors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    headline6: GoogleFonts.urbanist(
      color: AppColors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.urbanist(
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    headline1: GoogleFonts.urbanist(
      color: AppColors.white,
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    headline2: GoogleFonts.urbanist(
      color: AppColors.white,
      fontSize: 21,
      fontWeight: FontWeight.w700,
    ),
    headline3: GoogleFonts.urbanist(
      color: AppColors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    headline6: GoogleFonts.urbanist(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateColor.resolveWith(
          (states) => AppColors.white,
        ),
        fillColor: MaterialStateColor.resolveWith(
          (states) => AppColors.primary,
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          textStyle: GoogleFonts.urbanist(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          ),
          minimumSize: const Size.fromHeight(0),
          elevation: 0,
        ),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.scafoldBackgroundBlack,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateColor.resolveWith(
          (states) => AppColors.white,
        ),
        fillColor: MaterialStateColor.resolveWith(
          (states) => AppColors.primary,
        ),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: AppColors.white,
        backgroundColor: Colors.grey.shade900,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          ),
          minimumSize: const Size.fromHeight(0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: GoogleFonts.urbanist(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textTheme: darkTextTheme,
    );
  }
}

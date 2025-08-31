import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:limak_courier/core/config/constants/app_colors.dart';
import 'package:limak_courier/core/config/theme/input_decoration_theme.dart';
import 'package:limak_courier/core/config/theme/text_theme.dart';
import 'elevated_button_theme.dart';

class AppTheme {
  static final themeLimak = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ),
    brightness: Brightness.dark,
    inputDecorationTheme: LimakInputDecorationTheme.inputDecorationTheme,
    elevatedButtonTheme: LimakElevatedButtonTheme.elevatedButtonThemeData,
    dividerColor: AppColors.primaryColor,
    dividerTheme: const DividerThemeData(
      color: AppColors.primaryColor,
      thickness: 0.1,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    textTheme: AppTextTheme.lightTextTheme,
    tabBarTheme: TabBarThemeData(
      labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    )
  );
}

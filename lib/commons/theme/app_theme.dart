import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maintenance/commons/theme/app_colors.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.kPrimary,
    backgroundColor: AppColors.kBackground,
    scaffoldBackgroundColor: AppColors.kBackground,
    colorScheme: ThemeData().colorScheme.copyWith(primary: AppColors.kPrimary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.kBottomNavigation,
      unselectedItemColor: AppColors.kDisabled,
      selectedItemColor: AppColors.kPrimary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 10.0,
      selectedLabelStyle: TextStyle(
        fontSize: 12.0,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.0,
      ),
    ),
    hintColor: AppColors.kPrimary,
    brightness: Brightness.light,
    //fontFamily: 'Montserrat',
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleSpacing: 0,
      centerTitle: true,
      color: AppColors.kBackground,
      iconTheme: IconThemeData(
        color: AppColors.kPrimary,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    inputDecorationTheme:  InputDecorationTheme(
      //isDense: true,

     //contentPadding: EdgeInsets.symmetric(horizontal: 0),
      filled: false,
      border: InputBorder.none,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: .8,
          color: AppColors.kDisabled,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.kPrimary,
        ),
      ),
      labelStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.kDisabled),
      prefixIconColor: AppColors.kPrimary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.kPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

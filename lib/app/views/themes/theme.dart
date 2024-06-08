import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColorScheme {
  //main colors
  static Color primary = const Color.fromRGBO(255, 255, 255, 1);
  static Color secondary = const Color.fromRGBO(76, 187, 155, 1);
  static Color tertiary = const Color.fromRGBO(102, 102, 102, 1);
  //text colors
  static Color largeTextColor = const Color.fromRGBO(41, 132, 106, 1);
  static Color mediumTextColor = const Color.fromRGBO(97, 97, 97, 1);
  static Color smallTextColor = const Color.fromRGBO(142, 142, 142, 1);
  static Color headlineMediumColor = const Color.fromRGBO(71, 71, 71, 1);

  //textbox background colrs
  static Color darkGreen = const Color.fromRGBO(41, 132, 106, 1);
  static Color lightGrey = const Color.fromRGBO(236, 236, 236, 1);
  //status colors
  static Color red = const Color.fromRGBO(231, 2, 2, 1);
  static Color blue = const Color.fromRGBO(23, 186, 237, 1);
  static Color green = const Color.fromRGBO(6, 154, 3, 1);

}

final ThemeData splitwiseTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColorScheme.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColorScheme.secondary,
    iconTheme: IconThemeData(color: AppColorScheme.primary)
    ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColorScheme.secondary),
      textStyle: WidgetStateProperty.all(
        GoogleFonts.lato(
          fontSize: 30,
          color: AppColorScheme.primary,
          fontWeight: FontWeight.w500,
        )
      ),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
    )
  ),  
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.lato(
      color: AppColorScheme.largeTextColor, 
      fontSize: 16,
      fontWeight: FontWeight.w500
      ),
    bodyMedium: GoogleFonts.lato(
      color: AppColorScheme.mediumTextColor,
      fontSize: 12,
      fontWeight: FontWeight.w500
      ),
    bodySmall: GoogleFonts.lato(
      color: AppColorScheme.smallTextColor,
      fontSize: 10,
      fontWeight: FontWeight.normal
    ),
    headlineLarge:  GoogleFonts.lato(
    color: AppColorScheme.primary,
    fontSize: 28,
    fontWeight: FontWeight.w500,
  ),
  headlineMedium:  GoogleFonts.lato(
    color: AppColorScheme.headlineMediumColor,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  ),
  headlineSmall:  GoogleFonts.lato(
    color: AppColorScheme.primary,
    fontSize: 22,
    fontWeight: FontWeight.w300,
  )
  ),
  
  listTileTheme: ListTileThemeData(
    titleTextStyle: const TextStyle(fontSize:  12, fontWeight: FontWeight.bold),
    subtitleTextStyle: const TextStyle(fontSize:  10, fontWeight: FontWeight.bold),
    iconColor: AppColorScheme.mediumTextColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    selectedTileColor: AppColorScheme.lightGrey,
    tileColor: AppColorScheme.primary
    ),
  iconTheme: IconThemeData(
    color: AppColorScheme.mediumTextColor, 
    size: 34
    ),
  tabBarTheme: TabBarTheme(
    indicatorColor: AppColorScheme.secondary,
    labelColor: AppColorScheme.secondary,
    labelStyle: GoogleFonts.lato(
      color: AppColorScheme.largeTextColor, 
      fontSize: 16,
      fontWeight: FontWeight.w500
      ),
    unselectedLabelColor: AppColorScheme.mediumTextColor,
    unselectedLabelStyle: GoogleFonts.lato(
      color: AppColorScheme.largeTextColor, 
      fontSize: 16,
      fontWeight: FontWeight.w500
      ),
  )    
  
);

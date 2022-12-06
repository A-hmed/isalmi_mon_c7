import 'package:flutter/material.dart';

class MyThemeData {
  static Color primirayColor = Color(0xffB7935F);
  static Color accentColor = Color(0xff242424);

  static Color primirayColorDark = Color(0xff141A2E);
  static Color accentColorDark = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primirayColor,
    accentColor: accentColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: accentColor
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: accentColor),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: accentColor),
      bodySmall: TextStyle(color: accentColor, fontSize: 18, ),
    )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primirayColorDark,
      accentColor: accentColorDark,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: accentColorDark
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
         bodySmall: TextStyle(color: accentColorDark, fontSize: 18, ),

      )
  );

}
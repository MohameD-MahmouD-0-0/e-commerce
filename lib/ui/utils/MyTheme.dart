import 'package:flutter/material.dart';

class MyTheme{
  static Color PrimaryLight = Color(0xff004182);
  static Color WhiteColor = Color(0xffFFFFFF);
  static Color blackcolor = Colors.black;
  static Color greykcolor = Colors.white12;

  static ThemeData lightMode = ThemeData(
      primaryColor: PrimaryLight,
      scaffoldBackgroundColor: PrimaryLight,
      appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: WhiteColor),
        titleTextStyle: TextStyle(color: WhiteColor),),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor:PrimaryLight ,unselectedItemColor:WhiteColor,
          showUnselectedLabels: true,showSelectedLabels: true,backgroundColor: Colors.transparent,elevation: 0),
      textTheme: TextTheme(titleLarge: TextStyle(fontSize: 24,
        color: WhiteColor,fontWeight: FontWeight.w600,
      ),
          titleMedium: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
          titleSmall: TextStyle(fontSize: 16,fontWeight: FontWeight.w300)

      ),
      bottomSheetTheme: BottomSheetThemeData(shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))))
  );
}
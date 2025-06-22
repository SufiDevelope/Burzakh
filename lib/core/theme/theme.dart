import 'package:flutter/material.dart';

class ThemeChange{
  ThemeChange._();

 static ThemeData darkTheme(){
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
    );
  }

 static ThemeData lightTheme(){
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,

    );
  }
}
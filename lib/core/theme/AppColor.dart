
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../localization/localization_getx.dart';

class AppColor{
  AppColor._();

  static  Color _primary = HexColor("#0D4F34");
  static const Color _black = Color(0xFF000000);
  static const Color _white = Colors.white;
  static  Color _grey = HexColor('#817E77');
  static  Color _greyLight = HexColor('#AEB0B3');
  static  Color _greyLight1 = HexColor('#C7C9CA');
  static const Color _red = Color(0xFFD63434);
  static const Color _red1 = Color(0xFFF81747);
  static const Color _teal = Color(0xFFCCDCE4);
  static const Color _litePink = Color(0xFFFFF5F5);
  static Color _yellowThemeColor = HexColor("#FFCA06");
  static Color _darkYellowColor = HexColor("#F4780C");
  static Color _blurWhiteColor = Color(0xff0C09321A);
  static Color _lightBlue=HexColor("#F5F4F3");
  static Color _lightBlue1=HexColor("#F4F8F6");
  static Color _green=HexColor("#13C25F");
  static Color _yellowLight=HexColor("#B8A85A");
  static Color _whiteLight=HexColor("#F7F2EE");
  static Color whiteLight1=HexColor("#f9fafb");
  static Color _bgPrimary=Color(0xfff8f4ee);
  static Color _darkYellow=Color(0xFFAD8442);
  static Color _fieldYellowBorder=Color(0xffebe3d8);
  static const Color placeholderText = Color(0xFFA9A49E);
  static const Color backgroundStart = Color(0xFFFBF7F2);
  static const Color backgroundEnd = Color(0xFFF2EDE6);
  static  Color buttonColor = Color(0xff063b31);
  static  Color darkGreen = Color(0xFF1a6d53);
  static Color _borderBlackColor = Colors.black;
  static Color _borderWhiteColor = Colors.white;

  static  Color blue = Color(0xFF007aff);
  static  Color lightBlue = Color(0xFFe6f2ff);
  static  Color lightOrange = Color(0xFFfff4e5);
  static  Color orange = Color(0xFFFF9500);
  static  Color lightOrange1 = Color(0xFFfefbf2);
  static  Color lightGreen = Color(0xFFeaf9ee);
  static  Color lightGreen1 = Color(0xFFf3f8f6);
  static  Color green1 = Color(0xFF22c55e);
  static  Color greenText = Color(0xFF1a4d3d);
  static  Color yellowDark = Color(0xFFdbb479);
  static  Color darkBlue = Color(0xFF0b3c68);




 static LinearGradient bgGradient=LinearGradient(
   begin: Alignment.topCenter,
   end: Alignment.bottomCenter,
   colors: [Color(0xFFf1efe9),Color(0xFFf1efe9), Color(0xFFf1efe9)],
 );

 // LinearGradient(
 //   begin: Alignment.topCenter,
 //   end: Alignment.bottomCenter,
 //   colors: [Color(0xFFf1efe9),Color(0xFFf1efe9), Color(0xFFe3dfd5)],
 // );


  // theme update
  static Color black(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light ?_black:Colors.white;
  }

  static Color whiteLight(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light ?_whiteLight:Colors.black;
  }

  static Color fieldYellowBorder(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light ?_fieldYellowBorder:_fieldYellowBorder;
  }

  // theme update
  static Color primary(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_primary:Colors.white;
  }
// theme update
  static Color red(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_red:Colors.blue;
  }
  static Color red1(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_red1:Colors.blue;
  }
// theme update
  static Color teal(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_teal:_litePink;
  }
// theme update
  static Color yellow(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_yellowThemeColor:_darkYellowColor;
  }

// theme update
  static Color white(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_white:_black;
  }


  static Color grey(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_grey:_white;
  }
  static Color bgPrimary(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_bgPrimary:_bgPrimary;
  }

  static Color greyLight(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_greyLight:_greyLight;
  }
  static Color greyLight1(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_greyLight1:_greyLight1;
  }

  static Color borderColor(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_borderBlackColor:_borderWhiteColor;
  }

  static Color blurWhiteColor(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_blurWhiteColor:Colors.black26;
  }

  static Color lightBlueColor(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_lightBlue:_lightBlue;
  }

  static Color lightBlue1Color(){
    final controller = Get.find<LocalizationGetx>();
    return controller.themeMode.value == ThemeMode.light?_lightBlue1:_lightBlue1;
  }

  static Color green(){
    final controller=Get.find<LocalizationGetx>();
    return controller.themeMode.value==ThemeMode.light?_green:_green;
  }

  static Color darkYellow(){
    final controller=Get.find<LocalizationGetx>();
    return controller.themeMode.value==ThemeMode.light?_darkYellow:_darkYellow;
  }

  static Color yellowLight(){
    final controller=Get.find<LocalizationGetx>();
    return controller.themeMode.value==ThemeMode.light?_yellowLight:_yellowLight;
  }

}


enum ThemeType{dark,light,red}
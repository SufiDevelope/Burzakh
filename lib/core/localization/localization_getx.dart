import 'dart:developer';


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationGetx extends GetxController{
  Rx<Locale> lang=Locale('en').obs;

  updateUi(Locale locale,context){
    lang.value=locale;
    EasyLocalization.of(context)!.setLocale(locale);
  }

  selectLocal(context){
    lang.value=EasyLocalization.of(context)!.locale;
    EasyLocalization.of(context)!.setLocale(lang.value);
    update();
  }


  //theme
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  void toggleTheme() {
    themeMode.value = themeMode.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    update(); // This triggers UI rebuild
  }

}
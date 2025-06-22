import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter/material.dart';

class AppTextStyle{
  AppTextStyle._();

 static TextStyle hintTextStyle({double? fontSize}){
    return TextStyle(fontWeight: FontWeight.w300,fontSize: fontSize??15,color: AppColor.placeholderText,);
  }
 static TextStyle hintTextStyleWithFont({double? fontSize}){
    return TextStyle(fontWeight: FontWeight.w300,fontSize: fontSize??15,fontFamily: 'net');
  }


  static TextStyle fieldTextStyle(){
    return TextStyle(fontWeight: FontWeight.w300,fontFamily: 'net',overflow: TextOverflow.ellipsis);
  }
  static TextStyle fieldTextStyleNr(){
    return TextStyle(fontWeight: FontWeight.w300,fontFamily: 'nr',overflow: TextOverflow.ellipsis);
  }
}


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:fluttertoast/fluttertoast.dart';

showMessage(String text,{bool? isError,Color? color}){
  Fluttertoast.showToast(
      msg: text.tr(),
      fontAsset: 'assets/font/inter/Inter_18pt-Medium.ttf',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: isError==true?2:1,
      backgroundColor:isError==true? color??AppColor.red():color??AppColor.primary(),
      textColor: AppColor.white(),
      fontSize: 16.0
  );
}
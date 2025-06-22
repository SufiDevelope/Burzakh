
// ignore_for_file: camel_case_extensions

import 'package:flutter/material.dart';

// For Padding
extension MediaQueryValues on BuildContext {
  double get mh => MediaQuery.sizeOf(this).height;

  double get mw => MediaQuery.sizeOf(this).width;
}


// For SizeBox
extension sizedBox on num {
  SizedBox ph(BuildContext context) {
    return SizedBox(height: MediaQuery.sizeOf(context).height * this);
  }

  SizedBox pw(BuildContext context) {
    return SizedBox(width: MediaQuery.sizeOf(context).width * this);
  }
}
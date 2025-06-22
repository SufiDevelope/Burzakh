// ignore_for_file: must_be_immutable

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
   VerseWidget({super.key,required this.verse1,this.verse2});
String verse1;
String? verse2;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          AppText(
          text:  verse1,
              fontSize: context.mh * 0.014,
              fontFamily: 'ni',
              color: Color(0xFF666666),
            textAlign: TextAlign.center,
          ),
           SizedBox(height:verse2!=null? 4:0),
          verse2!=null? AppText(
            text:
            verse2??"",
              fontSize: context.mh * 0.011,
              color: Colors.grey[500],
            textAlign: TextAlign.center,
          ):SizedBox(),
        ],
      ),
    );
  }
}

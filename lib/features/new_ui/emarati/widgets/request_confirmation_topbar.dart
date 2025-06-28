// ignore_for_file: must_be_immutable

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';

class RequestConfirmationTopbar extends StatelessWidget {
  RequestConfirmationTopbar({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 25,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: AppText(
            text: text,
            fontSize: context.mh * 0.02,
            fontFamily: 'nr',
            fontWeight: FontWeight.w600,
            color: AppColor.black(),
          ),
        ),
      ],
    );
  }
}

import 'dart:ui';

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/home/ui/creat_case_screen.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BurialRequestDialog extends StatelessWidget {
  const BurialRequestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(),
        shape: ShapeBorder.lerp(InputBorder.none, InputBorder.none, 10),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenPaddingHori, vertical: commonTopMargin),
          margin: EdgeInsets.symmetric(horizontal: screenPaddingHori),
          decoration: BoxDecoration(
            color: AppColor.white(),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: AppText(
                text: "Continue with the Burial Request",
                fontSize: heading2,
                fontWeight: FontWeight.w600,
                color: AppColor.black(),
                fontFamily: 'ns',
              )),
              SizedBox(
                height: commonHeightS,
              ),
              AppText(
                text: "Thank you for informing the Dubai Police.",
                fontSize: text1,
                textAlign: TextAlign.left,
                color: AppColor.grey(),
                fontFamily: 'nr',
              ),
              SizedBox(
                height: commonHeightS,
              ),
              AppText(
                text:
                    "When you're ready, we can guide you through the next steps for the burial process",
                fontSize: text1,
                textAlign: TextAlign.left,
                color: AppColor.grey(),
                fontFamily: 'nr',
              ),
              SizedBox(
                height: commonHeightM,
              ),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreatCaseScreen(),
                    ),
                  );
                },
                text: 'CONTINUE',
                textColor: AppColor.white(),
              ),
              SizedBox(
                height: commonHeight,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppText(
                    text: "No, I no longer want to continue this process",
                    fontSize: text1 - 1,
                    decoration: TextDecoration.underline,
                    textAlign: TextAlign.center,
                    color: AppColor.primary(),
                    fontFamily: 'ns',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

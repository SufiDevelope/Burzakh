import 'dart:ui';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/home/presentation/widgets/call_dialog.dart';
import 'package:burzakh/features/new_ui/home/ui/creat_case_screen.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/custom_button.dart';

class SelectRestingSheet extends StatelessWidget {
  const SelectRestingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: 20, horizontal: screenPaddingHori),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(AppAssets.closeIcon)),
              ],
            ),
            SizedBox(
              height: commonHeightM1,
            ),
            AppText(
              text: "Where is your Family Member Resting?",
              fontSize: context.mh * 0.020,
              fontWeight: FontWeight.w600,
              color: AppColor.black(),
              fontFamily: 'ns',
            ),
            AppText(
              text: "Select where they are, so we may assist you with care.",
              fontSize: context.mh * 0.016,
              textAlign: TextAlign.center,
              color: AppColor.grey(),
              fontFamily: 'nr',
            ),
            SizedBox(
              height: commonHeightM,
            ),
            BlocBuilder(
                bloc: documentCubit,
                builder: (_, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRadioButton(
                          isSelected: documentCubit.restingPlaceIndex == 0,
                          text: 'Hospital',
                          onTap: () {
                            documentCubit.getRestingPlaceIndex(0);
                          }),
                      SizedBox(
                        width: screenPaddingHori,
                      ),
                      CustomRadioButton(
                          isSelected: documentCubit.restingPlaceIndex == 1,
                          text: 'Home',
                          onTap: () {
                            documentCubit.getRestingPlaceIndex(1);
                          }),
                    ],
                  );
                }),
            SizedBox(
              height: commonHeightM1,
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                if (documentCubit.restingPlaceIndex == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreatCaseScreen(),
                      ));
                } else {
                  showDialog(
                    context: context,
                    barrierColor: AppColor.blurWhiteColor(),
                    builder: (context) => CallDialog(),
                  );
                }
                // Navigator.push(context, MaterialPageRoute(builder: (context) => PoliceApprovalScreen(),));
              },
              text: "CONTINUE",
              textColor: AppColor.white(),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

var documentCubit = DiContainer().sl<HomeCubit>();

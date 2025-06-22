import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/features/home/presentation/widgets/select_resting_sheet.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/custom_button.dart';
import '../../../new_ui/home/ui/creat_case_screen.dart';

class StartFirstTimeCase extends StatelessWidget {
  const StartFirstTimeCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: mdWidth(context) * 1,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: AppText(
                text: "Welcome. Begin here to request a dignified farewell.",
                fontSize: context.mh * 0.015,
                color: AppColor.greyLight(),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: AppText(
                text: "We’ll guide you through each burial step.",
                fontSize: context.mh * 0.015,
                color: AppColor.greyLight(),
              )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CustomElevatedButton(
            height: context.mh * 0.05,
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CreatCaseScreen(),));
              showModalBottomSheet(
                  context: context, builder: (context) => SelectRestingSheet());
            },
            text: "START A CASE",
            textColor: AppColor.white(),
            fontWeight: FontWeight.w600,
            fontSize: context.mh * 0.016,
          ),
        ],
      ),
    );
  }
}

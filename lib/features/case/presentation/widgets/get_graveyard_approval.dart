import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

// ignore: must_be_immutable
class GetGraveyardApproval extends StatelessWidget {
  GetGraveyardApproval({super.key,this.isCompleted=false,this.onTap});
  bool? isCompleted;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.symmetric(horizontal: commonHeightS,vertical: commonHeightS),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(commonHeightS),
          color: AppColor.lightBlueColor()
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(text: "Documents for Graveyard Approval",fontSize: heading3,color: AppColor.black(),fontFamily: 'ns',),
                  ],
              ),
             ],
          ),
          SizedBox(height: commonHeightS,),
          CustomElevatedButton(onPressed: onTap??(){}, text: 'START')
        ],
      ),
    );
  }
}

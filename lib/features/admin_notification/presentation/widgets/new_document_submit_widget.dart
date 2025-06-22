import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class NewDocumentSubmitWidget extends StatelessWidget {
  const NewDocumentSubmitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: commonTopMargin),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.lightBlueColor()
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(text: "! ",fontSize: text1,color: AppColor.red(),fontFamily: 'ns',),
              AppText(text: "New Document Submission",fontSize: text1,color: AppColor.black(),fontFamily: 'ns',),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            children: [
              Expanded(child: AppText(text: "A new case has been started. Dubai police have received a new burial request. Review the uploaded documents to begin.",fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
            ],
          ),
        ],
      ),
    );
  }
}

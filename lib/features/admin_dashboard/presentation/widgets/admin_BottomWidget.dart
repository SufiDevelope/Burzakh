// ignore_for_file: must_be_immutable

import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/dashboard/presentation/controller/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../core/app/di_container.dart';
import '../../../../widgets/app_text.dart';
import '../controller/cubit.dart';

class AdminBottomWidget extends StatelessWidget {
  AdminBottomWidget({super.key,required this.index,required this.text,required this.icon,required this.isSelected});
  String icon;
  String text;
  bool isSelected;
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: (){
        dashboardCubit.getIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21,vertical: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: !isSelected?Colors.transparent:AppColor.primary().withOpacity(.1)),
            child: SvgPicture.asset(icon,color: !isSelected?AppColor.grey():AppColor.primary()),),
          AppText(text: text,fontSize: 14,color:  !isSelected?AppColor.grey():AppColor.primary(),fontFamily: !isSelected?'nr':'ns',fontWeight:  !isSelected?FontWeight.w400:FontWeight.w600,)
        ],
      ),
    );
  }

  var dashboardCubit=DiContainer().sl<AdminDashboardCubit>();

}

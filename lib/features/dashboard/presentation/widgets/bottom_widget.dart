// ignore_for_file: must_be_immutable

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/dashboard/presentation/controller/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../core/app/di_container.dart';
import '../../../../widgets/app_text.dart';

class BottomWidget extends StatelessWidget {
  BottomWidget({
    super.key,
    required this.index,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });
  String icon;
  String text;
  bool isSelected;
  int index;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: !isSelected
                    ? Colors.transparent
                    : Color(0xffaf8646).withOpacity(.1)),
            child: SvgPicture.asset(icon,
                color: !isSelected ? AppColor.grey() : Color(0xffaf8646),
                height: context.mh * 0.017,
                width: context.mw * 0.017),
          ),
          AppText(
            text: text,
            fontSize: context.mh * 0.013,
            overflow: TextOverflow.ellipsis,
            color: !isSelected ? AppColor.grey() : Color(0xffaf8646),
            fontFamily: !isSelected ? 'nr' : 'ns',
            fontWeight: !isSelected ? FontWeight.w400 : FontWeight.w600,
          )
        ],
      ),
    );
  }

  var dashboardCubit = DiContainer().sl<DashboardCubit>();
}

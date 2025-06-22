import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/di_container.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';
import '../../../home/presentation/controller/cubit.dart';

class RecentActivitySection extends StatefulWidget {
  const RecentActivitySection({super.key});

  @override
  State<RecentActivitySection> createState() => _RecentActivitySectionState();
}

class _RecentActivitySectionState extends State<RecentActivitySection> {
  @override
  Widget build(BuildContext context) {
    final currentLocale = EasyLocalization.of(context)!.locale;
    return BlocBuilder(
        bloc: _homeCubit,
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Recent Activity',
                    fontWeight: FontWeight.bold,
                    fontSize: context.mh * 0.017,
                  ),
                  SizedBox(),
                ],
              ),
              0.01.ph(context),
              _homeCubit.recentActivityList.isEmpty
                  ? Container(
                      alignment: Alignment.topLeft,
                      width: mdWidth(context) * 1,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: AppText(
                        text: "You haven’t performed any actions yet.",
                        fontSize: context.mh * 0.013,
                        color: AppColor.greyLight(),
                      ))
                  : Column(
                      children: [
                        ...List.generate(
                          _homeCubit.recentActivityList.length,
                          (index) {
                            var model = _homeCubit.recentActivityList[index];
                            bool isLast = false;
                            isLast = _homeCubit.recentActivityList.length ==
                                index + 1;
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: isLast ? .001 : .6,
                                          color: AppColor.greyLight1())),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        _homeCubit.recentActivityList.length ==
                                                1
                                            ? 8
                                            : isLast
                                                ? 0
                                                : index == 0
                                                    ? 8
                                                    : 0),
                                    topRight: Radius.circular(
                                        _homeCubit.recentActivityList.length ==
                                                1
                                            ? 8
                                            : isLast
                                                ? 0
                                                : index == 0
                                                    ? 8
                                                    : 0),
                                    bottomRight:
                                        Radius.circular(isLast ? 8 : 0),
                                    bottomLeft: Radius.circular(isLast ? 8 : 0),
                                  )),
                              child: ListTile(
                                leading: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircleAvatar(
                                    backgroundColor: AppColor.lightGreen,
                                    child: Icon(
                                      Icons.check,
                                      color: AppColor.green(),
                                      size: 18,
                                    ),
                                  ),
                                ),
                                title: AppText(
                                  text: model.getTranslatedName(
                                      currentLocale.languageCode),
                                  fontFamily: 'ns',
                                  fontSize: 14,
                                ),
                                subtitle: AppText(
                                  text: model.getTranslatedStatus(
                                      currentLocale.languageCode),
                                  fontSize: 10,
                                ),
                                trailing: AppText(
                                  text: model.timeAgo,
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
            ],
          );
        });
  }
}

var _homeCubit = DiContainer().sl<HomeCubit>();

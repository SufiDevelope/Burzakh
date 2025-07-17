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
    final currentLocale = EasyLocalization.of(context)?.locale;
    final homeCubit = DiContainer().sl<HomeCubit>();
    
    return BlocBuilder(
        bloc: homeCubit,
        builder: (context, state) {
          final recentActivityList = homeCubit.recentActivityList ?? [];
          
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
                  const SizedBox(),
                ],
              ),
              0.01.ph(context),
              recentActivityList.isEmpty
                  ? Container(
                      alignment: Alignment.topLeft,
                      width: mdWidth(context) * 1,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: AppText(
                        text: "You haven't performed any actions yet.",
                        fontSize: context.mh * 0.013,
                        color: AppColor.greyLight(),
                      ))
                  : Column(
                      children: [
                        ...List.generate(
                          recentActivityList.length,
                          (index) {
                            final model = recentActivityList[index];
                            if (model == null) {
                              return const SizedBox.shrink();
                            }
                            
                            bool isLast = recentActivityList.length == index + 1;
                            
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: isLast ? .001 : .6,
                                          color: AppColor.greyLight1())),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        recentActivityList.length == 1
                                            ? 8
                                            : isLast
                                                ? 0
                                                : index == 0
                                                    ? 8
                                                    : 0),
                                    topRight: Radius.circular(
                                        recentActivityList.length == 1
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
                                      currentLocale?.languageCode ?? 'en'),
                                  fontFamily: 'ns',
                                  fontSize: 14,
                                ),
                                subtitle: AppText(
                                  text: model.getTranslatedStatus(
                                      currentLocale?.languageCode ?? 'en'),
                                  fontSize: 10,
                                ),
                                trailing: AppText(
                                  text: model.timeAgo ?? '',
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
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/dashboard/presentation/controller/cubit.dart';
import 'package:burzakh/features/dashboard/presentation/widgets/bottom_widget.dart';
import 'package:burzakh/features/documnets/presentation/page/document_page.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/home/presentation/page/home_screen.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/close_app_sheet.dart';
import '../../../case/presentation/page/case_approved_screen.dart';
import '../../../emirati_svcs/presentation/page/emirati_svcs_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
      _homeCubit.getUserCases();

    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        showModalBottomSheet(context: context, backgroundColor: Colors.transparent,barrierColor: AppColor.blurWhiteColor(),builder: (context) => CloseAppSheet(),);
        return false;
      },
      child: BlocBuilder(
        bloc: dashboardCubit,
        builder: (context,state) {
          return Scaffold(
            backgroundColor: AppColor.bgPrimary(),
            body: dashboardCubit.screenIndex==0?HomeScreen():dashboardCubit.screenIndex==1?EmiratiSvcsScreen():DocumentScreen(),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: AppColor.grey()))),
              padding: EdgeInsets.symmetric(vertical: appBottomMargin-10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: BottomWidget(text: 'Home', icon: AppAssets.homeIcon, isSelected:dashboardCubit.screenIndex==0,index: 0,)),
                  Expanded(child: BottomWidget(text: 'Emirati Svcs', icon: AppAssets.emiratiSvcIcon, isSelected: dashboardCubit.screenIndex==1,index: 1)),
                  Expanded(child: BottomWidget(text: 'Islamic Edu.', icon: AppAssets.islamicEduIcon, isSelected: dashboardCubit.screenIndex==2,index: 2)),
                  Expanded(child: BottomWidget(text: 'Documents', icon: AppAssets.documentIcon, isSelected: dashboardCubit.screenIndex==3,index: 3)),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  var dashboardCubit=DiContainer().sl<DashboardCubit>();
  var _homeCubit=DiContainer().sl<HomeCubit>();
}

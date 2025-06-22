import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/admin_dashboard/presentation/controller/cubit.dart';
import 'package:burzakh/features/documnets/presentation/page/document_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../admin_home/presentation/page/admin_home.dart';
import '../../../emirati_svcs/presentation/page/emirati_svcs_screen.dart';
import '../widgets/admin_BottomWidget.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: adminDashboardCubit,
        builder: (context,state) {
          return Scaffold(
            body: adminDashboardCubit.screenIndex==0?AdminHome():AdminHome(),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: AppColor.grey()))),
              padding: EdgeInsets.symmetric(vertical: appBottomMargin-10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdminBottomWidget(text: 'Home', icon: AppAssets.homeIcon, isSelected:adminDashboardCubit.screenIndex==0,index: 0,),
                  SizedBox(),
                  AdminBottomWidget(text: 'History', icon: AppAssets.historyIcon, isSelected: adminDashboardCubit.screenIndex==1,index: 1),
                ],
              ),
            ),
          );
        }
    );
  }

  var adminDashboardCubit=DiContainer().sl<AdminDashboardCubit>();
}

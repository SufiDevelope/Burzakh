import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/case/presentation/page/case_approved_screen.dart';
import 'package:burzakh/features/home/presentation/widgets/case_widget.dart';
import 'package:burzakh/features/home/presentation/widgets/home_case_shimmer.dart';
import 'package:burzakh/features/home/presentation/widgets/home_top_bar.dart';
import 'package:burzakh/features/home/presentation/widgets/select_resting_sheet.dart';
import 'package:burzakh/features/home/presentation/widgets/start_first_time_case.dart';
import 'package:burzakh/features/home/presentation/widgets/video_call_required_widget.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/app/di_container.dart';
import '../../../notification/presentation/page/notification_screen.dart';
import '../controller/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: (){
          showModalBottomSheet(context: context, backgroundColor: Colors.transparent,barrierColor: AppColor.blurWhiteColor(),builder: (context) => SelectRestingSheet(),);
        },
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(23),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primary()
          ),
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
      backgroundColor: AppColor.bgPrimary(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(screenPaddingHori),
            child: BlocBuilder(
              bloc:_homeCubit ,
              builder: (context,state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeTopBar(notificationTap:  () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen(),));
                    },),
                    VideoCallRequiredWidget(),
                    _homeCubit.isFetchingCases? HomeCaseShimmer(): _homeCubit.caseList.isEmpty? StartFirstTimeCase(): Column(
                      children: List.generate(_homeCubit.caseList.length, (index){
                        var model=_homeCubit.caseList[index];
                       return  CaseWidget(model: model,onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CaseApprovedScreen(caseModel: model,),));
                        },);
                      }
                        ,),
                    ),
                    SizedBox(height: 70,),
                    ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}

var _homeCubit=DiContainer().sl<HomeCubit>();


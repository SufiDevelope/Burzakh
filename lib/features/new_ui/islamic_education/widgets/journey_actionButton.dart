// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/theme/AppColor.dart';

class JourneyActionbutton extends StatelessWidget {
   JourneyActionbutton({super.key,required this.searchTap,required this.timeLineTap,required this.downloadTap,});
 VoidCallback searchTap;
VoidCallback timeLineTap;
VoidCallback downloadTap;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 5),
      // width: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap:searchTap ,
            child: Container(
              margin: EdgeInsets.all(5),
              child: Icon(Icons.search,size: 18,color: AppColor.greyLight(),),
            ),
          ),
          SizedBox(width: 5,),
          InkWell(
            onTap: timeLineTap,
            child: Container(
              margin: EdgeInsets.all(5),
              child:Icon(Icons.file_present_sharp,size: 18,color: AppColor.greyLight(),),
            ),
          ),
          SizedBox(width: 5,),
          // InkWell(
          //   onTap:  downloadTap,
          //   child: Container(
          //     margin: EdgeInsets.all(5),
          //     child:  Icon(Icons.file_download_outlined,size: 18,color: AppColor.greyLight(),),
          //   ),
          // ),
        ],
      ),
    );
  }
}

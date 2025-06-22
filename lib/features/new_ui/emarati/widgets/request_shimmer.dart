import 'package:burzakh/constants/media_query.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/AppColor.dart';

class RequestShimmer extends StatelessWidget {
  const RequestShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: mdWidth(context)*1,
        height: 100,
        decoration: BoxDecoration(
          color: AppColor.greyLight1(),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
    );
  }
}

import 'package:burzakh/constants/media_query.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/AppColor.dart';

class HomeCaseShimmer extends StatelessWidget {
  const HomeCaseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        return Shimmer.fromColors(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            width: mdWidth(context)*1,
            height: 150,
            decoration: BoxDecoration(
              color: AppColor.greyLight1(),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        );
      },),
    );
  }
}

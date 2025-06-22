import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class JourneyTitleWidget extends StatelessWidget {
  const JourneyTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Journey After Death'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Wrap(
          children: [
            Text(
              'From the moment of passing to life in'.tr(),
              style: TextStyle(
                fontSize: 11,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 2,),
            Text(
              'Barzakh'.tr(),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.teal[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

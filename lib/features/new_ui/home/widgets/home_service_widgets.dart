import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeServiceWidgets extends StatelessWidget {
  const HomeServiceWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          AppText(text: 'hello'),
          CustomElevatedButton(onPressed: (){}, text: 'submit')
        ],
      ),
    );
  }
}

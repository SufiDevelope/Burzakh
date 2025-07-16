import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/settings/widgets/recent_chat_widget.dart';
import 'package:burzakh/features/new_ui/settings/widgets/setting_language_widget.dart';
import 'package:burzakh/features/new_ui/settings/widgets/setting_support_widget.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.transparent,
      backgroundColor: Color(0xfffcf7f3),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 20, 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(text:
                      "Settings",
                        fontSize: context.mh * 0.024,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black(),
                      fontFamily: 'ns',
                    ),
                  ),
                ),

                SettingLanguageWidget(),
                0.02.ph(context),

                SettingSupportWidget(),
                0.02.ph(context),


                RecentChatWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

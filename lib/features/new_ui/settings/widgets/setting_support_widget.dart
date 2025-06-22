import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/settings/ui/choose_support_type_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';

class SettingSupportWidget extends StatelessWidget {
  const SettingSupportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
// Support Options
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
          child:AppText(text:
          "Support",
            fontSize: context.mh * 0.017,
            fontWeight: FontWeight.w500,
            color: Colors.grey[500],
            fontFamily: 'nm',
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseSupportTypeScreen(),));
              },
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.support_agent,
                            size: 16,
                            color: Colors.blue[500],
                          ),
                        ),
                        0.025.pw(context),
                        AppText(text:
                        "Choose Support Type",
                          fontSize: context.mh * 0.014,
                          color: AppColor.black(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: Colors.grey[500],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

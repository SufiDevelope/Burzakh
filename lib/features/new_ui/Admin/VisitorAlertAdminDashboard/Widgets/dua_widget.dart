import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Controller/visitor_alert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class DuaWidget extends StatelessWidget {
  const DuaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final VisitorAlertController controller =
        Get.find<VisitorAlertController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.05),
      child: Container(
        width: context.mw * 0.9,
        decoration: BoxDecoration(
          color: Color(0xFFf5f3f0),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(context.mw * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '🤲',
                        style: TextStyle(fontSize: context.mh * 0.025),
                      ),
                      0.02.pw(context),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringTranslateExtension("Du'a for the ").tr(),
                            style: TextStyle(
                              fontSize: context.mh * 0.02,
                              color: Color(0xFFad8443),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            StringTranslateExtension("Deceased").tr(),
                            style: TextStyle(
                              fontSize: context.mh * 0.02,
                              color: Color(0xFFad8443),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(() => Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.mw * 0.03,
                              vertical: context.mh * 0.008,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFad8443),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '${controller.currentIndex.value + 1}/10',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.mh * 0.015,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      0.02.pw(context),
                      GestureDetector(
                        onTap: () {
                          // Close action
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: context.mh * 0.025,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Content
            Obx(() {
              final currentDua = controller.duas[controller.currentIndex.value];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: context.mw * 0.04),
                padding: EdgeInsets.all(context.mw * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Arabic Text
                    Text(
                      currentDua.arabicText,
                      style: TextStyle(
                        fontSize: context.mh * 0.022,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        height: 1.8,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    0.02.ph(context),

                    // Transliteration
                    Text(
                      currentDua.transliteration,
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    0.02.ph(context),

                    // English Translation
                    Text(
                      currentDua.englishTranslation,
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    0.03.ph(context),

                    // Category and Source
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.mw * 0.03,
                            vertical: context.mh * 0.008,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFf0e6d2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            StringTranslateExtension(currentDua.category).tr(),
                            style: TextStyle(
                              fontSize: context.mh * 0.014,
                              color: Color(0xFFad8443),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              StringTranslateExtension('Source: ').tr(),
                              style: TextStyle(
                                fontSize: context.mh * 0.014,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              StringTranslateExtension('${currentDua.source}').tr(),
                              style: TextStyle(
                                fontSize: context.mh * 0.014,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),

            // Bottom Buttons
            Container(
              padding: EdgeInsets.all(context.mw * 0.04),
              child: Row(
                children: [
                  // Recited Button
                  Obx(() => Expanded(
                        child: GestureDetector(
                          onTap: controller.toggleRecited,
                          child: Container(
                            width: context.mw * 0.3,
                            height: context.mh * 0.05,
                            decoration: BoxDecoration(
                              color: controller.isRecited.value
                                  ? Color(0xFFad8443)
                                  : Color(0xFFd4c4a8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    StringTranslateExtension('Recited').tr(),
                                    style: TextStyle(
                                      fontSize: context.mh * 0.014,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (controller.isRecited.value) ...[
                                    0.01.pw(context),
                                    Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: context.mh * 0.02,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),

                  0.02.pw(context),

                  // Next Du'a Button
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.nextDua,
                      child: Container(
                        width: context.mw * 0.3,
                        height: context.mh * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFd4c4a8),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            StringTranslateExtension('Next Dua').tr(),
                            style: TextStyle(
                              fontSize: context.mh * 0.014,
                              color: Color(0xFFad8443),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),

                  0.02.pw(context),

                  // // View All Du'as Button
                  // GestureDetector(
                  //   onTap: () {
                  //     // Show all duas
                  //   },
                  //   child: Container(
                  //     width: context.mw * 0.25,
                  //     height: context.mh * 0.05,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFFad8443),
                  //       borderRadius: BorderRadius.circular(12),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black.withOpacity(0.1),
                  //           blurRadius: 4,
                  //           offset: Offset(0, 2),
                  //         ),
                  //       ],
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         'View All Duas',
                  //         style: TextStyle(
                  //           fontSize: context.mh * 0.014,
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:burzakh/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/under_construction_dialog.dart';

class DocumentProgressScreen extends StatelessWidget {
  const DocumentProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppColor.bgGradient
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          title: AppText(
            text: "Documents & Progress",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColor.black(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomElevatedButton(
                text: "Start Services",
                height: 36,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                onPressed: () {},
                bgColor: AppColor.primary(),
                width: 140,
              ),
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.white(),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AppText(
                        //   text: "Required Documents",
                        //   fontWeight: FontWeight.bold,
                        //   fontSize: 16,
                        //   color: AppColor.black(),
                        // ),
                        const SizedBox(height: 20),
                        _documentItem("Death Notification", "Verified", Icons.description, AppColor.lightGreen1, AppColor.green()),
                        const SizedBox(height: 12),
                        _documentItem("Hospital Report", "Verified", Icons.local_hospital, AppColor.lightGreen1, AppColor.green()),
                        const SizedBox(height: 12),
                        _documentItem("EID & Passport", "Pending", Icons.badge, AppColor.lightOrange1, AppColor.orange),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.uploadIcon,color: AppColor.blue,),
                            SizedBox(width: 5,),
                            AppText(
                              text: "Emirates ID",
                              color: AppColor.blue,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),

                            Container(margin: EdgeInsets.symmetric(horizontal: 10),width: .5,height: 30,color: AppColor.greyLight1(),),
                            SvgPicture.asset(AppAssets.uploadIcon,color: AppColor.blue,),
                            SizedBox(width: 5,),
                            AppText(
                              text: "Passport",
                              color: AppColor.blue,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _documentItem("Police Clearance", "Pending", Icons.security, AppColor.lightOrange1, AppColor.orange,
                            subtitle: "Dubai Police"),
                        const SizedBox(height: 6),
                        InkWell(
                          onTap: () {
                            showDialog(context: context, builder: (context) => UnderConstructionDialog(),);

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppAssets.clockIcon,color: AppColor.blue,),
                              SizedBox(width: 5,),
                              AppText(
                                text: "Request Video Call",
                                color: AppColor.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        _documentItem("Burial Permit", "Not Started", Icons.lock, AppColor.grey().withOpacity(0.1), AppColor.grey(),
                            subtitle: "Dubai Municipality"),


                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.white(),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Header Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: "Burial Process",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColor.lightOrange,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: AppText(
                                text: "In Progress",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.yellowLight(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        /// Step 1 - Death Notification
                        _buildStepItem(
                          icon: Icons.check_circle,
                          iconColor: AppColor.darkGreen,
                          title: "Death Notification",
                          subtitle:
                          "Document verified and approved by authorities",
                          statusText: "Completed on May 17, 2025, at 9:15 AM",
                          statusColor: AppColor.lightGreen1,
                        ),

                        /// Step 2 - Hospital Report
                        _buildStepItem(
                          icon: Icons.check_circle,
                          iconColor: AppColor.darkGreen,
                          title: "Hospital Report",
                          subtitle: "Medical documentation verified",
                          statusText: "Completed on May 17, 2025, at 10:30 AM",
                          statusColor: AppColor.lightGreen1,
                        ),

                        /// Step 3 - EID & Passport
                        _buildStepItem(
                          icon: Icons.error_outline,
                          iconColor: AppColor.yellow(),
                          title: "EID & Passport",
                          subtitle: "Required for identity verification",
                          statusText: "Pending submission",
                          statusColor: AppColor.lightOrange,
                        ),

                        /// Step 4 - Police Verification
                        _buildStepItem(
                          icon: Icons.error_outline,
                          iconColor: AppColor.yellow(),
                          title: "Police Verification",
                          subtitle:
                          "Required video call with Dubai Police officer",
                          statusText: "Scheduled for 4:30 PM today",
                          statusColor: AppColor.lightOrange,
                        ),

                        /// Step 5 - Burial Permit
                        _buildStepItem(
                          iconColor: AppColor.greyLight(),
                          title: "Burial Permit",
                          burialPermitText: '5',
                          subtitle:
                          "Issued after police verification is complete",
                          statusText: "",
                          statusColor: AppColor.greyLight(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Padding(padding: EdgeInsets.all(16),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColor.white(),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        AppText(text: "\"O reassured soul, return to your Lord,\nwell-pleased and pleasing [to Him]. Enter among My servants, and enter My\n Paradise.\"",textAlign: TextAlign.center,color: AppColor.grey(),fontFamily: 'ni',),
                        SizedBox(height: 10,),
                        AppText(text: "— Surah Al-Fajr 89:27-30",textAlign: TextAlign.center,color: AppColor.greyLight1(),fontWeight: FontWeight.w100,fontSize: 13,),
                      ],
                    ),
                  ),),
                SizedBox(height: 25,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Reusable Document Item
  Widget _documentItem(String title, String status, IconData icon, Color bgColor, Color statusColor, {String? subtitle}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:12,vertical: 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  statusColor.withOpacity(0.1)
              ),
              child: Icon(icon, color: statusColor.withOpacity(.5))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black(),
                ),
                if (subtitle != null)
                  AppText(
                    text: subtitle,
                    fontSize: 12,
                    color: AppColor.grey(),
                  ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(7),
            ),
            child: AppText(
              text: status,
              fontSize: 12,
              color: statusColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }


  Widget _buildStepItem({
    IconData? icon,
    String? burialPermitText,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String statusText,
    required Color statusColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Icon and line
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color:burialPermitText!=null? iconColor.withOpacity(.2):iconColor,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: burialPermitText!=null?1.5:0,color: burialPermitText!=null?iconColor: Colors.white)
                    ),
                    width: 40,
                    alignment: Alignment.center,
                    height: 30,
                    child:icon!=null? Icon(icon, color: Colors.white, size: 20):AppText(text: burialPermitText??"")),
                SizedBox(height: 8,),
                Expanded(
                  child: Container(
                    width: 2,
                    child: Column(
                      children: [],
                    ),
                    color: AppColor.greyLight1(),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),

            /// Text content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: subtitle,
                    fontSize: 13,
                    color: AppColor.grey(),
                  ),
                  if (statusText.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AppText(
                        text: statusText,
                        fontSize: 12,
                        color: iconColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
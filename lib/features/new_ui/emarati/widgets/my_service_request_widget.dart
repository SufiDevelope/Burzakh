// ignore_for_file: must_be_immutable

import 'package:burzakh/core/theme/AppColor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

class MyServiceRequestWidget extends StatelessWidget {
   MyServiceRequestWidget({super.key,required this.isApproved,this.viewDetail,this.isLoading,this.onCancel, required this.heading, required this.subtext, required this.refrence, required this.requestedDate, required this.scheduleDate, required this.isLocation, required this.location,});
int isApproved;
final String heading;
final String subtext;
final String refrence;
final String requestedDate;
final String scheduleDate;
final bool isLocation;
final String location;
VoidCallback? onCancel;
VoidCallback? viewDetail;
bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.home_outlined,
                    size: 20,
                    color: Colors.blue[500],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                  heading.tr(),
                                  style: TextStyle(
                                    fontFamily: 'ns',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.black(),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  subtext.tr(),
                                  style: TextStyle(
                                    fontFamily: 'nr',
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: isApproved==1
                                  ? const Color(0x1434C759)
                                  : isApproved==2
                                  ? const Color(0x14FF3B30)
                                  : const Color(0x14FF9500),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: AppText(text:
                              isApproved==1
                                  ? 'Approved'
                                  : isApproved==2
                                  ? 'Rejected'
                                  : 'Pending',
                                fontFamily: 'nm',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isApproved==1
                                    ? const Color(0xFF34C759)
                                    : isApproved==2
                                    ? const Color(0xFFFF3B30)
                                    : const Color(0xFFFF9500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey[100]!,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Reference No.".tr(),
                                        style: TextStyle(
                                          fontFamily: 'nr',
                                          fontSize: 12,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        refrence.tr(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'nr',
                                          color: Color(0xFF4B5563),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date Requested".tr(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'nr',
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                       Text(
                                      requestedDate .tr() ,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF4B5563),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                       isLocation? "Location".tr():"Sign Text".tr(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'nr',
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        location.tr(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'nr',
                                          color: Color(0xFF4B5563),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Scheduled Date".tr(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'nr',
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        scheduleDate.tr(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'nr',
                                          color: Color(0xFF4B5563),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: viewDetail,
                    icon: Icon(
                      Icons.edit_note,
                      size: 16,
                      color: Colors.blue[600],
                    ),
                    label: Text(
                      "View Details".tr(),
                      style: TextStyle(
                        fontFamily: 'ns',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue[600],
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
                // // Container(width: 1, height: 32, color: Colors.grey[200]),
                // // if (isApproved==0)
                // //   Expanded(
                // //     child: TextButton.icon(
                // //       onPressed: onCancel,
                // //       icon: Icon(
                // //         Icons.close,
                // //         size: 16,
                // //         color: Colors.red[600],
                // //       ),
                // //       label: Text(
                // //        isLoading==true? "Wait..".tr():"Cancel".tr(),
                // //         style: TextStyle(
                // //           fontSize: 14,
                // //           fontFamily: 'ns',
                // //           fontWeight: FontWeight.w500,
                // //           color: Colors.red[600],
                // //         ),
                // //       ),
                // //       style: TextButton.styleFrom(
                // //         padding: const EdgeInsets.symmetric(vertical: 8),
                // //       ),
                // //     ),
                // //   )
                // else
                //   const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

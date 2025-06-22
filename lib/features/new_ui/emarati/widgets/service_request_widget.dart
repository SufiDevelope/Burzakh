// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/emirati_svcs/presentation/widgets/sign_age_sheet.dart';
import 'package:burzakh/features/new_ui/emarati/ui/rta_service_request_Screen.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

class ServiceRequestWidget extends StatelessWidget {
  ServiceRequestWidget(
      {super.key,
      required this.approved,
      required this.text1,
      required this.ref,
      required this.emiratiScvCubit});
  String approved;
  String text1;
  String ref;
  final emiratiScvCubit;
  @override
  Widget build(BuildContext context) {
    log(approved);
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                      Icons.business_center_outlined,
                      size: 20,
                      color: Colors.blue[500],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: text1,
                        fontSize: context.mh * 0.014,
                        fontFamily: 'ns',
                        fontWeight: FontWeight.w500,
                        color: AppColor.black(),
                      ),
                      const SizedBox(height: 4),
                      AppText(
                        text: "Ref: $ref",
                        fontSize: context.mh * 0.012,
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: approved == 1
                      ? const Color(0x1434C759)
                      : approved == 2
                          ? const Color(0x14FF3B30)
                          : const Color(0x14FF9500),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: AppText(
                  text: approved,
                  fontSize: context.mh * 0.012,
                  color: approved == 1
                      ? const Color(0xFF34C759)
                      : approved == 2
                          ? const Color(0xFFFF3B30)
                          : const Color(0xFFFF9500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

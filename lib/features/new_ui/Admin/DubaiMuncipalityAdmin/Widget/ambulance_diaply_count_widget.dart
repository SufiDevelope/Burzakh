import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/status_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/Response/status.dart';

class AmbulanceStatusCardWidget extends StatelessWidget {
  final DubaiController controller;
  const AmbulanceStatusCardWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.rxRequestStatusForAllDubaiAmb.value) {
        case Status.loading:
          return Center(child: CircularProgressIndicator());
        case Status.completed:
          return Row(
            children: [
              GenericStatusCardWidget(
                title: "Active Ambulance",
                count: controller.ambulanceModel.value.counts?.activeCount
                        .toString() ??
                    "",
                statusText: "",
                lastUpdated: DateFormat("dd MMM yyyy").format(DateTime.now()),
                icon: Icons.local_hospital_outlined,
                primaryColor: dashboardcolor,
                backgroundColor: Colors.grey[50],
                progressValue: 0.6,
                onTap: () {},
                size: context.mh * 0.033,
                containerheight: context.mw * 0.2,
                containerwidth: context.mw * 0.2,
                borderRadius: 18,
                isDubaiAdmin: true,
              ),
              GenericStatusCardWidget(
                title: "Dispatched Ambulance",
                count: controller.ambulanceModel.value.counts?.dispatchedCount
                        .toString() ??
                    "",
                statusText: "",
                lastUpdated: DateFormat("dd MMM yyyy").format(DateTime.now()),
                icon: Icons.local_hospital,
                primaryColor: dashboardcolor,
                backgroundColor: Colors.grey[50],
                progressValue: 0.6,
                onTap: () {},
                size: context.mh * 0.033,
                containerheight: context.mw * 0.2,
                containerwidth: context.mw * 0.2,
                borderRadius: 18,
                isDubaiAdmin: true,
              ),
              GenericStatusCardWidget(
                title: "Maintenance Ambulance",
                count: controller.ambulanceModel.value.counts?.maintenanceCount
                        .toString() ??
                    "",
                statusText: "",
                lastUpdated: DateFormat("dd MMM yyyy").format(DateTime.now()),
                icon: Icons.local_hospital_outlined,
                primaryColor: dashboardcolor,
                backgroundColor: Colors.grey[50],
                progressValue: 0.6,
                onTap: () {},
                size: context.mh * 0.033,
                containerheight: context.mw * 0.2,
                containerwidth: context.mw * 0.2,
                borderRadius: 18,
                isDubaiAdmin: true,
              ),
            ],
          );

        case Status.error:
          return Text("Error Loading Data");
        default:
          return SizedBox();
      }
    });
  }
}

import 'package:burzakh/features/new_ui/Admin/MasterAdmin/super_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/Response/status.dart';

class ViewAllCases extends StatefulWidget {
  ViewAllCases({super.key});

  @override
  State<ViewAllCases> createState() => _ViewAllCasesState();
}

class _ViewAllCasesState extends State<ViewAllCases> {
  final SuperAdminController controller = Get.put(SuperAdminController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllCases();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('All Cases'),
        backgroundColor: const Color(0xff2d4159),
        elevation: 1,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height * 0.022,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            switch (controller.rxRequestStatusForAllCases.value) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());

              case Status.error:
                return const Center(child: Text("Error"));

              case Status.completed:
                if (controller.isLoadingForDelete.value) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.casesModel.value.data?.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final caseItem = controller.casesModel.value.data?[index];

                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              // Case Icon/Avatar
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff596e84),
                                      Color(0xff617890),
                                      Color(0xff2d4159),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    caseItem?.nameOfDeceased!
                                            .substring(0, 1)
                                            .toUpperCase() ??
                                        "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Case Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      caseItem?.nameOfDeceased ?? "",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF1E293B),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.005),
                                    Text(
                                      "${caseItem?.age ?? ""} . ${caseItem?.gender ?? ""}",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.013,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Status Badge
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.005,
                                ),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(
                                          caseItem?.caseStatus ?? "")
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: _getStatusColor(
                                            caseItem?.caseStatus ?? "")
                                        .withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  caseItem?.caseStatus ?? "",
                                  style: TextStyle(
                                    color: _getStatusColor(
                                        caseItem?.caseStatus ?? ""),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.012,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),

                              // Delete Icon
                              InkWell(
                                onTap: () {
                                  controller.deleteCaseById(
                                    caseItem?.id ?? "",
                                  );
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red[400],
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );

              default:
                return const Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'closed':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }
}

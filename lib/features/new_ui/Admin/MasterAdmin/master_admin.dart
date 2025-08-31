import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/MasterAdmin/super_admin_controller.dart';
import 'package:burzakh/features/new_ui/Admin/MasterAdmin/view_all_casses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class MasterAdmin extends StatefulWidget {
  final String name;
  const MasterAdmin({super.key, required this.name});

  @override
  State<MasterAdmin> createState() => _MasterAdminState();
}

class _MasterAdminState extends State<MasterAdmin> {
  final controller = Get.put(SuperAdminController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    void _showLogoutBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.all(context.mw * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Bottom sheet handle
                Container(
                  width: context.mw * 0.12,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                0.03.ph(context),

                // Profile section
                Container(
                  width: context.mw * 0.2,
                  height: context.mw * 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xFF64748B),
                    borderRadius: BorderRadius.circular(context.mw * 0.1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      widget.name[0].toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.mh * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                0.02.ph(context),

                // Admin name
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: context.mh * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                0.01.ph(context),

                // Role
                Text(
                  StringTranslateExtension('Admin').tr(),
                  style: TextStyle(
                    fontSize: context.mh * 0.016,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                0.03.ph(context),

                // Divider
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
                0.02.ph(context),

                // Logout button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await documentCubit.logOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BurzakhEnhancedLogin(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF64748B),
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: context.mh * 0.015),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.logout,
                          size: 20,
                          color: Colors.white,
                        ),
                        0.02.pw(context),
                        Text(
                          StringTranslateExtension('Logout').tr(),
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                0.02.ph(context),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff596e84),
                  Color(0xff617890),
                  Color(0xff2d4159),
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(context.mw * 0.04),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Master Admin',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.mh * 0.022,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              ),
                            ),
                            SizedBox(height: context.mh * 0.005),
                            Text(
                              'User Management Dashboard',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: context.mh * 0.014,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              _showLogoutBottomSheet(context);
                            },
                            icon: Icon(
                              Icons.logout_rounded,
                              color: Colors.white,
                              size: context.mh * 0.02,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.mh * 0.025),

                    // Stats Cards Row
                    Obx(() {
                      return Row(
                        children: [
                          _buildStatCard(
                            context,
                            'Admins',
                            "${controller.model.value.userCount ?? 0}",
                            Icons.admin_panel_settings_outlined,
                            const Color(0xFFEF4444),
                          ),
                          SizedBox(width: context.mw * 0.03),
                          _buildStatCard(
                            context,
                            'Active',
                            "${controller.model.value.userCount ?? 0}",
                            Icons.verified_user_outlined,
                            const Color(0xFF10B981),
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ),
            ),
          ),

          // Search and Filter Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(context.mw * 0.04),
            child: Column(
              children: [
                // Search Bar
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE2E8F0),
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            controller.filterUser(value);
                          },
                          decoration: InputDecoration(
                            hintText: 'Search users by name or email...',
                            hintStyle: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: context.mh * 0.016,
                            ),
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: Color(0xFF64748B),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: context.mw * 0.04,
                              vertical: context.mh * 0.015,
                            ),
                          ),
                        ),
                      ),
                    ),
                    0.02.pw(context),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewAllCases(),
                            ));
                      },
                      child: Container(
                        width: context.mw * 0.3,
                        height: context.mw * 0.1,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE2E8F0),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "View Casess",
                            style: TextStyle(
                              fontSize: context.mh * 0.015,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: context.mh * 0.015),
              ],
            ),
          ),

          Expanded(child: Obx(() {
            switch (controller.rxRequestStatusForAllUser.value) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());
              case Status.completed:
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.02,
                      vertical: context.mh * 0.01),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.getAllUser();
                    },
                    child: ListView.builder(
                      itemCount: controller.filterUserList.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final user = controller.filterUserList[index];
                        return InkWell(
                          onTap: () {
                            controller.superAdminLogin(
                                user.email ?? "", context);
                          },
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
                                  // Beautiful Avatar
                                  Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
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
                                        "${user.firstName} ${user.lastName}"
                                            .substring(0, 1)
                                            .toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: context.mh * 0.022,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  // User Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${user.firstName} ${user.lastName}",
                                          style: TextStyle(
                                            fontSize: context.mh * 0.018,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF1E293B),
                                          ),
                                        ),
                                        0.005.ph(context),
                                        Text(
                                          "${user.email}",
                                          style: TextStyle(
                                            fontSize: context.mh * 0.013,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Role Badge
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.mw * 0.02,
                                      vertical: context.mh * 0.005,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getRoleColor(user.adminType ?? "")
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color:
                                            _getRoleColor(user.adminType ?? "")
                                                .withOpacity(0.3),
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      user.adminType == 'none'
                                          ? 'User'
                                          : user.adminType ?? "",
                                      style: TextStyle(
                                        color:
                                            _getRoleColor(user.adminType ?? ""),
                                        fontSize: context.mh * 0.012,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              case Status.error:
                return const Center(child: Text('Error loading users'));
              default:
                return const Center(child: Text('Something went wrong'));
            }
          })),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value,
      IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(context.mw * 0.03),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: context.mh * 0.022,
              ),
            ),
            SizedBox(height: context.mh * 0.01),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.mh * 0.024,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: context.mh * 0.012,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRoleColor(String role) {
    switch (role.toLowerCase()) {
      case 'police':
        return const Color(0xFF10B981); // Red
      case 'cda':
        return const Color(0xFF10B981); // Amber
      case 'rta':
        return const Color(0xFF10B981); // Blue
      case 'cemetery':
        return const Color(0xFF10B981); // Blue
      default:
        return const Color(0xFF10B981); // Emerald
    }
  }
}

var documentCubit = DiContainer().sl<HomeCubit>();

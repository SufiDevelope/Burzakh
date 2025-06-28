import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/app/di_container.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/under_construction_dialog.dart';
import '../../../home/presentation/controller/cubit.dart';
import '../../../police_approval/presentation/widgets/document_recieved_dialog.dart';

class CreatCaseScreen extends StatefulWidget {
  const CreatCaseScreen({super.key});

  @override
  State<CreatCaseScreen> createState() => _CreatCaseScreenState();
}

class _CreatCaseScreenState extends State<CreatCaseScreen> {
  final TextEditingController nameofdeceased = TextEditingController();
  final TextEditingController causeofdeath = TextEditingController();
  final TextEditingController dateofdeath = TextEditingController();
  final TextEditingController locationofdeath = TextEditingController();

  dispose() {
    nameofdeceased.dispose();
    causeofdeath.dispose();
    dateofdeath.dispose();
    locationofdeath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColor.bgGradient),
      child: BlocBuilder(
          bloc: documentCubit,
          builder: (_, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                title: AppText(
                  text: "Documents & Progress",
                  fontWeight: FontWeight.bold,
                  fontSize: context.mh * 0.018,
                  color: AppColor.black(),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomElevatedButton(
                      text: "Start Case",
                      height: 36,
                      fontSize: context.mh * 0.014,
                      fontWeight: FontWeight.w600,
                      onPressed: () async {
                        if (documentCubit.isUploadingdocs == false) {
                          String response = await documentCubit.uploadDocument(
                              nameofdeceased,
                              causeofdeath,
                              dateofdeath,
                              locationofdeath);
                          if (response == "200") {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              barrierColor: AppColor.blurWhiteColor(),
                              builder: (context) => DocumentRecievedDialog(),
                            );
                          }
                        }
                      },
                      loaderSize: 20,
                      isLoading: documentCubit.isUploadingdocs,
                      bgColor: AppColor.primary(),
                      width: 120,
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
                              AppText(
                                text: "Required Documents",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColor.black(),
                              ),
                              const SizedBox(height: 20),
                              _documentItem(
                                  "Death Notification",
                                  "Pending",
                                  Symbols.heart_minus,
                                  const Color(0xFFFFF8E1),
                                  const Color(0xFFE65100),
                                  context: context),
                              const SizedBox(height: 6),
                              InkWell(
                                onTap: () {
                                  documentCubit.pickDeathNoti();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      documentCubit.deathNoti != null
                                          ? AppAssets.tickIcon
                                          : AppAssets.uploadIcon,
                                      color: AppColor.blue,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    AppText(
                                      text: "Death Notification",
                                      color: AppColor.blue,
                                      fontSize: context.mh * 0.014,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              _documentItem(
                                  "Hospital Report",
                                  "Pending",
                                  Icons.local_hospital,
                                  const Color(0xFFFFF8E1),
                                  const Color(0xFFE65100),
                                  context: context),
                              const SizedBox(height: 6),
                              InkWell(
                                onTap: () {
                                  documentCubit.pickHospitalCert();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      documentCubit.hospitalCerti != null
                                          ? AppAssets.tickIcon
                                          : AppAssets.uploadIcon,
                                      color: AppColor.blue,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    AppText(
                                      text: "Hospital Report",
                                      color: AppColor.blue,
                                      fontSize: context.mh * 0.014,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              _documentItem(
                                  "EID & Passport",
                                  "Pending",
                                  Icons.badge,
                                  const Color(0xFFFFF8E1),
                                  const Color(0xFFE65100),
                                  context: context),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      documentCubit.pickPassportFront();
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          documentCubit.passportFront != null
                                              ? AppAssets.tickIcon
                                              : AppAssets.uploadIcon,
                                          color: AppColor.blue,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        AppText(
                                          text: "Front",
                                          color: AppColor.blue,
                                          fontSize: context.mh * 0.014,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: .5,
                                    height: 30,
                                    color: AppColor.greyLight1(),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      documentCubit.pickPassportBack();
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          documentCubit.passportBack != null
                                              ? AppAssets.tickIcon
                                              : AppAssets.uploadIcon,
                                          color: AppColor.blue,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        AppText(
                                          text: "Back",
                                          color: AppColor.blue,
                                          fontSize: context.mh * 0.014,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              _buildTextFormFields(context),
                              const SizedBox(height: 12),

                              _documentItem(
                                  "Police Clearance",
                                  "Pending",
                                  Icons.verified_user,
                                  const Color(0xFFFFF8E1),
                                  const Color(0xFFE65100),
                                  subtitle: "Dubai Police",
                                  context: context),
                              0.02.ph(context),

                              // InkWell(
                              //   onTap: () {
                              //     showDialog(
                              //       context: context,
                              //       builder: (context) =>
                              //           UnderConstructionDialog(),
                              //     );
                              //   },
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       SvgPicture.asset(
                              //         AppAssets.clockIcon,
                              //         color: AppColor.blue,
                              //       ),
                              //       SizedBox(
                              //         width: 5,
                              //       ),
                              //       AppText(
                              //         text: "Request Video Call",
                              //         color: AppColor.blue,
                              //         fontSize: context.mh * 0.014,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              const SizedBox(height: 20),
                              _documentItem(
                                  "Burial Permit",
                                  "Not started",
                                  Icons.lock,
                                  AppColor.grey().withOpacity(0.1),
                                  AppColor.grey(),
                                  subtitle: "Dubai Municipality",
                                  context: context),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      color: AppColor.grey().withOpacity(.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: AppText(
                                      text: "Not started",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.grey(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              /// Step 1 - Death Notification
                              _buildStepItem(
                                // icon: Icons.check_circle,
                                // iconColor: AppColor.darkGreen,
                                icon: Icons.error_outline,
                                iconColor: AppColor.yellow(),
                                title: "Death Notification",
                                subtitle:
                                    "Document verified and approved by authorities",
                                statusText: "Not started",
                                statusTextColor: AppColor.grey(),
                                statusColor: AppColor.grey().withOpacity(.1),
                              ),

                              /// Step 2 - Hospital Report
                              _buildStepItem(
                                icon: Icons.error_outline,
                                iconColor: AppColor.yellow(),
                                title: "Hospital Report",
                                subtitle: "Medical documentation verified",
                                statusText: "Not started",
                                statusTextColor: AppColor.grey(),
                                statusColor: AppColor.grey().withOpacity(.1),
                              ),

                              /// Step 3 - EID & Passport
                              _buildStepItem(
                                icon: Icons.error_outline,
                                iconColor: AppColor.yellow(),
                                title: "EID & Passport",
                                subtitle: "Required for identity verification",
                                statusText: "Not started",
                                statusTextColor: AppColor.grey(),
                                statusColor: AppColor.grey().withOpacity(.1),
                              ),

                              /// Step 4 - Police Verification
                              _buildStepItem(
                                icon: Icons.error_outline,
                                iconColor: AppColor.yellow(),
                                title: "Police Verification",
                                subtitle:
                                    "Required video call with Dubai Police officer",
                                statusText: "Not started",
                                statusTextColor: AppColor.grey(),
                                statusColor: AppColor.grey().withOpacity(.1),
                              ),

                              /// Step 5 - Burial Permit
                              _buildStepItem(
                                iconColor: AppColor.greyLight(),
                                title: "Burial Permit",
                                burialPermitText: '5',
                                subtitle:
                                    "Issued after police verification is complete",
                                statusText: "Not started",
                                statusTextColor: AppColor.grey(),
                                statusColor: AppColor.grey().withOpacity(.1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
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
                              AppText(
                                text:
                                    "\"O reassured soul, return to your Lord,\nwell-pleased and pleasing [to Him]. Enter among My servants, and enter My\n Paradise.\"",
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                color: AppColor.greyLight(),
                                textAlign: TextAlign.center,
                                fontSize: context.mh * 0.015,
                              ),
                              0.01.ph(context),
                              AppText(
                                text: "— Surah Al-Fajr 89:27-30",
                                fontSize: context.mh * 0.012,
                                fontWeight: FontWeight.w300,
                                color: AppColor.grey(),
                                fontStyle: FontStyle.italic,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildTextFormFields(BuildContext context) {
    return Container(
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
          AppText(
            text: "Deceased Information",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColor.black(),
          ),
          const SizedBox(height: 20),

          // Name of Deceased Field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Name of Deceased",
                fontSize: context.mh * 0.014,
                fontWeight: FontWeight.w500,
                color: AppColor.black(),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: nameofdeceased,
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: TextStyle(
                    color: AppColor.grey(),
                    fontSize: context.mh * 0.014,
                  ),
                  filled: true,
                  fillColor: AppColor.grey().withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.greyLight1()),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.greyLight1()),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.primary()),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Cause of Death Field

          // Date of Death Field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Date of Death",
                fontSize: context.mh * 0.014,
                fontWeight: FontWeight.w500,
                color: AppColor.black(),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: dateofdeath,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    dateofdeath.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: TextStyle(
                    color: AppColor.grey(),
                    fontSize: context.mh * 0.014,
                  ),
                  filled: true,
                  fillColor: AppColor.grey().withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.greyLight1()),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.greyLight1()),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.primary()),
                  ),
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: AppColor.grey(),
                    size: 20,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Location of Death Field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Location of Death",
                fontSize: context.mh * 0.014,
                fontWeight: FontWeight.w500,
                color: AppColor.black(),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: locationofdeath,
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: TextStyle(
                    color: AppColor.grey(),
                    fontSize: context.mh * 0.014,
                  ),
                  filled: true,
                  fillColor: AppColor.grey().withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.greyLight1()),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.greyLight1()),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.primary()),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Reusable Document Item
  Widget _documentItem(
    String title,
    String status,
    IconData icon,
    Color bgColor,
    Color statusColor, {
    String? subtitle,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
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
                  color: statusColor.withOpacity(0.1)),
              child: Icon(icon, color: statusColor.withOpacity(.5))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  fontSize: context.mh * 0.015,
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
    required Color statusTextColor,
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
                        color: burialPermitText != null
                            ? iconColor.withOpacity(.2)
                            : iconColor,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            width: burialPermitText != null ? 1.5 : 0,
                            color: burialPermitText != null
                                ? iconColor
                                : Colors.white)),
                    width: 40,
                    alignment: Alignment.center,
                    height: 30,
                    child: icon != null
                        ? Icon(icon, color: Colors.white, size: 20)
                        : AppText(text: burialPermitText ?? "")),
                SizedBox(
                  height: 8,
                ),
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
                        color: statusTextColor,
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

var documentCubit = DiContainer().sl<HomeCubit>();

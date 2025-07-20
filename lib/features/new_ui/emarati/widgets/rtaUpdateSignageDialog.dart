// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:ui';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/features/emirati_svcs/presentation/controller/cubit.dart';
import 'package:burzakh/features/emirati_svcs/presentation/widgets/request_sent_dialog.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_text_style.dart';
import '../../../../core/app/di_container.dart';
import '../../../../core/extensions/show_message.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/custom_button.dart';
import '../../../new_ui/emarati/ui/rta_service_request_Screen.dart';

class UpdateSignAgeSheet extends StatefulWidget {
  UpdateSignAgeSheet({super.key});

  @override
  State<UpdateSignAgeSheet> createState() => _UpdateSignAgeSheetState();
}

class _UpdateSignAgeSheetState extends State<UpdateSignAgeSheet> {
  TextEditingController dateController = TextEditingController();
  TextEditingController requiredSignController = TextEditingController();
  TextEditingController customSignController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  TextEditingController locationController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController caseNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var _emiratiScvCubit = DiContainer().sl<EmirateSvcsCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dateController.text =
          "${_emiratiScvCubit.rtaGetModel?.mourningStartDate} - ${_emiratiScvCubit.rtaGetModel?.mourningEndDate}";
      timeController.text = "${_emiratiScvCubit.rtaGetModel?.time}";
      requiredSignController.text =
          "${_emiratiScvCubit.rtaGetModel?.signsRequired}";
      customSignController.text =
          "${_emiratiScvCubit.rtaGetModel?.customTextForSign}";
      _emiratiScvCubit.locationController.text =
          "${_emiratiScvCubit.rtaGetModel?.locationOfHouse}";
      startDateController.text =
          "${_emiratiScvCubit.rtaGetModel?.mourningStartDate}";
      endDateController.text =
          "${_emiratiScvCubit.rtaGetModel?.mourningEndDate}";
      caseNameController.text = _emiratiScvCubit.rtaGetModel?.case_name ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding:
              EdgeInsets.symmetric(vertical: 20, horizontal: screenPaddingHori),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24), topLeft: Radius.circular(24))),
          child: SingleChildScrollView(
            child: BlocBuilder(
                bloc: _emiratiScvCubit,
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(AppAssets.closeIcon)),
                            AppText(
                              text: "RTA",
                              fontSize: heading2,
                              fontWeight: FontWeight.w600,
                              color: AppColor.black(),
                              fontFamily: 'ns',
                            ),
                            SizedBox(),
                          ],
                        ),
                        SizedBox(
                          height: commonHeightM,
                        ),
                        Text(
                          'Date'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5F5A51),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // CustomTextFormField(
                        //   borderColor: AppColor.fieldYellowBorder(),
                        //   hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                        //   controller: dateController,
                        //   onTap: () async {
                        //     var value = await showDatePicker(
                        //       context: context,
                        //       firstDate: DateTime(2000, 0, 0),
                        //       lastDate: DateTime(3000, 0, 0),
                        //       initialDate: DateTime.now(),
                        //     );
                        //     if (value != null) {
                        //       _emiratiScvCubit.getMourningStartDate(value);
                        //     }
                        //   },
                        // subTitle: _emiratiScvCubit.mourningStartDate != null
                        //     ? "${_emiratiScvCubit.mourningStartDate!.year}-${_emiratiScvCubit.mourningStartDate!.month}-${_emiratiScvCubit.mourningStartDate!.day}"
                        //     : 'Mourning start date',
                        //   readOnly: true,
                        //   sufixIcon: AppAssets.calenderIcon,
                        // ),
                        CustomTextFormField(
                          borderColor: AppColor.fieldYellowBorder(),
                          hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                          controller: dateController,
                          onTap: () async {
                            var value = await showDateRangePicker(
                              barrierColor: AppColor.primary(),
                              context: context,
                              firstDate: DateTime(2000, 1, 1),
                              lastDate: DateTime(3000, 12, 31),
                              initialDateRange: DateTimeRange(
                                  start: DateTime.now(), end: DateTime.now()),
                            );
                            if (value != null) {
                              _emiratiScvCubit
                                  .getMourningStartDate(value.start);
                              _emiratiScvCubit.getMourningEndDate(value.end);
                              dateController.text =
                                  "${value.start.year}-${value.start.month.toString().padLeft(2, '0')}-${value.start.day.toString().padLeft(2, '0')} to ${value.end.year}-${value.end.month.toString().padLeft(2, '0')}-${value.end.day.toString().padLeft(2, '0')}";
                              startDateController.text =
                                  "${value.start.year}-${value.start.month.toString().padLeft(2, '0')}-${value.start.day.toString().padLeft(2, '0')}";
                              endDateController.text =
                                  "${value.end.year}-${value.end.month.toString().padLeft(2, '0')}-${value.end.day.toString().padLeft(2, '0')}";
                            }
                          },
                          subTitle: _emiratiScvCubit.mourningStartDate != null
                              ? "${_emiratiScvCubit.mourningStartDate!.year}-${_emiratiScvCubit.mourningStartDate!.month}-${_emiratiScvCubit.mourningStartDate!.day}"
                              : 'Mourning start date',
                          readOnly: true,
                          sufixIcon: AppAssets.calenderIcon,
                        ),
                        // SizedBox(
                        //   height: commonHeightS,
                        // ),

                        // Text(
                        //   'Time'.tr(),
                        //   style: TextStyle(
                        //     fontSize: 14,
                        //     fontWeight: FontWeight.w500,
                        //     color: Color(0xFF5F5A51),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // CustomTextFormField(
                        //   borderColor: AppColor.fieldYellowBorder(),
                        //   hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                        //   controller: timeController,
                        //   onTap: () async {
                        //     var value = await showTimePicker(
                        //         context: context, initialTime: TimeOfDay.now());
                        //     if (value != null) {
                        //       _emiratiScvCubit.getTime(value);
                        //     }
                        //   },
                        //   subTitle: _emiratiScvCubit.time != null
                        //       ? "${_emiratiScvCubit.time!.hour}:${_emiratiScvCubit.time!.minute}"
                        //       : 'Time',
                        //   readOnly: true,
                        //   sufixIcon: AppAssets.clockIcon,
                        // ),
                        SizedBox(
                          height: commonHeightS,
                        ),
                        Text(
                          'Case Name'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5F5A51),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.fieldYellowBorder()),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: InputBorder.none,
                              hintText: 'Select case name',
                              hintStyle: AppTextStyle.hintTextStyleWithFont(),
                            ),
                            value: _emiratiScvCubit.selectedCaseName,
                            items: _emiratiScvCubit
                                        .caseNameModel?.data?.isNotEmpty ==
                                    true
                                ? _emiratiScvCubit.caseNameModel!.data!
                                    .map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item.nameOfDeceased,
                                      child: Text(
                                        item.nameOfDeceased ?? '',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList()
                                : [
                                    DropdownMenuItem<String>(
                                      child: Text('No data available'),
                                    )
                                  ],
                            onChanged: (String? newValue) {
                              caseNameController.text = newValue ?? '';
                              _emiratiScvCubit.setSelectedCaseName(newValue);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a case name';
                              }
                              return null;
                            },
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        SizedBox(
                          height: commonHeightS,
                        ),
                        Text(
                          'Location'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5F5A51),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          borderColor: AppColor.fieldYellowBorder(),
                          hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                          maxLines: 1,
                          controller: _emiratiScvCubit.locationController,
                          subTitle: _emiratiScvCubit.userLocation != null
                              ? "${_emiratiScvCubit.userLocation}"
                              : 'Precise location of the tent',
                          readOnly: false,
                          sufixIcon: AppAssets.locationPinIcon,
                        ),
                        SizedBox(
                          height: commonHeightS,
                        ),
                        Text(
                          'Signs'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5F5A51),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          borderColor: AppColor.fieldYellowBorder(),
                          hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                          controller: requiredSignController,
                          subTitle: 'How many signs required? (max 10)',
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Please enter number of signs';
                            } else if (int.parse(p0) > 10) {
                              return 'Max 10 signs';
                            } else if (int.parse(p0) < 1) {
                              return 'Min 1 sign';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: commonHeightS,
                        ),
                        Text(
                          'Custom sign'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5F5A51),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          borderColor: AppColor.fieldYellowBorder(),
                          hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                          controller: customSignController,
                          subTitle: 'Custom text for sign',
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: commonHeightM1,
                        ),
                        CustomElevatedButton(
                          onPressed: () async {
                            try {
                              if (_formKey.currentState!.validate()) {
                                if (requiredSignController.text.isEmpty ||
                                    customSignController.text.isEmpty) {
                                  showMessage("Please add required fields",
                                      isError: true);
                                  return;
                                }

                                log("update rta request ${startDateController.text} ${endDateController.text} ${caseNameController.text} ${requiredSignController.text} ${customSignController.text} ${timeController.text} ${_emiratiScvCubit.locationController.text}");

                                final response =
                                    await _emiratiScvCubit.updateRtaRequest(
                                  customSignController.text,
                                  requiredSignController.text,
                                  _emiratiScvCubit.locationController.text,
                                  timeController.text,
                                  DateTime.parse(startDateController.text),
                                  DateTime.parse(endDateController.text),
                                  caseNameController.text,
                                  _emiratiScvCubit.rtaGetModel?.userId,
                                  _emiratiScvCubit.rtaGetModel?.id,
                                );
                                if (response == "200") {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    barrierColor: AppColor.blurWhiteColor(),
                                    builder: (context) => RequestSentDialog(
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RtaServiceRequestScreen(id: 'RTA',),
                                            ),
                                          );
                                        },
                                        heading: "Road sign request sent",
                                        subText1:
                                            "Your request has been shared with the Roads & Transport Authority.",
                                        subText2:
                                            "You may cancel this request within 2 hours."),
                                  );
                                }
                              }
                            } catch (e) {
                              log("error in update rta request $e");
                            }
                          },
                          isLoading: _emiratiScvCubit.isRtaLoading,
                          text: "SUBMIT",
                          textColor: AppColor.white(),
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:ui';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/features/emirati_svcs/presentation/controller/cubit.dart';
import 'package:burzakh/features/emirati_svcs/presentation/widgets/request_sent_dialog.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/custom_button.dart';
import '../../../new_ui/emarati/ui/service_request_confirmation_screen.dart';

class UpdateTentRequestSheet extends StatefulWidget {
  UpdateTentRequestSheet({super.key});

  @override
  State<UpdateTentRequestSheet> createState() => _UpdateTentRequestSheetState();
}

class _UpdateTentRequestSheetState extends State<UpdateTentRequestSheet> {
  TextEditingController dateController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  TextEditingController locationController = TextEditingController();
  TextEditingController casenameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  var _emiratiScvCubit = DiContainer().sl<EmirateSvcsCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dateController.text =
          "${_emiratiScvCubit.cdaGetModel?.mourningStartDate} - ${_emiratiScvCubit.cdaGetModel?.mourningEndDate}";
      _emiratiScvCubit.locationController.text =
          _emiratiScvCubit.cdaGetModel?.locationOfTent ?? "";
      _emiratiScvCubit.selectedCaseName =
          _emiratiScvCubit.cdaGetModel?.case_name ?? "";
      startDateController.text =
          _emiratiScvCubit.cdaGetModel?.mourningStartDate.toString() ?? "";
      endDateController.text =
          _emiratiScvCubit.cdaGetModel?.mourningEndDate?.toString() ?? "";
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
          child: BlocBuilder(
              bloc: _emiratiScvCubit,
              builder: (context, state) {
                // locationController.text = _emiratiScvCubit.userLocation ?? "";
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(AppAssets.closeIcon)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: AppText(
                          text:
                              "Request Community Development Authority Service",
                          fontSize: heading2,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          color: AppColor.black(),
                          fontFamily: 'ns',
                        )),
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
                          _emiratiScvCubit.getMourningStartDate(value.start);
                          _emiratiScvCubit.getMourningEndDate(value.end);
                          startDateController.text = value.start.toString();
                          endDateController.text = value.end.toString();
                          dateController.text =
                              "${value.start.year}-${value.start.month.toString().padLeft(2, '0')}-${value.start.day.toString().padLeft(2, '0')} to ${value.end.year}-${value.end.month.toString().padLeft(2, '0')}-${value.end.day.toString().padLeft(2, '0')}";
                        }
                      },
                      subTitle: _emiratiScvCubit.mourningStartDate != null
                          ? "${_emiratiScvCubit.mourningStartDate!.year}-${_emiratiScvCubit.mourningStartDate!.month}-${_emiratiScvCubit.mourningStartDate!.day}"
                          : 'Mourning start date',
                      readOnly: true,
                      sufixIcon: AppAssets.calenderIcon,
                    ),
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
                        border: Border.all(color: AppColor.fieldYellowBorder()),
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
                            ? _emiratiScvCubit.caseNameModel!.data!.map((item) {
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
                    // SizedBox(
                    //   height: commonHeightS,
                    // ),
                    // CustomTextFormField(controller: dateController,hintTextStyle: AppTextStyle.hintTextStyleWithFont(),isNeedLabelText: false,borderColor: AppColor.fieldYellowBorder(), subTitle: 'Email address *',textInputAction: TextInputAction.done,),

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
                      maxLines: 1,
                      borderColor: AppColor.fieldYellowBorder(),
                      hintTextStyle: AppTextStyle.fieldTextStyle(),
                      controller: _emiratiScvCubit.locationController,
                      subTitle: _emiratiScvCubit.userLocation != null
                          ? "${_emiratiScvCubit.userLocation}"
                          : 'Precise location of the tent',
                      readOnly: false,
                      sufixIcon: AppAssets.locationPinIcon,
                    ),
                    SizedBox(
                      height: commonHeightM1,
                    ),
                    CustomElevatedButton(
                      onPressed: () async {
                        log(DateTime.parse(endDateController.text).toString());
                        final response =
                            await _emiratiScvCubit.updateCdaRequest(
                          locationController.text,
                          DateTime.parse(startDateController.text),
                          _emiratiScvCubit.selectedCaseName,
                          _emiratiScvCubit.cdaGetModel?.userId.toString(),
                          _emiratiScvCubit.cdaGetModel?.id.toString(),
                          DateTime.parse(endDateController.text),
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
                                        ServiceRequestConfirmationScreen(
                                            id: "CDA"),
                                  ),
                                );
                              },
                              heading: "Mourning tent request sent",
                              subText1:
                                  "Your request has been shared with the Community Development Authority.",
                              subText2:
                                  "You may cancel this request within 2 hours.",
                            ),
                          );
                        }
                      },
                      isLoading: _emiratiScvCubit.isCdaLoading ||
                          _emiratiScvCubit.isGetCdaLoading,
                      text: "SUBMIT",
                      textColor: AppColor.white(),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

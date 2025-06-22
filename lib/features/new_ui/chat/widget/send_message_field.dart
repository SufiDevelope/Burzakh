// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_text_style.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/extensions/show_message.dart';
import 'package:burzakh/features/authentication/presentation/controller/user_sharepref_controller.dart';
import 'package:burzakh/features/authentication/presentation/model/user_model.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Controller/cda_controller.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Controller/rta_controller.dart';
import 'package:burzakh/features/new_ui/chat/cubit/chat_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/AppColor.dart';

class RiderSendChatField extends StatefulWidget {
  RiderSendChatField({super.key, required this.id, required this.adminType});
  String id;
  String adminType;
  @override
  State<RiderSendChatField> createState() => _RiderSendChatFieldState();
}

class _RiderSendChatFieldState extends State<RiderSendChatField> {
  final rtaController = Get.put(RtaController());
  final cdaController = Get.put(CdaController());

  bool _isFieldEmpty = true;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: chatCubit,
        builder: (context, state) {
          return Container(
            height: 90,
            padding: const EdgeInsets.symmetric(horizontal: 33),
            decoration: BoxDecoration(
                color: AppColor.buttonColor,
                border: Border(
                    top: BorderSide(
                        color: AppColor.bgPrimary().withOpacity(0.25)))),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColor.black(),
                        fontFamily: 'nm'),
                    decoration: InputDecoration(
                      fillColor: AppColor.white(),
                      filled: true,
                      hintText:
                          StringTranslateExtension('Write your message').tr(),
                      hintStyle: AppTextStyle.hintTextStyleWithFont(),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.white(),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      onPressed: () async {
                        UserShareprefController pref =
                            UserShareprefController();
                        UserModel? model = await pref.getData();
                        if (widget.adminType == 'rta') {
                          rtaController.sendUserMessageApi(
                              model?.id ?? 0, "rta_help", controller.text);
                          controller.clear();
                        } else {
                          rtaController.sendUserMessageApi(
                              model?.id ?? 0, "cda_assistence", controller.text);
                          cdaController.getCdaChatApi(model?.id ?? 0);    
                          controller.clear();
                        }
                      },
                      icon: rtaController.userloading.value
                          ? const CircularProgressIndicator()
                          : Icon(Icons.send)
                      // : SvgPicture.asset(AppImages.micIcon)
                      ),
                ),
              ],
            ),
          );
        });
  }
}

var chatCubit = DiContainer().sl<ChatCubit>();

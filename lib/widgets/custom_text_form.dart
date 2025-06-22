// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_text_style.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_widgets_size.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String subTitle;
  final String? prefixIcon;
  final String? sufixIcon;
  TextInputAction? textInputAction;
  Widget? suffix;
  final int? maxLines;
  final bool? isObSecure;
  bool? readOnly;
  VoidCallback? onTap;
  Color? bgColor;
  final String? Function(String?)? validator;
  double? borderRadius;
  double? suffixSize;
  double? hintFontSize;
  Color? borderColor;
  Color? suffixIconColor;
  final VoidCallback? onSuffixTap;
  bool? isSuffixCircle;
  bool? isNeedLabelText;
  TextStyle? hintTextStyle;
  // on chnages
  final ValueChanged<String>? onChanged;

  CustomTextFormField({
    super.key,
    this.textInputAction,
    this.isNeedLabelText,
    this.borderColor,
    this.hintTextStyle,
    this.suffixIconColor,
    this.isSuffixCircle,
    required this.controller,
    this.title,
    this.hintFontSize,
    this.suffixSize,
    this.readOnly=false,
    this.onTap,
    this.bgColor,
    this.borderRadius,
    required this.subTitle,
    this.prefixIcon,
    this.sufixIcon,
    this.maxLines,
    this.isObSecure,
    this.suffix,
    this.validator,
    this.onSuffixTap, this.onChanged,
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppText(text: widget.title!),
          ),
        SizedBox(height: widget.title != null ? 8 : 0),
        TextFormField(
          onChanged: widget.onChanged,
          scrollPadding: EdgeInsets.zero,
          focusNode: _focusNode,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: AppColor.primary(),
          readOnly: widget.readOnly??false,
          onTap: widget.onTap,
          controller: widget.controller,
          obscureText: widget.isObSecure ?? false,
          validator: widget.validator,
          maxLines: widget.maxLines ?? null,
          decoration: InputDecoration(
            isDense: true,
            fillColor:widget.bgColor??AppColor.white(),
            filled: true,
            // labelText:widget.isNeedLabelText==false?null:widget.readOnly==true? null:widget.subTitle.tr(),
            labelStyle: AppTextStyle.hintTextStyle(),
            hintText:widget.readOnly==true? widget.prefixIcon == null
                ? '\t\t${widget.subTitle.tr()}'.tr()
                : widget.subTitle.tr():widget.isNeedLabelText==false?widget.subTitle.tr():widget.subTitle.tr(),
            hintStyle:widget.hintTextStyle?? AppTextStyle.hintTextStyle(fontSize:widget.hintFontSize ),
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          widget.prefixIcon!,
                          width: 18,
                          height: 18,
                          colorFilter: ColorFilter.mode(
                            _focusNode.hasFocus
                                ? AppColor.primary()
                                :AppColor.black(),
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
            suffixIcon: widget.sufixIcon != null
                ? GestureDetector(
                    onTap: widget.onSuffixTap,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical:widget.isSuffixCircle==true? 10:0),
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration:widget.isSuffixCircle==true? BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.fieldYellowBorder()
                        ):BoxDecoration(),
                        child: SvgPicture.asset(
                          widget.sufixIcon!,
                          width:widget.suffixSize==null?widget.isSuffixCircle==true? 12:18:widget.suffixSize,
                          height: widget.suffixSize==null?widget.isSuffixCircle==true? 12:18:widget.suffixSize,
                          colorFilter: ColorFilter.mode(
                            _focusNode.hasFocus
                                ?widget.suffixIconColor?? AppColor.primary()
                                :widget.suffixIconColor?? AppColor.grey(),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? fieldRadius),
              borderSide:  BorderSide(color: widget.borderColor??AppColor.grey()),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? fieldRadius),
              borderSide:  BorderSide(color: widget.borderColor??AppColor.grey()),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(fieldRadius),
              borderSide: BorderSide(color:widget.borderColor?? AppColor.primary()),
            ),
            suffix: widget.suffix,
          ),
          keyboardType: TextInputType.text,
          style: AppTextStyle.fieldTextStyle(),
          textInputAction: widget.textInputAction ?? TextInputAction.next,
        ),
      ],
    );
  }
}

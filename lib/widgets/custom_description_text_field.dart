// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_text_style.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_widgets_size.dart';

class CustomDescriptionTextField extends StatefulWidget {
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
  final VoidCallback? onSuffixTap;
  CustomDescriptionTextField({
    super.key,
    this.textInputAction,
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
    this.onSuffixTap,
  });

  @override
  CustomDescriptionTextFieldState createState() => CustomDescriptionTextFieldState();
}

class CustomDescriptionTextFieldState extends State<CustomDescriptionTextField> {
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
            filled: true,floatingLabelAlignment:FloatingLabelAlignment.start ,floatingLabelBehavior: FloatingLabelBehavior.auto,
            // labelText:widget.readOnly==true? null:widget.subTitle,
            // labelStyle: AppTextStyle.hintTextStyle(),
            label:widget.readOnly==true? null: AppText(text: widget.subTitle,textAlign: TextAlign.left,fontWeight: FontWeight.w500,fontSize: widget.hintFontSize??16,color: AppColor.grey(),fontFamily: 'nm'),
            hintText:widget.readOnly==true? widget.prefixIcon == null
                ? '\t\t${widget.subTitle}'
                : widget.subTitle:"",
            hintStyle: AppTextStyle.hintTextStyle(fontSize:widget.hintFontSize ),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: SvgPicture.asset(
                  widget.sufixIcon!,
                  width:widget.suffixSize?? 18,
                  height: widget.suffixSize??18,
                  colorFilter: ColorFilter.mode(
                    _focusNode.hasFocus
                        ? AppColor.primary()
                        : AppColor.grey(),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? fieldRadius),
              borderSide:  BorderSide(color: AppColor.grey()),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? fieldRadius),
              borderSide:  BorderSide(color: AppColor.grey()),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(fieldRadius),
              borderSide: BorderSide(color: AppColor.primary()),
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

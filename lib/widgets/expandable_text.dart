import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import '../core/theme/AppColor.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const ExpandableText({super.key, required this.text, this.style});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayText =
        _isExpanded ? widget.text : '${widget.text.substring(0, 100)}...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: AppText(
                text: displayText,
                // style: AppTextStyles.bodySmall(context).copyWith(
                //     fontSize: 12, color: ColorPalette.black.withOpacity(.6)),
                // maxLines: maxLines,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: _toggleExpanded,
          child: AppText(text: _isExpanded ? 'Read More' : 'Read Less',color: AppColor.primary(),),
        ),
      ],
    );
  }
}

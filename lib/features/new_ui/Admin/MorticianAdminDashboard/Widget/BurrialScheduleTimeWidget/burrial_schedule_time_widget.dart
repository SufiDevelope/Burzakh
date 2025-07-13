import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class BurialScheduleTile extends StatelessWidget {
  final String title;
  final Color color;
  final String value;
  final IconData data;
  const BurialScheduleTile(
      {super.key,
      required this.title,
      required this.color,
      required this.value,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.mw * 0.02,
        vertical: context.mw * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.02,
        vertical: context.mw * 0.02,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            data,
            color:
                title == "Sect & Region" ? Colors.grey : Color(0xff5851d1),
            size: context.mh * 0.025,
          ),
          0.03.pw(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: title == "Sect & Region"
                      ? Colors.grey
                      : Color(0xff5851d1),
                  fontSize: context.mh * 0.015,
                ),
              ),
              0.006.ph(context),
              Text(
                value,
                style: TextStyle(
                  fontSize: context.mh * 0.016,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

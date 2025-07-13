import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class MorticianNotifs extends StatelessWidget {
  const MorticianNotifs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontSize: context.mh * 0.02),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8FAFC),
              Color(0xFFEBF4FF),
            ],
          ),
        ),
        child: Center(
          child: Text(
            'No Notifications here',
            style: TextStyle(color: Colors.black, fontSize: context.mh * 0.02),
          ),
        ),
      ),
    );
  }
}

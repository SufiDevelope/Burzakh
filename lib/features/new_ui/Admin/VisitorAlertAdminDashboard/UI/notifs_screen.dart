import 'package:flutter/material.dart';

class NotifsScreen extends StatelessWidget {
  const NotifsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xfff8f3ed),
      appBar: AppBar(
        backgroundColor: Color(0xfff8f3ed),
        title:  Text('Notification'),
      ),
      body:  Center(
        child: Text('No Noification is Here'),
      ),
    );
  }
}
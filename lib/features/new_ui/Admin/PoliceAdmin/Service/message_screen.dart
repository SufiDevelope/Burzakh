import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String message;
  const MessageScreen({super.key, required this.message});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Message Screen" + widget.message),
    );
  }
}
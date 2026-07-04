import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Commencez la conversation",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        foregroundColor: Theme.of(context).highlightColor,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

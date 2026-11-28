import 'package:flutter/material.dart';

class NotificationDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const NotificationDetailScreen ({
    super.key, 
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    final extraData = Map<String,dynamic>.from(data)
      ..remove(title)
      ..remove(body);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail notif'),
      ),
    );
  }
}
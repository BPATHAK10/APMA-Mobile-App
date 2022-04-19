import 'package:flutter/material.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({Key? key}) : super(key: key);

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.call,
        size: 150,
      ),
    );
  }
}
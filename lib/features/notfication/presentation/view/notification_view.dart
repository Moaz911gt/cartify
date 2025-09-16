import 'package:flutter/material.dart';
import 'package:project2/features/notfication/presentation/view/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NotificationViewBody(),);
  }
}
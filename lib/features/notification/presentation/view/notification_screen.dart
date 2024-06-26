import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/notification/presentation/view/widgets/notification_fram.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: 2,
          itemBuilder: (context, index) {
            return const NotificationListFram();
          },
        ))
      ],
    );
  }
}

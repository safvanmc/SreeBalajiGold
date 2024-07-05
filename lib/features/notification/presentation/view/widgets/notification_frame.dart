import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/notification/data/model/notification_model.dart';
import 'package:sree_balagi_gold/general/widgets/custom_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationFrame extends StatelessWidget {
  const NotificationFrame({
    super.key,
    required this.notificationModel,
  });
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 5,
            ),
            constraints: const BoxConstraints(
              minHeight: 100,
            ),
            child: Row(
              children: [
                Gap(notificationModel.image != null ? 5 : 15),
                if (notificationModel.image != null)
                  Row(
                    children: [
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: CNetworkImage(
                          url: notificationModel.image!,
                        ),
                      ),
                      const Gap(10),
                    ],
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notificationModel.msg,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        timeago.format(notificationModel.createdAt!.toDate()),
                        style: TextStyle(
                          color: Colors.black.withOpacity(.7),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 0.16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 2,
            ),
            height: 1,
            color: Colors.grey.withOpacity(.5),
          ),
        ],
      ),
    );
  }
}

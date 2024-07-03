import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/notification/presentation/provider/notification_provider.dart';
import 'package:sree_balagi_gold/features/notification/presentation/view/widgets/notification_frame.dart';
import 'package:sree_balagi_gold/general/widgets/custom_loading.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<NotificationProvider>().initData(
              context: context,
              scrollController: scrollController,
            );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(builder: (context, state, _) {
      return CustomScrollView(
        controller: scrollController,
        slivers: [
          state.isLoading
              ? const SliverFillRemaining(
                  fillOverscroll: true,
                  child: CLoading(),
                )
              : state.notificationList.isEmpty
                  ? const SliverFillRemaining(
                      fillOverscroll: true,
                      child: Center(
                        child: Text('No notifications available!'),
                      ),
                    )
                  : SliverList.builder(
                      itemCount: state.notificationList.length,
                      itemBuilder: (context, index) {
                        return NotificationFrame(
                          notificationModel: state.notificationList[index],
                        );
                      },
                    ),
          if (state.isMoreDataLoading && state.notificationList.isNotEmpty)
            const SliverToBoxAdapter(
              child: CLoading(),
            )
          else
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
        ],
      );
    });
  }
}

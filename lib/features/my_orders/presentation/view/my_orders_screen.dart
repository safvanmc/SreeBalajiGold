import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/my_orders/presentation/view/widgets/order_frame.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverFillRemaining(
        //   fillOverscroll: true,
        //   child: CLoading(),
        // ),
        // SliverFillRemaining(
        //   child: Text('No orders yet.'),
        // )
        SliverList.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return const OrderFrame();
          },
        ),
        //  if (state.isMoreDataLoading && state.notificationList.isNotEmpty)
        //     const SliverToBoxAdapter(
        //       child: CLoading(),
        //     )
        //   else
        //     const SliverToBoxAdapter(
        //       child: SizedBox(
        //         height: 10,
        //       ),
        //     ),
      ],
    );
  }
}

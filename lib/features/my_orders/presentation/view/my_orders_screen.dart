import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/my_orders/presentation/provider/order_provider.dart';
import 'package:sree_balagi_gold/features/my_orders/presentation/view/widgets/order_frame.dart';
import 'package:sree_balagi_gold/general/widgets/custom_loading.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // context.read<OrderProvider>().changeLoading(true);
    context.read<OrderProvider>().initData(
          context: context,
          scrollController: scrollController,
        );
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) {
    //     context.read<OrderProvider>().initData(
    //           context: context,
    //           scrollController: scrollController,
    //         );
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, state, child) => CustomScrollView(
        controller: scrollController,
        slivers: [
          state.isLoading
              ? const SliverFillRemaining(
                  fillOverscroll: true,
                  child: CLoading(),
                )
              : state.orderList.isEmpty
                  ? const SliverFillRemaining(
                      fillOverscroll: true,
                      child: Center(
                        child: Text('No orders yet.'),
                      ),
                    )
                  : SliverList.builder(
                      itemCount: state.orderList.length,
                      itemBuilder: (context, index) {
                        final data = state.orderList[index];
                        return OrderFrame(data: data);
                      },
                    ),
          if (state.isMoreDataLoading && state.orderList.isNotEmpty)
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
      ),
    );
  }
}

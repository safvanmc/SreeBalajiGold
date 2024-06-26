import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/my_orders/presentation/view/widgets/my_order_card.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return const MyOrderCard();
      },
    );
  }
}

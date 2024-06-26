import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/whishlist/presentation/view/widgets/wish_list_frame.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/app_bar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      appBar: const CommonAppBar(title: 'Wishlists'),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => const WishListCard(),
      ),
    );
  }
}

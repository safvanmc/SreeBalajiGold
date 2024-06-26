import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/general/widgets/jwelry_items.dart';

class SecondCatagoryFrame extends StatelessWidget {
  const SecondCatagoryFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return JewelryItemFrame(
              title: jewelryItems[index].title,
              image: jewelryItems[index].image,
              totalItems: jewelryItems[index].totalItems,
            );
          },
          childCount: jewelryItems.length,
        ),
      ),
    );
  }
}

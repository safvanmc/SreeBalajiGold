import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/Product_List.dart/presentation/view/widgets/product_list_frame.dart';
import 'package:sree_balagi_gold/general/widgets/app_bar.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: title),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              separatorBuilder: (context, index) => const Gap(20),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ProductListFrame(
                  title: thirdCatagory[index].title,
                  image: thirdCatagory[index].image,
                  totalItems: thirdCatagory[index].totalItems,
                  index: index,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/bottom_section.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/orderdetail_frame.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            separatorBuilder: (context, index) => const Divider(),
            // itemCount: jewelryorders1.length,
            itemCount: 2,
            itemBuilder: (context, index) {
              return OrderdetailFrame(order: jewelryorders1[index]);
            },
          ),
        ),
        const BottomSection(),
        const Gap(60)
      ],
    );
  }
}

//dummy model//
class JewelryOrder {
  final String serialNumber;
  final double grossWeight;
  final double netWeight;
  final int piece;
  final double total;
  final String image;

  JewelryOrder({
    required this.serialNumber,
    required this.grossWeight,
    required this.netWeight,
    required this.piece,
    required this.total,
    required this.image,
  });
}

final List<JewelryOrder> jewelryorders1 = [
  JewelryOrder(
      serialNumber: 'A45DF654357',
      grossWeight: 56.965,
      netWeight: 48.605,
      piece: 4,
      total: 322.00,
      image:
          'https://static.ebayinc.com/static/assets/Uploads/Stories/Articles/_resampled/ScaleWidthWyI4MDAiXQ/ebay-authenticity-guarantee-fine-jewelry.jpg'),
  JewelryOrder(
      serialNumber: 'A45DF654357',
      grossWeight: 56.965,
      netWeight: 48.605,
      piece: 4,
      total: 322.00,
      image:
          'https://static.ebayinc.com/static/assets/Uploads/Stories/Articles/_resampled/ScaleWidthWyI4MDAiXQ/ebay-authenticity-guarantee-fine-jewelry.jpg'),
  JewelryOrder(
      serialNumber: 'A45DF654357',
      grossWeight: 56.965,
      netWeight: 48.605,
      piece: 1,
      total: 248.605,
      image:
          'https://static.ebayinc.com/static/assets/Uploads/Stories/Articles/_resampled/ScaleWidthWyI4MDAiXQ/ebay-authenticity-guarantee-fine-jewelry.jpg'),
  JewelryOrder(
      serialNumber: 'A45DF654357',
      grossWeight: 56.965,
      netWeight: 48.605,
      piece: 1,
      total: 248.605,
      image:
          'https://static.ebayinc.com/static/assets/Uploads/Stories/Articles/_resampled/ScaleWidthWyI4MDAiXQ/ebay-authenticity-guarantee-fine-jewelry.jpg'),
  // Add more items as needed
];

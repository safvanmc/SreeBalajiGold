import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/second_catagory/presentation/view/widgets/second_catagory_frame.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/app_bar.dart';

class SecondCatagoryScreen extends StatelessWidget {
  const SecondCatagoryScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      appBar: CommonAppBar(title: title),
      body: const CustomScrollView(
        slivers: [
          SliverGap(15),
          SecondCatagoryFrame(),
        ],
      ),
    );
  }
}

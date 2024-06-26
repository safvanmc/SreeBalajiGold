import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/home/presentation/view/widgets/home_banner.dart';
import 'package:sree_balagi_gold/features/home/presentation/view/widgets/horizontal_buttons.dart';
import 'package:sree_balagi_gold/features/second_catagory/presentation/view/widgets/second_catagory_frame.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeBanner(),
        ),
        SliverHorizontalButtons(),
        SecondCatagoryFrame(),
        SliverGap(80)
      ],
    );
  }
}

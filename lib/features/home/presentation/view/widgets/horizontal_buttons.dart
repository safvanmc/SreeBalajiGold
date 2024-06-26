import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/home/presentation/provider/home_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class SliverHorizontalButtons extends StatelessWidget {
  const SliverHorizontalButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(15),
      sliver: SliverToBoxAdapter(
        child: Consumer<HomeProvider>(
          builder: (context, state, child) => SizedBox(
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          state.buttonIndex == index ? secondaryColor : null),
                      //  Colors.transparent
                      side: WidgetStatePropertyAll(
                          BorderSide(color: primaryColor.withOpacity(0.5))),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                    ),
                    onPressed: () {
                      state.buttonChange(index);
                    },
                    child: Text(
                      'Jwellery',
                      style: appTextTheme.displayMedium!.copyWith(
                          color:
                              state.buttonIndex == index ? kwhiteColor : null,
                          decoration: TextDecoration.none),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Gap(5),
                itemCount: 4),
          ),
        ),
      ),
    );
  }
}

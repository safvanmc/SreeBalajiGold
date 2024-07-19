import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/main_category/data/model/main_category_model.dart';
import 'package:sree_balagi_gold/features/main_category/presentation/provider/main_category_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';

class MaincategoryHorizontalButtons extends StatefulWidget {
  const MaincategoryHorizontalButtons({
    super.key,
    required this.onChange,
  });
  final void Function(MainCategoryModel) onChange;

  @override
  State<MaincategoryHorizontalButtons> createState() =>
      _MaincategoryHorizontalButtonsState();
}

class _MaincategoryHorizontalButtonsState
    extends State<MaincategoryHorizontalButtons> {
  ScrollController mainCategoryScrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final state = context.read<MainCategoryProvider>();
        await state.initData(
          context: context,
          scrollController: mainCategoryScrollController,
        );
        if (state.mainCategoryList.isNotEmpty) {
          state.onChangeHomeMainCategory(
            state.mainCategoryList[0],
          );
          widget.onChange.call(
            state.mainCategoryList[0],
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      sliver: SliverToBoxAdapter(
        child: Consumer<MainCategoryProvider>(
          builder: (context, state, _) => SizedBox(
            height: 40,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              controller: mainCategoryScrollController,
              itemCount: state.mainCategoryList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      state.selectedHomeMainCategory?.id ==
                              state.mainCategoryList[index].id
                          ? AppColors.secondaryColor
                          : null,
                    ),
                    //  Colors.transparent
                    side: WidgetStatePropertyAll(
                      BorderSide(
                        color: AppColors.primaryColor.withOpacity(0.5),
                      ),
                    ),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                  ),
                  onPressed: () {
                    widget.onChange(
                      state.mainCategoryList[index],
                    );
                    state.onChangeHomeMainCategory(
                      state.mainCategoryList[index],
                    );
                  },
                  child: Text(
                    state.mainCategoryList[index].name,
                    style: appTextTheme.displayMedium!.copyWith(
                        color: state.selectedHomeMainCategory?.id ==
                                state.mainCategoryList[index].id
                            ? AppColors.kwhiteColor
                            : null,
                        decoration: TextDecoration.none),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Gap(5),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/banner/presentation/view/home_banner.dart';
import 'package:sree_balagi_gold/features/category_product_display/presentation/view/category_product_display_screen.dart';
import 'package:sree_balagi_gold/features/home/presentation/view/widgets/main_category_horizontal_buttons.dart';
import 'package:sree_balagi_gold/features/main_category/presentation/provider/main_category_provider.dart';
import 'package:sree_balagi_gold/features/sub_category/presentation/provider/sub_category_provider.dart';
import 'package:sree_balagi_gold/features/sub_category/presentation/view/widgets/sub_category_frame.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/widgets/custom_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer2<SubCategoryProvider, MainCategoryProvider>(
        builder: (context, stateSubCategory, stateMainCategory, _) {
      return CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeBanner(),
          ),
          MaincategoryHorizontalButtons(
            onChange: (mainGategory) {
              context.read<SubCategoryProvider>()
                ..clearData()
                ..initData(
                  context: context,
                  scrollController: scrollController,
                  mainCategoryID: mainGategory.id!,
                );
            },
          ),
          stateMainCategory.isLoading
              ? const SliverFillRemaining(
                  fillOverscroll: true,
                  child: CLoading(),
                )
              : stateMainCategory.mainCategoryList.isEmpty
                  ? const SliverFillRemaining(
                      fillOverscroll: true,
                      child: Center(
                        child: Text('No category available!'),
                      ),
                    )
                  : stateSubCategory.isLoading
                      ? const SliverFillRemaining(
                          fillOverscroll: true,
                          child: CLoading(),
                        )
                      : stateSubCategory.subCategoryList.isEmpty
                          ? const SliverFillRemaining(
                              fillOverscroll: true,
                              child: Center(
                                child: Text('No category available!'),
                              ),
                            )
                          : SliverPadding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              sliver: SliverGrid.builder(
                                itemCount:
                                    stateSubCategory.subCategoryList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1 / 1.3,
                                ),
                                itemBuilder: (context, index) {
                                  return SubCategoryFrame(
                                    categoryModel:
                                        stateSubCategory.subCategoryList[index],
                                    onTap: () {
                                      EasyNavigator.push(
                                        context,
                                        child: CategoryProductDisplayScreen(
                                          subCategoryModel: stateSubCategory
                                              .subCategoryList[index],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
          if (stateSubCategory.isMoreDataLoading &&
              stateSubCategory.subCategoryList.isNotEmpty)
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
      );
    });
  }
}

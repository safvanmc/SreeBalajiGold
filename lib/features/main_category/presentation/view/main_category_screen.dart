import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/main_category/presentation/provider/main_category_provider.dart';
import 'package:sree_balagi_gold/features/main_category/presentation/view/widgets/main_category_frame.dart';
import 'package:sree_balagi_gold/features/sub_category/presentation/view/sub_category_screen.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_loading.dart';

class MainCategoryScreen extends StatefulWidget {
  const MainCategoryScreen({super.key});

  @override
  State<MainCategoryScreen> createState() => _MainCategoryScreenState();
}

class _MainCategoryScreenState extends State<MainCategoryScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<MainCategoryProvider>().initData(
              context: context,
              scrollController: scrollController,
            );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainCategoryProvider>(builder: (context, state, _) {
      return CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ListTile(
              tileColor: AppColors.primaryColor.withOpacity(0.3),
              leading: const Icon(
                CupertinoIcons.pin_fill,
                size: 15,
              ),
              titleTextStyle:
                  appTextTheme.bodySmall!.copyWith(color: Colors.black),
              title: const Text(
                'Explore our complete product range! Dial or message on  WhatsApp to view all',
              ),
            ),
          ),
          const SliverGap(20),
          state.isLoading
              ? const SliverFillRemaining(
                  fillOverscroll: true,
                  child: CLoading(),
                )
              : state.mainCategoryList.isEmpty
                  ? const SliverFillRemaining(
                      fillOverscroll: true,
                      child: Center(
                        child: Text('No category available!'),
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      sliver: SliverGrid.builder(
                        itemCount: state.mainCategoryList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1 / 1.3,
                        ),
                        itemBuilder: (context, index) {
                          return MainCategoryFrame(
                            categoryModel: state.mainCategoryList[index],
                            onTap: () {
                              EasyNavigator.push(
                                context,
                                child: SubCategoryScreen(
                                  mainCategoryModel:
                                      state.mainCategoryList[index],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
          if (state.isMoreDataLoading && state.mainCategoryList.isNotEmpty)
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

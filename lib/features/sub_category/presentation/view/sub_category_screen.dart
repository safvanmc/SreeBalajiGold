import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/category_product_display/presentation/view/category_product_display_screen.dart';
import 'package:sree_balagi_gold/features/main_category/data/model/main_category_model.dart';
import 'package:sree_balagi_gold/features/sub_category/presentation/provider/sub_category_provider.dart';
import 'package:sree_balagi_gold/features/sub_category/presentation/view/widgets/sub_category_frame.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/custom_loading.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({
    super.key,
    required this.mainCategoryModel,
  });
  final MainCategoryModel mainCategoryModel;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<SubCategoryProvider>()
          ..clearData()
          ..initData(
            context: context,
            scrollController: scrollController,
            mainCategoryID: widget.mainCategoryModel.id!,
          );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SubCategoryProvider>(builder: (context, state, _) {
      return Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: AppColors.primaryColor,
              title: Text(
                widget.mainCategoryModel.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SliverGap(20),
            state.isLoading
                ? const SliverFillRemaining(
                    fillOverscroll: true,
                    child: CLoading(),
                  )
                : state.subCategoryList.isEmpty
                    ? const SliverFillRemaining(
                        fillOverscroll: true,
                        child: Center(
                          child: Text('No category available!'),
                        ),
                      )
                    : SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        sliver: SliverGrid.builder(
                          itemCount: state.subCategoryList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1 / 1.3,
                          ),
                          itemBuilder: (context, index) {
                            return SubCategoryFrame(
                              categoryModel: state.subCategoryList[index],
                              onTap: () {
                                EasyNavigator.push(
                                  context,
                                  child: CategoryProductDisplayScreen(
                                    subCategoryModel:
                                        state.subCategoryList[index],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
            if (state.isMoreDataLoading && state.subCategoryList.isNotEmpty)
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
        ),
      );
    });
  }
}

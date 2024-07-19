import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/category_product_display/presentation/provider/category_product_provider.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/view/product_detail_screen.dart';
import 'package:sree_balagi_gold/features/sub_category/data/model/sub_category_model.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/custom_loading.dart';
import 'package:sree_balagi_gold/general/widgets/product_frame.dart';

class CategoryProductDisplayScreen extends StatefulWidget {
  const CategoryProductDisplayScreen({
    super.key,
    required this.subCategoryModel,
  });
  final SubCategoryModel subCategoryModel;

  @override
  State<CategoryProductDisplayScreen> createState() =>
      _CategoryProductDisplayScreenState();
}

class _CategoryProductDisplayScreenState
    extends State<CategoryProductDisplayScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<CategoryProductProvider>()
          ..clearData()
          ..initData(
            context: context,
            subCategoryid: widget.subCategoryModel.id!,
            scrollController: scrollController,
          );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CategoryProductProvider>(builder: (context, state, _) {
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: AppColors.primaryColor,
              title: Text(
                widget.subCategoryModel.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // const SliverGap(20),
            state.isLoading
                ? const SliverFillRemaining(
                    fillOverscroll: true,
                    child: CLoading(),
                  )
                : state.productList.isEmpty
                    ? const SliverFillRemaining(
                        fillOverscroll: true,
                        child: Center(
                          child: Text('No products available!'),
                        ),
                      )
                    : SliverPadding(
                        padding: const EdgeInsets.all(10),
                        sliver: SliverList.builder(
                          itemCount: state.productList.length,
                          itemBuilder: (context, index) {
                            return ProductFrame(
                              productModel: state.productList[index],
                              onTap: () {
                                EasyNavigator.push(
                                  context,
                                  child: ProductDetailScreen(
                                    secondCategoryName:
                                        widget.subCategoryModel.name,
                                    productModel: state.productList[index],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
            if (state.isMoreDataLoading && state.productList.isNotEmpty)
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
      }),
    );
  }
}

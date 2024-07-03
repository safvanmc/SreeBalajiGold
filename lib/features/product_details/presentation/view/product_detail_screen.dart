import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/view/widgets/horizontal_image_view.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/view/widgets/material_detail_frame.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/view/widgets/product_image_view.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/view/widgets/productdetails_tabview.dart';
import 'package:sree_balagi_gold/features/sub_category/data/model/sub_category_model.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';

import 'package:sree_balagi_gold/general/utils/text_style.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.subCategoryModel,
    required this.productModel,
  });
  final SubCategoryModel subCategoryModel;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(235, 255, 255, 255),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: AppColors.primaryColor,
          title: Text(
            subCategoryModel.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            //banner section//
            SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  color: AppColors.kwhiteColor,
                  child: Column(
                    children: [
                      ProductImageView(
                        productModel: productModel,
                      ),
                      const Gap(5),
                      if (productModel.productUrl.length > 1)
                        HorizontalImageViewFrame(
                          productModel: productModel,
                        ),
                    ],
                  )),
            ),
            const SliverGap(5),
            SliverToBoxAdapter(
              // hasScrollBody: false,
              child: Container(
                height: 420,
                color: AppColors.kwhiteColor,
                child: Column(
                  children: [
                    TabBar(
                      tabAlignment: TabAlignment.fill,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: appTextTheme.labelMedium!
                          .copyWith(color: AppColors.primaryColor),
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.zero,
                        insets: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                      ),
                      tabs: const [
                        SizedBox(
                          height: 60,
                          child: Center(
                            child: Text('Product Details'),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: Center(
                            child: Text(
                              'Materials Details',
                            ),
                          ),
                        ),
                      ],
                    ),
                     Expanded(
                      child: TabBarView(children: [
                        ProductDetailTabView(
                          productModel: productModel,
                        ),
                        MaterialDetailFrame(
                          productModel: productModel,
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        // bottomNavigationBar: const BottomCartButton(),
      ),
    );
  }
}

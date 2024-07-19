import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/cart_screen.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/view/widgets/horizontal_image_view.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/view/widgets/material_detail_frame.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/view/widgets/product_image_view.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/view/widgets/productdetails_tabview.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/add_cart_button.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.secondCategoryName,
    required this.productModel,
  });
  final String secondCategoryName;
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
            secondCategoryName,
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
        bottomNavigationBar: Container(
          height: 65,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: AddToCartButton(
            onPressed: () {
              if (context.read<AuthProvider>().userModel!.cart!.any(
                    (map) => map.containsKey(productModel.id),
                  )) {
                EasyNavigator.push(context,
                    child: const CartScreen(
                      needAppBar: true,
                    ));
              } else {
                context.read<CartProvider>().addtoCart(
                      context,
                      productModel,
                    );
              }
            },
            height: 45,
            width: 100,
            addIcon: Icons.shopping_cart_outlined,
            removeIcon: Icons.shopping_cart_outlined,
            remove: 'GO TO CART',
            add: 'ADD TO CART',
            productModel: productModel,
          ),
        ),
      ),
    );
  }
}

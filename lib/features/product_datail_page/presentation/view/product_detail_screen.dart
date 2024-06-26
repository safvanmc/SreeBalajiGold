import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sree_balagi_gold/features/product_datail_page/presentation/view/widgets/bottom_cart_button.dart';
import 'package:sree_balagi_gold/features/product_datail_page/presentation/view/widgets/horizontal_image_view.dart';
import 'package:sree_balagi_gold/features/product_datail_page/presentation/view/widgets/material_detail_frame.dart';
import 'package:sree_balagi_gold/features/product_datail_page/presentation/view/widgets/product_banner.dart';
import 'package:sree_balagi_gold/features/product_datail_page/presentation/view/widgets/productdetails_tabview.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/app_bar.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(235, 255, 255, 255),
        appBar: CommonAppBar(
          title: title,
        ),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            //banner section//
            SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  color: kwhiteColor,
                  child: const Column(
                    children: [
                      ProductBannerFrame(),
                      Gap(5),
                      HorizontalImageViewFrame(),
                    ],
                  )),
            ),
            const SliverGap(5),
            SliverToBoxAdapter(
              // hasScrollBody: false,
              child: Container(
                height: 420,
                color: kwhiteColor,
                child: Column(
                  children: [
                    TabBar(
                      tabAlignment: TabAlignment.fill,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: appTextTheme.labelMedium!
                          .copyWith(color: primaryColor),
                      indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(color: primaryColor, width: 4),
                          borderRadius: BorderRadius.zero,
                          insets: EdgeInsets.symmetric(horizontal: 15)),
                      tabs: const [
                        SizedBox(
                            height: 60,
                            child: Center(child: Text('Product Details'))),
                        SizedBox(
                            height: 60,
                            child: Center(child: Text('Materials Details')))
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(children: [
                        ProductDetailTabView(),
                        MaterialDetailFrame()
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomCartButton(),
      ),
    );
  }
}

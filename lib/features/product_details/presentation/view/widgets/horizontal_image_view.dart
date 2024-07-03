import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/provider/product_detail_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/custom_network_image.dart';


class HorizontalImageViewFrame extends StatelessWidget {
  const HorizontalImageViewFrame({
    super.key, required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(
      builder: (context, state, child) => SizedBox(
        height: 100,
        child: ListView.separated(

          separatorBuilder: (context, index) => const Gap(5),
          itemCount: productModel.productUrl.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              state.updateBannerIndex(index);
            },
            child: Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.antiAlias,
              // margin: const EdgeInsets.all(2.0),
              padding: state.activeIndex == index
                  ? const EdgeInsets.all(4.0)
                  : const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  // /borderRadius: BorderRadius.circular(6),
                  border: state.activeIndex == index
                      ? Border.all(color: AppColors.secondaryColor)
                      : Border.all(color: Colors.transparent)),
              child:  CNetworkImage(
                boxFit: BoxFit.cover,
                url:
                    productModel.productUrl[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

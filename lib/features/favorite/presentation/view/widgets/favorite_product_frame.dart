import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/features/favorite/presentation/provider/favorite_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_network_image.dart';

class FavoriteProductFrame extends StatelessWidget {
  const FavoriteProductFrame({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
          decoration: BoxDecoration(
            color: AppColors.kwhiteColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0x35000000),
                blurRadius: 3,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CNetworkImage(
                  url: productModel.productUrl[0],
                  width: 140,
                  height: 140,
                  boxFit: BoxFit.cover,
                ),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          productModel.serialNumber,
                          style: appTextTheme.displayMedium!.copyWith(
                            color: AppColors.secondaryColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    ProductTestDetails(
                      title: 'Gross Weight:',
                      value: productModel.grossWeight.toString(),
                    ),
                    const Gap(4),
                    ProductTestDetails(
                      title: 'Net Weight:',
                      value: productModel.netWeight.toString(),
                    ),
                    const Gap(4),
                    ProductTestDetails(
                      title: 'Piece:',
                      value: productModel.pieces.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: Consumer<FavoriteProvider>(
            builder: (context, state, _) => IconButton.filled(
                color: AppColors.primaryColor,
                highlightColor: AppColors.kwhiteColor,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.kwhiteColor,
                  ),
                ),
                onPressed: () {
                  if (state.isFavorite(context, productModel: productModel)) {
                    state.removeFavorite(
                      context,
                      productModel: productModel,
                    );
                  } else {
                    state.addFavorite(
                      context,
                      productModel: productModel,
                    );
                  }
                },
                icon: Icon(
                  state.isFavorite(context, productModel: productModel)
                      ? Icons.favorite_outlined
                      : Icons.favorite_outline_sharp,
                )),
          ),
        ),
      ],
    );
  }
}

class ProductTestDetails extends StatelessWidget {
  const ProductTestDetails({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.80,
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Gap(2),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}

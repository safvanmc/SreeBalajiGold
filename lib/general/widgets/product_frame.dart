import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/features/favorite/presentation/provider/favorite_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/add_cart_button.dart';
import 'package:sree_balagi_gold/general/widgets/custom_network_image.dart';

class ProductFrame extends StatelessWidget {
  const ProductFrame({
    super.key,
    required this.productModel,
    required this.onTap,
  });
  final ProductModel productModel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 8,
                right: 8,
                top: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CNetworkImage(
                        url: productModel.productUrl[0],
                        boxFit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: 'Serial No:  ',
                                    style: TextStyle(
                                      color: const Color(0xFF333333)
                                          .withOpacity(.8),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: productModel.serialNumber,
                                        style: const TextStyle(
                                          color: Color(0xFF333333),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ]),
                              ),
                              const Gap(2),
                              RichText(
                                text: TextSpan(
                                  text: 'Gross Weight:  ',
                                  style: TextStyle(
                                    color:
                                        const Color(0xFF333333).withOpacity(.8),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${productModel.grossWeight}',
                                      style: const TextStyle(
                                        color: Color(0xFF333333),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(2),
                              RichText(
                                text: TextSpan(
                                  text: 'Net Weight:  ',
                                  style: TextStyle(
                                    color:
                                        const Color(0xFF333333).withOpacity(.8),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${productModel.netWeight}',
                                      style: const TextStyle(
                                        color: Color(0xFF333333),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(2),
                        AddToCartButton(
                          onPressed: () {
                            if (context
                                .read<AuthProvider>()
                                .userModel!
                                .cart!
                                .any((map) =>
                                    map.containsKey(productModel.id))) {
                              context.read<CartProvider>().removeFromCart(
                                  context,
                                  productId: productModel.id);
                            } else {
                              context
                                  .read<CartProvider>()
                                  .addtoCart(context, productModel);
                            }
                          },
                          productModel: productModel,
                          add: 'Add',
                          remove: 'Remove',
                          removeIcon: CupertinoIcons.delete,
                          addIcon: Icons.shopping_cart_outlined,
                          height: 35,
                          width: 80,
                        )
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
                builder: (context, state, child) => IconButton.filled(
                    color: AppColors.primaryColor,
                    highlightColor: AppColors.kwhiteColor,
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.kwhiteColor,
                      ),
                    ),
                    onPressed: () {
                      if (state.isFavorite(context,
                          productModel: productModel)) {
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
        ),
      ),
    );
  }
}

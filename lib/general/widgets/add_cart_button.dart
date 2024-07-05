import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    this.width = double.infinity,
    required this.height,
    required this.productModel,
  });
  final double? width;
  final double? height;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, state, _) {
        return CButton(
          height: height,
          width: width,
          color: AppColors.primaryColor,
          child: Row(
            children: [
              Icon(
                context
                        .watch<AuthProvider>()
                        .userModel!
                        .cart!
                        .any((map) => map.containsKey(productModel.id))
                    ? CupertinoIcons.delete
                    : Icons.shopping_cart_outlined,
                color: AppColors.kwhiteColor,
                size: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  context
                          .watch<AuthProvider>()
                          .userModel!
                          .cart!
                          .any((map) => map.containsKey(productModel.id))
                      ? 'Remove'
                      : 'Add',
                  style: appTextTheme.labelLarge!.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          onPressed: () {
            if (context
                .read<AuthProvider>()
                .userModel!
                .cart!
                .any((map) => map.containsKey(productModel.id))) {
              // context
              //     .read<CartProvider>()
              //     .removeFromCart(context, productModel);
            } else {
              context.read<CartProvider>().addtoCart(context, productModel);
            }
          },
        );
      },
    );
  }
}

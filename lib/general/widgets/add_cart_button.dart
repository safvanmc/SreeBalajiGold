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
    required this.remove,
    required this.add,
    this.addIcon,
    this.removeIcon,
    required this.onPressed,
  });
  final IconData? addIcon;
  final IconData? removeIcon;

  final String remove;
  final String add;
  final double? width;
  final double? height;
  final ProductModel productModel;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, state, _) {
        return CButton(
            height: height,
            width: width,
            color: AppColors.kBottonColor,
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  context
                          .watch<AuthProvider>()
                          .userModel!
                          .cart!
                          .any((map) => map.containsKey(productModel.id))
                      ? removeIcon
                      : addIcon,
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
                        ? remove
                        : add,
                    style: appTextTheme.labelLarge!.copyWith(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}

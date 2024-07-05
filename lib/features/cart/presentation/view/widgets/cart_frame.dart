import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/cart/data/model/cart_model.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/add_remark_frame.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/icon_button.dart';
import 'package:sree_balagi_gold/general/widgets/custom_Row.dart';
import 'package:sree_balagi_gold/general/widgets/custom_network_image.dart';

class CartFrame extends StatelessWidget {
  const CartFrame({
    super.key,
    required this.data,
  });
  final CartModel data;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, state, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //image section //
                CNetworkImage(
                  url: data.productUrl[0],
                  width: 100,
                  height: 120,
                  boxFit: BoxFit.cover,
                ),
                const Gap(15),
                //center part//
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data.serialNumber,
                            style: const TextStyle(
                              color: Color(0xFF4B3A50),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              CupertinoIcons.delete,
                              size: 17,
                            ),
                            onPressed: () {
                              state.removeFromCart(context, productId: data.id);
                            },
                          ),
                        ],
                      ),
                      const Gap(11),
                      CRowWidget(
                          keyvalue: 'Gross Weight:',
                          widget: '${data.grossWeight}'),
                      const Gap(10),
                      CRowWidget(
                          keyvalue: 'Net Weight:', widget: '${data.netWeight}'),
                      const Gap(10),
                      CRowWidget(keyvalue: 'Piece:', widget: '${data.pieces}'),
                      const Gap(10),
                      // CRowWidget(keyvalue: 'Total:', widget: '${data.total}'),
                      // const Gap(10),
                      const CRowWidget(keyvalue: 'Statust:', widget: '${1222}'),
                      const Gap(10),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  iconAlignment: IconAlignment.start,
                  style: const ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
                  onPressed: () {
                    addRemarkFrame(context);
                  },
                  icon: const Icon(IconlyLight.editSquare,
                      size: 15, color: Colors.black),
                  label: const Text(
                    'Add a remark',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      height: 0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CIconButton(
                      icon: Icons.remove,
                      ontap: () {
                        state.removeQty(
                          context,
                          cartModel: data,
                        );
                      },
                    ),
                    const Gap(15),
                    Text(
                      data.qty.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const Gap(15),
                    CIconButton(
                      icon: Icons.add,
                      ontap: () {
                        state.addQty(
                          context,
                          cartModel: data,
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}

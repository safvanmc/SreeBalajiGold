import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/screens/cart_screen.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/cart_icon_button.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/custom_dialog.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/row_text_fram.dart';
import 'package:sree_balagi_gold/general/utils/text_style.dart';
import 'package:sree_balagi_gold/general/widgets/custom_cachednetwork_image.dart';

class OrderdetailFrame extends StatefulWidget {
  final JewelryOrder order;

  const OrderdetailFrame({super.key, required this.order});

  @override
  OrderdetailFrameState createState() => OrderdetailFrameState();
}

class OrderdetailFrameState extends State<OrderdetailFrame> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewprovider>(builder: (context, state, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //image section //
              CustomCachedNetworkImage(
                url: widget.order.image,
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
                        Text(widget.order.serialNumber,
                            style: appTextTheme.bodyMedium!
                                .copyWith(color: Colors.black)),
                        IconButton(
                          icon: const Icon(
                            CupertinoIcons.delete,
                            size: 17,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const Gap(11),
                    Rowwidget(
                        keyvalue: 'Gross Weight:',
                        widget: '${widget.order.grossWeight}'),
                    const Gap(10),
                    Rowwidget(
                        keyvalue: 'Net Weight: ',
                        widget: '${widget.order.netWeight}'),
                    const Gap(10),
                    Rowwidget(
                        keyvalue: 'Piece: ', widget: '${widget.order.piece}'),
                    const Gap(10),
                    Rowwidget(
                        keyvalue: 'Total:', widget: '${widget.order.total}'),
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
                  showDialogCustom(context);
                },
                icon: const Icon(IconlyLight.editSquare,
                    size: 15, color: Colors.black),
                label: Text(
                  'Add a remark',
                  style: appTextTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.underline, fontSize: 13),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButtonCart(
                    icon: Icons.remove,
                    ontap: () {
                      state.onLess();
                    },
                  ),
                  const Gap(15),
                  Text(
                    state.count.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const Gap(15),
                  IconButtonCart(
                    icon: Icons.add,
                    ontap: () {
                      state.onAdd();
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}

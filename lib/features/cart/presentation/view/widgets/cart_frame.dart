import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/cart/data/model/cart_model.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/add_remark_frame.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/icon_button.dart';
import 'package:sree_balagi_gold/general/widgets/confirm_dialog.dart';
import 'package:sree_balagi_gold/general/widgets/custom_Row.dart';
import 'package:sree_balagi_gold/general/widgets/custom_network_image.dart';

class CartFrame extends StatefulWidget {
  const CartFrame({
    super.key,
    required this.data,
  });
  final CartModel data;

  @override
  State<CartFrame> createState() => _CartFrameState();
}

class _CartFrameState extends State<CartFrame> {
  TextEditingController remarks = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, state, _) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //image section //
                    CNetworkImage(
                      url: widget.data.productUrl.first,
                      width: 100,
                      height: 100,
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
                                widget.data.serialNumber,
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
                                  final nav = Navigator.of(context);
                                  confirmDialog(
                                    context,
                                    onPressed: () async {
                                      await state.removeFromCart(
                                        context,
                                        productId: widget.data.id,
                                      );
                                      nav.pop();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          const Gap(11),
                          CRowWidget(
                              keyvalue: 'Gross Weight(g):',
                              data: '${widget.data.grossWeight}'),
                          const Gap(10),
                          CRowWidget(
                              keyvalue: 'Net Weight(g):',
                              data: '${widget.data.netWeight}'),
                          const Gap(10),
                          // CRowWidget(
                          //   keyvalue: 'Piece in stock:',
                          //   data: '${widget.data.pieces}',
                          // ),
                          // const Gap(10),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.data.remark == null
                        ? TextButton.icon(
                            iconAlignment: IconAlignment.start,
                            style: const ButtonStyle(
                                splashFactory: NoSplash.splashFactory,
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.all(0))),
                            onPressed: () {
                              addRemarkFrame(
                                context,
                                onPressed: () async {
                                  final nav = Navigator.of(context);
                                  if (key.currentState!.validate()) {
                                    await state.addremarks(
                                      context,
                                      cartModel: widget.data,
                                      remarks: remarks.text,
                                    );
                                  }
                                  nav.pop();
                                },
                                controller: remarks,
                                formKey: key,
                              );
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
                          )
                        : Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  addRemarkFrame(
                                    context,
                                    onPressed: () async {
                                      final nav = Navigator.of(context);
                                      if (key.currentState!.validate()) {
                                        await state.addremarks(
                                          context,
                                          cartModel: widget.data,
                                          remarks: remarks.text,
                                        );
                                      }
                                      nav.pop();
                                    },
                                    controller: remarks,
                                    formKey: key,
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  width: 100,
                                  height: 20,
                                  child: Text(
                                    widget.data.remark!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  CupertinoIcons.multiply,
                                  size: 17,
                                ),
                                onPressed: () {
                                  state.removeRemark(context,
                                      cartModel: widget.data);
                                },
                              ),
                            ],
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CIconButton(
                          icon: Icons.remove,
                          ontap: () {
                            state.removeQty(
                              context,
                              cartModel: widget.data,
                            );
                          },
                        ),
                        const Gap(15),
                        Text(
                          widget.data.qty.toString(),
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
                              cartModel: widget.data,
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
      },
    );
  }
}

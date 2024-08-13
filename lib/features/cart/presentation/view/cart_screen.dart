import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/placed_order_screen.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/bottom_section.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/cart_frame.dart';
import 'package:sree_balagi_gold/features/favorite/presentation/view/favorite_product_display_screen.dart';
import 'package:sree_balagi_gold/general/service/easy_navigator.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/utils/app_icons.dart';
import 'package:sree_balagi_gold/general/widgets/confirm_dialog.dart';
import 'package:sree_balagi_gold/general/widgets/custom_loading.dart';
import 'package:sree_balagi_gold/general/widgets/show_progress.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
    this.needAppBar = false,
  });
  final bool needAppBar;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartProvider>()
      ..clearData()
      ..fetchData(context);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<CartProvider>()
    //     ..clearData()
    //     ..fetchData(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.needAppBar == true
          ? AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: AppColors.primaryColor,
              title: Center(
                child: SizedBox(
                  height: 45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage(
                        AppIcons.appIcon,
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    EasyNavigator.push(
                      context,
                      child: const FavoriteProductDisplayScreen(),
                    );
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const Gap(5),
              ],
            )
          : null,
      body: Consumer<CartProvider>(
        builder: (context, state, child) {
          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    state.isLoading
                        ? const SliverFillRemaining(
                            fillOverscroll: true,
                            child: CLoading(),
                          )
                        : state.cartList.isEmpty
                            ? const SliverFillRemaining(
                                fillOverscroll: true,
                                child: Center(child: Text('No items!')),
                              )
                            : SliverList.builder(
                                itemCount: state.cartList.length,
                                itemBuilder: (context, index) {
                                  final data = state.cartList[index];
                                  return CartFrame(data: data);
                                },
                              ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                  ],
                ),
              ),
              !state.isLoading && state.cartList.isNotEmpty
                  ? TotalPriceSection(
                      onPressed: () {
                        confirmDialog(
                          context,
                          onPressed: () async {
                            EasyNavigator.pop(context);
                            showProgress(context);
                            await state.placedOrder(
                              context,
                              success: () {
                                EasyNavigator.push(
                                  context,
                                  child: const OrderPlacedScreen(),
                                );
                              },
                            );
                          },
                        );
                      },
                    )
                  : const SizedBox()
            ],
          );
        },
      ),
    );
  }
}

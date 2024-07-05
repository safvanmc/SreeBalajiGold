import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/provider/cart_provider.dart';
import 'package:sree_balagi_gold/features/cart/presentation/view/widgets/cart_frame.dart';
import 'package:sree_balagi_gold/general/widgets/custom_loading.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartProvider>()
        ..clearData()
        ..fetchData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, state, child) => CustomScrollView(
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
    );
  }
}

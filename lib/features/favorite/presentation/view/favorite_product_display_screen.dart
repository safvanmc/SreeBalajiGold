import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/auth/presentation/provider/auth_provider.dart';
import 'package:sree_balagi_gold/features/favorite/presentation/provider/favorite_provider.dart';
import 'package:sree_balagi_gold/features/favorite/presentation/view/widgets/favorite_product_frame.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/custom_loading.dart';

class FavoriteProductDisplayScreen extends StatefulWidget {
  const FavoriteProductDisplayScreen({super.key});

  @override
  State<FavoriteProductDisplayScreen> createState() =>
      _FavoriteProductDisplayScreenState();
}

class _FavoriteProductDisplayScreenState
    extends State<FavoriteProductDisplayScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final productIds =
            context.read<AuthProvider>().userModel?.favorites ?? [];
        context.read<FavoriteProvider>().init(
              context,
              scrollController: scrollController,
              productIds: productIds,
            );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavoriteProvider>(builder: (context, state, _) {
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            const SliverAppBar(
              pinned: true,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: AppColors.primaryColor,
              title: Text(
                'Wishlists',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            (state.isLoading && state.list.isEmpty)
                ? const SliverFillRemaining(
                    fillOverscroll: true,
                    child: CLoading(),
                  )
                : state.list.isEmpty
                    ? const SliverFillRemaining(
                        fillOverscroll: true,
                        child: Center(
                          child: Text('No data found!'),
                        ),
                      )
                    : SliverList.builder(
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return FavoriteProductFrame(
                            productModel: state.list[index],
                          );
                        },
                      ),
            if (state.isLoading && state.list.isNotEmpty)
              const SliverToBoxAdapter(
                child: CLoading(),
              )
            else
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
          ],
        );
      }),
    );
  }
}

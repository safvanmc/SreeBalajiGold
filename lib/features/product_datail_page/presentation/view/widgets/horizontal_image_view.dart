import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sree_balagi_gold/features/product_datail_page/presentation/provider/product_detail_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/custom_cachednetwork_image.dart';

class HorizontalImageViewFrame extends StatelessWidget {
  const HorizontalImageViewFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(
      builder: (context, state, child) => SizedBox(
        height: 100,
        child: ListView.separated(
          separatorBuilder: (context, index) => const Gap(5),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              state.updateBannerIndex(index);
            },
            child: Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.antiAlias,
              // margin: const EdgeInsets.all(2.0),
              padding: state.activeIndex == index
                  ? const EdgeInsets.all(4.0)
                  : const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  // /borderRadius: BorderRadius.circular(6),
                  border: state.activeIndex == index
                      ? Border.all(color: secondaryColor)
                      : Border.all(color: Colors.transparent)),
              child: const CustomCachedNetworkImage(
                boxFit: BoxFit.fill,
                url:
                    'https://th.bing.com/th/id/R.bb6d762df035d5e6ea69f87f85df45dd?rik=RGAzOcyG3n87fw&pid=ImgRaw&r=0',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

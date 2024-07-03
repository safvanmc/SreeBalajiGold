import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sree_balagi_gold/features/banner/presentation/provider/banner_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';
import 'package:sree_balagi_gold/general/widgets/custom_network_image.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BannerProvider>(
      builder: (context, state, _) => Stack(
        alignment: Alignment.center,
        children: [
          if (state.list.isNotEmpty)
            CarouselSlider(
                items: state.list
                    .map(
                      (item) => CNetworkImage(
                        url: item.bannerUrl,
                        boxFit: BoxFit.cover,
                      ),
                    )
                    .toList(),
                carouselController: state.carouselController,
                
                options: CarouselOptions(
                  scrollPhysics: state.list.length>1?null:const NeverScrollableScrollPhysics(),
                  autoPlay:state.list.length>1?true:false,
                  autoPlayCurve: Curves.easeOut,
                  initialPage: state.currentIndex,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  autoPlayInterval: const Duration(milliseconds: 4000),
                  disableCenter: true,
                  animateToClosest: false,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    state.onBannerChange(index);
                  },
                )),
          if (state.list.length>1)
            Positioned(
              bottom: 5,
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: const BoxDecoration(
                  // color: AppColors.primaryColorB.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: AnimatedSmoothIndicator(
                  activeIndex: state.currentIndex,
                  count: state.list.length,
                  effect: const ScaleEffect(
                    activeStrokeWidth: 1.5,
                    scale: 1.5,
                    dotHeight: 8,
                    dotWidth: 12,
                    activeDotColor: AppColors.secondaryColor,
                    dotColor: AppColors.secondaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

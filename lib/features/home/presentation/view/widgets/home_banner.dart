import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sree_balagi_gold/features/home/data/local_data/slider_images.dart';
import 'package:sree_balagi_gold/features/home/presentation/provider/home_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, state, child) => Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider(
              items: ImageList.imageList
                  .map(
                    (item) => Image.asset(
                      item['image'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                  .toList(),
              carouselController: state.carouselController,
              options: CarouselOptions(
                height: 290,
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                autoPlayCurve: Curves.easeOut,
                initialPage: state.currentIndex,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                autoPlayInterval: const Duration(milliseconds: 5000),
                disableCenter: true,
                // enlargeCenterPage: true,

                animateToClosest: false,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  state.onBannerChange(index);
                },
              )),
          Positioned(
            bottom: 5,
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: const BoxDecoration(
                // color: AppColors.primaryColorB.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: AnimatedSmoothIndicator(
                activeIndex: state.currentIndex,
                count: ImageList.imageList.length,
                effect: const ScaleEffect(
                  activeStrokeWidth: 1.5,

                  scale: 1.5,
                  dotHeight: 8,
                  dotWidth: 12,

                  activeDotColor: secondaryColor,
                  dotColor: secondaryColor,
                  // paintStyle: PaintingStyle.stroke,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

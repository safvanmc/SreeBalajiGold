import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sree_balagi_gold/features/product_datail_page/presentation/provider/product_detail_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';

class ProductBannerFrame extends StatelessWidget {
  const ProductBannerFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(
      builder: (context, state, child) => Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              CarouselSlider.builder(
                carouselController: state.controller,
                itemCount: 5,
                options: CarouselOptions(
                  height: 250,
                  viewportFraction: 1.0,
                  initialPage: state.activeIndex,
                  enableInfiniteScroll: false,
                  reverse: false,
                  onPageChanged: (index, _) {
                    state.onPageChange(
                      index,
                    );
                  },
                  autoPlayAnimationDuration: const Duration(milliseconds: 400),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (BuildContext context, int itemIndex, _) {
                  return InkWell(
                    onTap: () {
                      _openPhotoView(context, itemIndex);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.zero,
                      // margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 210,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://th.bing.com/th/id/R.bb6d762df035d5e6ea69f87f85df45dd?rik=RGAzOcyG3n87fw&pid=ImgRaw&r=0'))),
                    ),
                  );
                },
              ),
              const Gap(20)
            ],
          ),
          const Positioned(
            top: 10,
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.zoom_in,
                  color: Color.fromARGB(255, 50, 49, 49),
                  size: 20,
                ),
                Text(
                  'tap to zoom',
                  style: TextStyle(
                    color: Color.fromARGB(255, 50, 49, 49),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              // margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: const BoxDecoration(
                // color: AppColors.primaryColorB.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: AnimatedSmoothIndicator(
                activeIndex: state.activeIndex,
                count: 5,
                effect: const ScaleEffect(
                  spacing: 5,
                  activeStrokeWidth: 1,
                  scale: 1.5,
                  dotHeight: 5,
                  dotWidth: 5,

                  activeDotColor: secondaryColor,
                  dotColor: secondaryColor,
                  // paintStyle: PaintingStyle.stroke,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 10,
            child: Consumer<ProductDetailProvider>(
              builder: (context, state, child) => IconButton.filled(
                  color: primaryColor,
                  highlightColor: kwhiteColor,
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(kwhiteColor)),
                  onPressed: () {
                    state.onPressedFavourite();
                  },
                  icon: Icon(
                    state.isTapped
                        ? Icons.favorite_outlined
                        : Icons.favorite_outline_sharp,
                  )),
            ),
          )
        ],
      ),
    );
  }

  //gallary view//
  void _openPhotoView(BuildContext context, int initialIndex) {
    final state = Provider.of<ProductDetailProvider>(context, listen: false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              PhotoViewGallery.builder(
                itemCount: 5,
                pageController: PageController(initialPage: initialIndex),
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: const NetworkImage(
                        'https://th.bing.com/th/id/R.bb6d762df035d5e6ea69f87f85df45dd?rik=RGAzOcyG3n87fw&pid=ImgRaw&r=0'),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    // heroAttributes: PhotoViewHeroAttributes(
                    //   tag: widget.images[index],
                    // ),
                  );
                },
                onPageChanged: (index) {
                  state.onPageChange(index);
                },
                scrollPhysics: const BouncingScrollPhysics(),
                backgroundDecoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                    state.jumpToIndex();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

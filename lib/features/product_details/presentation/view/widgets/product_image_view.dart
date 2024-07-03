import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';
import 'package:sree_balagi_gold/features/favorite/presentation/provider/favorite_provider.dart';
import 'package:sree_balagi_gold/features/product_details/presentation/provider/product_detail_provider.dart';
import 'package:sree_balagi_gold/general/utils/app_color.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailProvider>(
      builder: (context, state, _) => Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              CarouselSlider.builder(
                carouselController: state.controller,
                itemCount: productModel.productUrl.length,
                options: CarouselOptions(
                  aspectRatio: 1,
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
                      _openPhotoView(context, itemIndex, productModel);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.zero,
                      // margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 210,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            productModel.productUrl[itemIndex],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Gap(20)
            ],
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
                count: productModel.productUrl.length,
                effect: const ScaleEffect(
                  spacing: 5,
                  activeStrokeWidth: 1,
                  scale: 1.5,
                  dotHeight: 5,
                  dotWidth: 5,

                  activeDotColor: AppColors.secondaryColor,
                  dotColor: AppColors.secondaryColor,
                  // paintStyle: PaintingStyle.stroke,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 10,
            child: Consumer<FavoriteProvider>(
              builder: (context, state, child) => IconButton.filled(
                  color: AppColors.primaryColor,
                  highlightColor: AppColors.kwhiteColor,
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.kwhiteColor,
                    ),
                  ),
                  onPressed: () {
                    if (state.isFavorite(context, productModel: productModel)) {
                      state.removeFavorite(
                        context,
                        productModel: productModel,
                      );
                    } else {
                      state.addFavorite(
                        context,
                        productModel: productModel,
                      );
                    }
                  },
                  icon: Icon(
                    state.isFavorite(context, productModel: productModel)
                        ? Icons.favorite_outlined
                        : Icons.favorite_outline_sharp,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  //gallary view//
  void _openPhotoView(
      BuildContext context, int initialIndex, ProductModel productModel) {
    final state = Provider.of<ProductDetailProvider>(context, listen: false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              PhotoViewGallery.builder(
                itemCount: productModel.productUrl.length,
                pageController: PageController(initialPage: initialIndex),
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: CachedNetworkImageProvider(
                      productModel.productUrl[index],
                    ),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
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

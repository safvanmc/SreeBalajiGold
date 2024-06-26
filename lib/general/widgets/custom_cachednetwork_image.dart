import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    // this.showIcon = false,
    this.boxFit,
    this.height,
    this.width,
  });

  final String url;
  // final bool showIcon;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      useOldImageOnUrlChange: true,
      imageUrl: url,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) => AspectRatio(
        aspectRatio: 3 / 2,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit ?? BoxFit.cover,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: const Color.fromARGB(255, 230, 228, 228),
        highlightColor: const Color.fromARGB(159, 255, 255, 255),
        child: Container(
          color: const Color.fromARGB(255, 197, 197, 197),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        // showIcon == false ?
        Icons.error
        //  : Icons.person_outline,
        ,
        size: 40,
      ),
    );
  }
}

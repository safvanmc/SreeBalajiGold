import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CNetworkImage extends StatelessWidget {
  const CNetworkImage({
    super.key,
    required this.url,
    this.boxFit,
    this.height,
    this.width,
  });

  final String url;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: boxFit,
      placeholder: (context, url) => Container(
        color: Colors.grey.shade200,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        size: 40,
      ),
    );
  }
}

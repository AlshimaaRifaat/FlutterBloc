import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCategoryImage extends StatelessWidget {
   const CustomCategoryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: 'https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg',
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}

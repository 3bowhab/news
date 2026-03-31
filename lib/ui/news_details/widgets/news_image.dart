import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/extensions/responsive_size_extension.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/ui/news_details/widgets/news_place_holder.dart';

class NewsImage extends StatelessWidget {
  final String imageUrl;
  final bool isValidUrl;

  const NewsImage({
    super.key,
    required this.imageUrl,
    required this.isValidUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: isValidUrl
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.height,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Container(
                    height: 200.height,
                    width: double.infinity,
                    color: AppColors.grey.withValues(alpha: 0.2),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              errorWidget: (context, url, error) => const NewsPlaceholder(),
            )
          : const NewsPlaceholder(),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/extensions/responsive_padding_extension.dart';
import 'package:news/core/extensions/responsive_size_extension.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/models/news_respnse/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final Article article;
  late final DateTime publishedAt = DateTime.parse(
    article.publishedAt ?? '',
  ).subtract(const Duration(minutes: 15));
  NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final String imageUrl = article.urlToImage ?? '';
    final bool isValidUrl = Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false;

    return Container(
      padding: 8.allPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.surface),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: isValidUrl
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.height,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                          height: 200.height,
                          width: double.infinity,
                          color: AppColors.grey.withValues(alpha: 0.2),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    errorWidget: (context, url, error) => buildPlaceholder(),
                  )
                : buildPlaceholder(),
          ),

          10.verticalSizedBox,
          Text(
            article.title ?? '',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),

          10.verticalSizedBox,
          Row(
            children: [
              Expanded(
                child: Text(
                  'By : ${article.author ?? 'Unknown'}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(color: AppColors.grey),
                ),
              ),
              const Spacer(),
              Text(
                timeago.format(publishedAt).toString(),
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPlaceholder() {
    return Container(
      height: 200.height,
      width: double.infinity,
      color: AppColors.grey.withValues(alpha: 0.2),
      child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
    );
  }
}

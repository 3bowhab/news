import 'package:flutter/material.dart';
import 'package:news/core/extensions/responsive_padding_extension.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/models/news_respnse/article.dart';
import 'package:news/providers/language_provider.dart';
import 'package:news/ui/news_details/widgets/news_image.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  final Article article;
  final String imageUrl;
  final bool isValidUrl;

  const NewsCard({
    super.key,
    required this.article,
    required this.imageUrl,
    required this.isValidUrl,
  });

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    
    final publishedAt = DateTime.parse(
      article.publishedAt ?? '',
    ).subtract(const Duration(minutes: 15));

    return Container(
      padding: 8.allPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.surface),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NewsImage(imageUrl: imageUrl, isValidUrl: isValidUrl),

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
                  '${AppLocalizations.of(context)!.by} : ${article.author ?? AppLocalizations.of(context)!.unknown}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(color: AppColors.grey),
                ),
              ),
              Text(
                timeago.format(publishedAt, locale: languageProvider.currentLanguage),
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
}

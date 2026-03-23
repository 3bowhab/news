import 'package:flutter/material.dart';
import 'package:news/core/extensions/responsive_padding_extension.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/models/news_respnse/article.dart';
import 'package:news/ui/news_details/widgets/news_image.dart';

class NewsDetailsSheet extends StatelessWidget {
  final Article article;

  const NewsDetailsSheet({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final imageUrl = article.urlToImage ?? '';
    final isValidUrl = Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false;

    return SafeArea(
      child: Container(
        padding: 16.allPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsImage(imageUrl: imageUrl, isValidUrl: isValidUrl),

            10.verticalSizedBox,
            Text(article.title ?? ''),

            10.verticalSizedBox,
            Text(article.description ?? ''),

            10.verticalSizedBox,
            ElevatedButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.viewFullArticel),
            ),
          ],
        ),
      ),
    );
  }
}

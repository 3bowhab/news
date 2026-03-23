import 'package:flutter/material.dart';
import 'package:news/models/news_respnse/article.dart';
import 'package:news/ui/news_details/widgets/news_card.dart';
import 'package:news/ui/news_details/widgets/news_details_sheet.dart';

class NewsItem extends StatelessWidget {
  final Article article;

  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final imageUrl = article.urlToImage ?? '';
    final isValidUrl = Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false;

    return GestureDetector(
      onTap: () => _showDetails(context),
      child: NewsCard(
        article: article,
        imageUrl: imageUrl,
        isValidUrl: isValidUrl,
      ),
    );
  }

  void _showDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => NewsDetailsSheet(article: article),
    );
  }
}

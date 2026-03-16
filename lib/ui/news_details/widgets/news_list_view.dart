import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/core/extensions/responsive_padding_extension.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/models/news_respnse/news_respnse.dart';
import 'package:news/ui/news_details/widgets/news_item.dart';

class NewsListView extends StatefulWidget {
  final String? sourceId;
  const NewsListView({super.key, required this.sourceId,});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  late Future<NewsRespnse> newsResponse;

  @override
  void initState() {
    newsResponse = getNewsResponse();
    super.initState();
  }

  Future<NewsRespnse> getNewsResponse() async {
    return await ApiManager().getNewsBySource(widget.sourceId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsRespnse>(
      future: newsResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final newsRespnse = snapshot.data?.articles ?? [];
          return ListView.separated(
            padding: 16.allPadding,
            itemCount: newsRespnse.length,
            separatorBuilder: (context, index) {
              return 16.verticalSizedBox;
            },
            itemBuilder: (context, index) {
              return NewsItem(
                article: newsRespnse[index],
              );
            },
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString().replaceAll('Exception: ', ''),
            ),
          );
        } else {
          return Center(
            child: Text(AppLocalizations.of(context)!.noNewsAvailable),
          );
        }
      },
    );
  }
}
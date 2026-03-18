import 'package:flutter/material.dart';
import 'package:news/core/constants/app_padding.dart';
import 'package:news/core/extensions/responsive_padding_extension.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/ui/news_details/view_model/news_view_model.dart';
import 'package:news/ui/news_details/widgets/news_item.dart';
import 'package:provider/provider.dart';

class NewsListView extends StatefulWidget {
  final String? sourceId;
  const NewsListView({super.key, required this.sourceId});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  NewsViewModel newsViewModel = NewsViewModel();
  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    newsViewModel.fetchNewsBySourceId(widget.sourceId ?? '', currentPage);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels != 0 &&
          _scrollController.position.atEdge) {
        currentPage++;
        newsViewModel.fetchNewsBySourceId(widget.sourceId ?? '', currentPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => newsViewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, newsViewModel, child) {
          if (newsViewModel.articles.isNotEmpty) {
            return ListView.separated(
              padding: 16.allPadding,
              controller: _scrollController,
              itemCount: newsViewModel.hasMore
                  ? newsViewModel.articles.length + 1
                  : newsViewModel.articles.length,
              separatorBuilder: (context, index) {
                return 16.verticalSizedBox;
              },
              itemBuilder: (context, index) {
                if (index < newsViewModel.articles.length) {
                  return NewsItem(article: newsViewModel.articles[index]);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else if (newsViewModel.errorMessage.isNotEmpty) {
            return Padding(
              padding: AppPadding.view,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(newsViewModel.errorMessage),
                  16.verticalSizedBox,
                  ElevatedButton(
                    onPressed: () {
                      newsViewModel.fetchNewsBySourceId(
                        widget.sourceId ?? '',
                        currentPage,
                      );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


// return FutureBuilder<NewsRespnse>(
    //   future: newsResponse,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       final newsRespnse = snapshot.data?.articles ?? [];
    //       return ListView.separated(
    //         padding: 16.allPadding,
    //         itemCount: newsRespnse.length,
    //         separatorBuilder: (context, index) {
    //           return 16.verticalSizedBox;
    //         },
    //         itemBuilder: (context, index) {
    //           return NewsItem(
    //             article: newsRespnse[index],
    //           );
    //         },
    //       );
    //     } else if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Text(
    //           snapshot.error.toString().replaceAll('Exception: ', ''),
    //         ),
    //       );
    //     } else {
    //       return Center(
    //         child: Text(AppLocalizations.of(context)!.noNewsAvailable),
    //       );
    //     }
    //   },
    // );
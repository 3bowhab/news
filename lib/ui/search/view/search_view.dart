import 'package:flutter/material.dart';
import 'package:news/core/constants/app_padding.dart';
import 'package:news/core/extensions/responsive_padding_extension.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/ui/news_details/widgets/news_item.dart';
import 'package:news/ui/search/view_model/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel searchViewModel = SearchViewModel();
  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();
  String currentQuery = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels != 0 &&
          _scrollController.position.atEdge) {
        currentPage++;
        searchViewModel.onsearchWithDebouncing(currentQuery, currentPage);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            currentQuery = value;
            currentPage = 1;
            searchViewModel.onsearchWithDebouncing(currentQuery, currentPage);
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => searchViewModel,
        child: Consumer<SearchViewModel>(
          builder: (context, searchViewModel, child) {
            if (searchViewModel.articles.isNotEmpty) {
              return ListView.separated(
                padding: 16.allPadding,
                controller: _scrollController,
                itemCount: searchViewModel.hasMore
                    ? searchViewModel.articles.length + 1
                    : searchViewModel.articles.length,
                separatorBuilder: (context, index) {
                  return 16.verticalSizedBox;
                },
                itemBuilder: (context, index) {
                  if (index < searchViewModel.articles.length) {
                    return NewsItem(article: searchViewModel.articles[index]);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else if (searchViewModel.errorMessage.isNotEmpty) {
              return Padding(
                padding: AppPadding.view,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(searchViewModel.errorMessage),
                  ],
                ),
              );
            } else {
              return Center(child: const Text('Search for news articles using the search bar above.'));
            }
          },
        ),
      ),
    );
  }
}

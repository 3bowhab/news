import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/models/news_respnse/article.dart';

class NewsViewModel extends ChangeNotifier {
  List<Article> articles = [];
  String errorMessage = '';
  bool isLoading = false;
  bool hasMore = true;

  Future<void> fetchNewsBySourceId(String sourceId, int page) async {
    if (isLoading) return; 

    isLoading = true;
    if (page == 1) {
      articles = [];
      hasMore = true; 
    }
    notifyListeners();

    try {
      final newsResponse = await ApiManager().getNewsBySource(sourceId, page);
      final newArticles = newsResponse.articles ?? [];

      if (newArticles.isEmpty) {
        hasMore = false; 
      } else {
        articles.addAll(newArticles);
        if (newArticles.length < 3) hasMore = false;
      }
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
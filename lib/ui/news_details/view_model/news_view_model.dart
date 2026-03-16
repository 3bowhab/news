import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/models/news_respnse/article.dart';

class NewsViewModel extends ChangeNotifier {
  List<Article>? articles = [];
  String errorMessage = '';

  Future<void> fetchNewsBySourceId(String sourceId) async {
    try {
      final newsResponse = await ApiManager().getNewsBySource(sourceId);
      articles = newsResponse.articles;
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
      articles = [];
    }
    notifyListeners();
  }
}
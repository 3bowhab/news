import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/models/news_respnse/article.dart';

class SearchViewModel extends ChangeNotifier {
  List<Article> articles = [];
  String errorMessage = '';
  bool isLoading = false;
  bool hasMore = true;
  Timer? timer;

  void onsearchWithDebouncing(String query, int page) {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    timer = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        fetchNewsByQuery(query, page);
      } else {
        articles = [];
        notifyListeners();
      }
    });
  }

  Future<void> fetchNewsByQuery(String query, int page) async {
    if (isLoading) return;

    isLoading = true;
    if (page == 1) {
      articles = [];
      hasMore = true;
    }
    notifyListeners();

    try {
      final newsResponse = await ApiManager().getNewsByQuery(query, page);
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

  // void _resetSearch() {
  //   articles = [];
  //   errorMessage = '';
  //   hasMore = true;
  //   isLoading = false;
  //   notifyListeners();
  // }
}

import 'package:flutter/material.dart';
import 'package:news/core/extensions/responsive_padding_extension.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/ui/news_details/widgets/news_item.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: 16.allPadding,
      itemCount: 10,
      separatorBuilder: (context, index) {
        return 16.verticalSizedBox;
      },
      itemBuilder: (context, index) {
        return NewsItem();
      },
    );
  }
}
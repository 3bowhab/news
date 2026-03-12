import 'package:flutter/material.dart';
import 'package:news/core/extensions/responsive_size_extension.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/models/news_category_model.dart';
import 'package:news/ui/home/widgets/view_all_button.dart';

class NewsTypeCard extends StatelessWidget {
  final NewsCategoryModel newsType;
  final int index;
  const NewsTypeCard({super.key, required this.newsType, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isRight = index % 2 == 0;

    return Container(
      width: double.infinity,
      height: 200.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Theme.of(context).brightness == Brightness.light
                ? newsType.darkImage
                : newsType.lightImage,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Align(
        alignment: isRight
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                newsType.title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              40.verticalSizedBox,
              ViewAllButton(isRight: isRight,),
            ],
          ),
        ),
      ),
    );
  }
}
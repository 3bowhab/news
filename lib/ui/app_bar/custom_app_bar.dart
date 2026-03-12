import 'package:flutter/material.dart';
import 'package:news/models/news_source_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isHome;
  const CustomAppBar({super.key, required this.title, this.isHome = false});

  @override
  Size get preferredSize => Size.fromHeight(!isHome ? 100 : kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        if (!isHome)
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
      ],
      bottom: !isHome
          ? TabBar(
              isScrollable: true,
              tabs: NewsSourceModel.source
                  .map((source) => Tab(text: source.title))
                  .toList(),
            )
          : null,
    );
  }
}

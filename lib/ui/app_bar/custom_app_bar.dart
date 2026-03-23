import 'package:flutter/material.dart';
import 'package:news/core/constants/app_routes.dart';
import 'package:news/models/news_sources/source.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isHome;
  final List<Source>? newsSources;
  const CustomAppBar({
    super.key,
    required this.title,
    this.isHome = false,
    this.newsSources,
  });

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
              Navigator.pushNamed(context, AppRoutes.settingsView);
            },
          ),
      ],
      bottom: !isHome
          ? TabBar(
              isScrollable: true,
              tabs:
                  newsSources
                      ?.map((source) => Tab(text: source.name))
                      .toList() ??
                  [],
            )
          : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/models/news_source_model.dart';
import 'package:news/ui/app_bar/custom_app_bar.dart';
import 'package:news/ui/app_bar/custom_drawer.dart';
import 'package:news/ui/news_details/widgets/news_list_view.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: NewsSourceModel.source.length,
      child: Scaffold(
        appBar: CustomAppBar(title: AppLocalizations.of(context)!.helloWorld),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: NewsSourceModel.source
              .map((e) => NewsListView())
              .toList(),
        ),
      ),
    );
  }
}

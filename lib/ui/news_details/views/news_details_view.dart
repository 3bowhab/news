import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/core/constants/app_padding.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/models/news_sources/news_sources.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/ui/app_bar/custom_app_bar.dart';
import 'package:news/ui/app_bar/custom_drawer.dart';
import 'package:news/ui/news_details/widgets/news_list_view.dart';

class NewsDetailsView extends StatefulWidget {
  const NewsDetailsView({super.key});

  @override
  State<NewsDetailsView> createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  Future<NewsSources>? newsSource;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    newsSource ??= ApiManager().getNewssources(category: args);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsSources>(
      future: newsSource,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final newsSources = snapshot.data?.sources ?? [];
          return DefaultTabController(
            length: newsSources.length,
            child: Scaffold(
              appBar: CustomAppBar(
                title: AppLocalizations.of(context)!.helloWorld,
                newsSources: newsSources,
              ),
              drawer: CustomDrawer(),
              body: SafeArea(
                child: TabBarView(
                  children: newsSources
                      .map((e) => NewsListView(sourceId: e.id))
                      .toList(),
                ),
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return errorSection(
            context,
            snapshot.error.toString().replaceAll('Exception: ', ''),
          );
        } else {
          return errorSection(
            context,
            AppLocalizations.of(context)!.noNewsAvailable,
          );
        }
      },
    );
  }

  Scaffold errorSection(BuildContext context, String errorMessage) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.helloWorld,
        isHome: true,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: AppPadding.view,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage),
            16.verticalSizedBox,
            ElevatedButton(
              onPressed: () {
                setState(() {
                  newsSource = ApiManager().getNewssources();
                });
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

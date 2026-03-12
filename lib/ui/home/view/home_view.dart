import 'package:flutter/material.dart';
import 'package:news/core/constants/app_padding.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/core/responsive/responsive_config.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/models/news_category_model.dart';
import 'package:news/ui/app_bar/custom_app_bar.dart';
import 'package:news/ui/app_bar/custom_drawer.dart';
import 'package:news/ui/home/widgets/news_type_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);
    List<NewsCategoryModel> newsTypes = NewsCategoryModel.getNewsTypes(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.helloWorld,
        isHome: true,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: AppPadding.view,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.goodMorningHereIsSomeNewsForYou,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              16.verticalSizedBox,
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return 16.verticalSizedBox;
                  },
                  itemCount: newsTypes.length,
                  itemBuilder: (context, index) {
                    return NewsTypeCard(
                      newsType: newsTypes[index],
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news/core/constants/app_images.dart';
import 'package:news/l10n/app_localizations.dart';

class NewsCategoryModel {
  final String id;
  final String title;
  final String lightImage;
  final String darkImage;

  NewsCategoryModel({required this.id, required this.title, required this.lightImage, required this.darkImage});

  static List<NewsCategoryModel> getNewsTypes(BuildContext context) => [
    NewsCategoryModel(
      id: 'general',
      title: AppLocalizations.of(context)!.general,
      lightImage: Assets.imagesGeneral,
      darkImage: Assets.imagesGeneralDark,
    ),
    NewsCategoryModel(
      id: 'business',
      title: AppLocalizations.of(context)!.business,
      lightImage: Assets.imagesBusniess,
      darkImage: Assets.imagesBusniessDark,
    ),
    NewsCategoryModel(
      id: 'sports',
      title: AppLocalizations.of(context)!.sports,
      lightImage: Assets.imagesSport,
      darkImage: Assets.imagesSportDark,
    ),
    NewsCategoryModel(
      id: 'technology',
      title: AppLocalizations.of(context)!.technology,
      lightImage: Assets.imagesTechnology,
      darkImage: Assets.imagesTechnologyDark,
    ),
    NewsCategoryModel(
      id: 'entertainment',
      title: AppLocalizations.of(context)!.entertainment,
      lightImage: Assets.imagesEntertainment,
      darkImage: Assets.imagesEntertainmentDark,
    ),
    NewsCategoryModel(
      id: 'health',
      title: AppLocalizations.of(context)!.health,
      lightImage: Assets.imagesHelth,
      darkImage: Assets.imagesHelthDark,
    ),
    NewsCategoryModel(
      id: 'science',
      title: AppLocalizations.of(context)!.science,
      lightImage: Assets.imagesScience,
      darkImage: Assets.imagesScienceDark,
    ),
  ];
}
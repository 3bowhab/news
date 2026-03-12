import 'package:flutter/material.dart';
import 'package:news/core/constants/app_routes.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/providers/language_provider.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:news/ui/app_bar/custom_list_tile.dart';
import 'package:news/ui/home/widgets/list_tile_row.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.newsApp,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          ListTile(
            title: ListTileRow(
              icon: Icons.home_outlined,
              title: AppLocalizations.of(context)!.gotohome,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.homeView);
            },
          ),
          Divider(),
          CustomListTile(
            title: AppLocalizations.of(context)!.theme,
            icon: Icons.format_paint_outlined,
            list: ['Light', 'Dark'],
            initialValue: themeProvider.currentMode == ThemeMode.light
                ? 'Light'
                : 'Dark',
            onChanged: (value) {
              themeProvider.toggleTheme(
                value == 'Light' ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
          Divider(),
          CustomListTile(
            title: AppLocalizations.of(context)!.language,
            icon: Icons.language,
            list: ['English', 'العربية'],
            initialValue: languageProvider.currentLanguage == 'en'
                ? 'English'
                : 'العربية',
            onChanged: (value) {
              languageProvider.changeLanguage(value == 'English' ? 'en' : 'ar');
            },
          ),
        ],
      ),
    );
  }
}

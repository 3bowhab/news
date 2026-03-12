import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/constants/app_routes.dart';
import 'package:news/core/responsive/responsive_config.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/providers/language_provider.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:news/ui/home/view/home_view.dart';
import 'package:news/ui/news_details/views/news_details_view.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Accessing providers
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    ResponsiveConfig.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Localization setup
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.currentLanguage),

      // dynamic font based on locale
      builder: (context, child) {
        final lang = languageProvider.currentLanguage;

        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: lang == 'ar'
                ? GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)
                : GoogleFonts.interTightTextTheme(Theme.of(context).textTheme),
          ),
          child: child!,
        );
      },

      // Theme setup
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentMode,

      initialRoute: AppRoutes.homeView,
      routes: {
        AppRoutes.homeView: (context) => const HomeView(),
        AppRoutes.newsDetailsView: (context) => const NewsDetailsView(),
      },
    );
  }
}

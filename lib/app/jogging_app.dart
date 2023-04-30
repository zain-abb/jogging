import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/presentation/utils/constants.dart';
import 'resource/i18n.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class JoggingApp extends ConsumerWidget {
  const JoggingApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    return AdaptiveTheme(
      // Light Theme
      light: AppTheme.lightTheme,
      // Dark Theme
      dark: AppTheme.darkTheme,
      // Initial theme mode
      initial: AdaptiveThemeMode.system,
      // Build the material app
      builder: (theme, darkTheme) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Jogging',
          // Light Theme
          theme: theme,
          // Dark Theme
          darkTheme: darkTheme,
          // Router Configuration
          routerConfig: appRouter.config(),
          // List all of the app's supported locales here
          supportedLocales: Constants.supportedLanguages.map((language) => Locale(language)).toList(),
          // These delegates make sure that the localization data for the proper language is loaded
          localizationsDelegates: [
            // A class which loads the translations from JSON files
            I18n.getDelegate(),
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization of basic text for Cupertino widgets
            GlobalCupertinoLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
          ],
          // Returns a locale which will be used by the app
          localeResolutionCallback: (locale, supportedLocales) {
            // If system locale is null, return the default supported locale
            if (locale == null) return supportedLocales.first;

            // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode) {
                // && supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            // If the locale of the device is not supported, use the first one from the list.
            return supportedLocales.first;
          },
        );
      },
    );
  }
}

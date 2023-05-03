import 'package:flutter/material.dart';

import 'app_typography.dart';
import 'color_schemes.dart';
import 'extension_colors.dart';

/// Contains the app light and dark theme
///
/// All theme data that are part of the app, should be declared in this class
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorSchemes.lightColorScheme,
        fontFamily: AppTypography.fontFamily,
        textTheme: AppTypography.textTheme,
        // Extensions
        extensions: const <ThemeExtension<dynamic>>[
          ExtensionColors(),
        ],
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorSchemes.darkColorScheme,
        fontFamily: AppTypography.fontFamily,
        textTheme: AppTypography.textTheme,
        // Extensions
        extensions: const <ThemeExtension<dynamic>>[
          ExtensionColors(),
        ],
      );
}

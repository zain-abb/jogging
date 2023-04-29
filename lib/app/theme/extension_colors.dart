import 'package:flutter/material.dart';

/// Contains the custom colors used in app
///
/// All colors that are not part of material theme, should be declared in this class so they can be
/// handled differently for each theme.
@immutable
class ExtensionColors extends ThemeExtension<ExtensionColors> {
  const ExtensionColors();

  @override
  ThemeExtension<ExtensionColors> copyWith() {
    return const ExtensionColors();
  }

  @override
  ThemeExtension<ExtensionColors> lerp(ThemeExtension<ExtensionColors>? other, double t) {
    if (other is! ExtensionColors) return this;

    return const ExtensionColors();
  }
}

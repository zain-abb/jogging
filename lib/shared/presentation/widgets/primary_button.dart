import 'package:flutter/material.dart';

import '../../../app/resource/assets.dart';

/// Primary button based on [ElevatedButton]. Useful for CTAs in the app.
class PrimaryButton extends StatelessWidget {
  /// Create a PrimaryButton.
  /// if [isLoading] is true, a loading indicator will be displayed instead of
  /// the text.
  const PrimaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.withIcon = false,
    this.icon,
  }) : assert(withIcon == true && icon != null, 'icon is not given, while withIcon was true');

  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  final bool withIcon;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    if (withIcon) {
      return ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading ? const SizedBox.shrink() : icon!,
        label: isLoading ? _progressIndicator() : Text(text),
      );
    }
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading ? _progressIndicator() : Text(text),
    );
  }

  Widget _progressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox.square(
        dimension: Assets.dimens.p20,
        child: const CircularProgressIndicator.adaptive(strokeWidth: 2),
      ),
    );
  }
}

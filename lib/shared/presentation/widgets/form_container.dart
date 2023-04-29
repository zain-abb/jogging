import 'package:flutter/material.dart';

/// A widget that provides solves common use-cases with forms
///
/// Use [handleFullPageScroll] attribute to handle cases where form screen is using 'Expanded' or
/// similar to place widgets apart but still need the screen to scroll in order to show active
/// input field.
class FormContainer extends StatelessWidget {
  /// Handles cases where form screen is using 'Expanded' or similar widgets to place child widgets
  /// apart but still need the screen to scroll in order to show active input field.
  final bool handleFullPageScroll;
  final Widget child;

  const FormContainer({required this.child, this.handleFullPageScroll = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: handleFullPageScroll
          ?
          // Create a custom scroll view so children can be placed apart vertically
          CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: child,
                ),
              ],
            )
          // Otherwise, show the child as is
          : child,
    );
  }
}

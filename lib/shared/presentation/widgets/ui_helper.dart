import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jogging/shared/domain/exception/app_exception.dart';

/// Defines various utility methods that are related to look and feel of the app
class UiHelper {
  UiHelper._();

  /// Displays a success message
  static void displaySuccess(BuildContext context, String message) {
    final theme = Theme.of(context);
    ScaffoldMessenger.maybeOf(context)
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            message,
            style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onPrimary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          backgroundColor: theme.colorScheme.primary,
        ),
      );
  }

  /// Displays an error message
  static void displayError(BuildContext context, String message) {
    final theme = Theme.of(context);
    final snackBar = SnackBar(
      content: Text(
        message,
        style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onError),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: theme.colorScheme.error,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// Extract and displays the error message from given [AppException] object
  static void displayFailure(BuildContext context, AppException error) {
    String? message = error.details.message;
    // String? message = error.message ?? '';

    debugPrint('LOCALIZED EXCEPTION MSG: $message');
    displayError(context, message);
  }

  /// Loads an image from network
  static Widget getNetworkImage(
      {required String imageUrl,
      String? placeholder,
      String? errorPlaceholder,
      double? width,
      double? height,
      BoxFit? fit}) {
    // Set default placeholder
    // placeholder ??= Assets.image.loadingImage;
    // errorPlaceholder ??= Assets.image.errorImage;

    return CachedNetworkImage(
      placeholder: (context, _) => Image.asset(placeholder!),
      fit: fit,
      width: width,
      height: height,
      imageUrl: imageUrl,
      errorWidget: (_, __, ___) => Image.asset(
        errorPlaceholder!,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }

  /// Runs the provided [operation] after rebuild() method is executed
  static void runOnUiThread(Function operation) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => operation());
    // Future.delayed(Duration.zero, () => operation);
    //TODO: Use one of the above two methods, whichever is more correct/appropriate.
  }
}

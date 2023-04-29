import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/app/resource/i18n.dart';
import '../../../app/extensions.dart';
import '../../domain/exception/app_exception.dart';

/// A helper class to display remote collection data.
///
/// [ListDataHelper] defines the utility methods for displaying data in lists, and handling various
/// states of data like empty, error, loading, etc. It is recommended to use this class everywhere
/// in project where there's a need to display remote collection data.
class ListDataHelper {
  //
  ListDataHelper._();

  /// Creates appropriate widgets against different states of FutureBuilder
  static Widget prepareFutureBuilder(
      {required AsyncSnapshot snapshot,
      required Widget success,
      required BuildContext context,
      Color? progressColor,
      Color? textColor,
      String? loadingText}) {
    // Set loading data
    final loadingTextVal = loadingText ?? I18n.values(context)!.loader_data;

    if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
      // Display data
      return success;
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      // Show loading view
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor ?? Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 16),
            Text(loadingTextVal, style: TextStyle(fontSize: 16, color: textColor))
          ],
        ),
      );
    } else if (snapshot.hasError) {
      return displayError(context, snapshot.error);
    } else {
      // Not sure why would this happen. Show an error message.
      return displayUnknownError(context);
    }
  }

  /// Display a view when there's no data
  static Widget displayEmptyDataMsg(
    BuildContext context,
    String message, {
    String? image,
  }) {
    return _showDataMessage(
      context: context,
      // image ?? Assets.image.emptyData,
      title: '',
      icon: image,
      message: message,
    );
  }

  /// When not sure why error occurred, show this error view.
  static Widget displayUnknownError(BuildContext context) {
    return _showDataMessage(
      context: context,
      title: 'Something went wrong'.hardcoded,
      message: 'An unknown error occurred. Please try again.'.hardcoded,
      titleColor: Theme.of(context).colorScheme.error,
    );
  }

  /// Display the error view
  static Widget displayError(BuildContext context, Object? error) {
    dynamic displayMsg;
    if (error is AppException) {
      displayMsg = error.details.message;
    } else if (error is String) {
      displayMsg = error;
    }
    displayMsg ??= I18n.values(context)!.data_error_unknown_msg;

    // Show error
    return _showDataMessage(
      context: context,
      title: 'Ooooops'.hardcoded,
      message: displayMsg,
      titleColor: Theme.of(context).colorScheme.error,
    );
  }

  /// Displays the formatted message
  static Widget _showDataMessage({
    required BuildContext context,
    String? icon,
    required String title,
    required String message,
    Color? titleColor,
  }) {
    //
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(8),
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Imagery
            if (icon != null) ...[
              SvgPicture.asset(icon),
              const SizedBox(height: 22),
            ],
            // Title
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: titleColor),
            ),
            const SizedBox(height: 10),
            // Message
            Text(message, textAlign: TextAlign.center, style: textTheme.titleSmall),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

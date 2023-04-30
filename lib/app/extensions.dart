import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jogging/shared/presentation/widgets/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/domain/exception/app_exception.dart';

extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String get hardcoded => this;
}

extension DataHandling on SharedPreferences {
  /// Store an object in preferences
  void setObject(String key, Object object) async {
    String json = jsonEncode(object);
    setString(key, json);
  }

  /// Retrieve an object from preferences
  Future<dynamic> getObject(String key) async {
    String? json = getString(key);

    if (json == null) return null;

    return jsonDecode(json);
  }
}

/// A helper [AsyncValue] extension to show an alert dialog on error
extension AsyncValueUI on AsyncValue {
  /// show an alert dialog if the current [AsyncValue] has an error and the
  /// state is not loading.
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final message = _errorMessage(error);
      UiHelper.displayError(context, message);
    }
  }

  String _errorMessage(Object? error) {
    if (error is FirebaseAuthException) {
      return error.message ?? error.toString();
    } else if (error is AppException) {
      return error.details.message;
    } else {
      return error.toString();
    }
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError {
    return type == DioErrorType.unknown && error is SocketException;
  }
}

extension CancelTokenX on Ref {
  CancelToken cancelToken() {
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);
    return cancelToken;
  }
}

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.dark;
  }
}

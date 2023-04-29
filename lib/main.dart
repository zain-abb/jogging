import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/jogging_app.dart';
import 'app/observers.dart';
import 'firebase_options.dart';
import 'shared/domain/exception/async_error_logger.dart';
import 'shared/domain/providers/external_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Disable logs for release mode
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  // Shared Preferences initialization for the provider
  final sharedPreferences = await SharedPreferences.getInstance();

  // var brightness = MediaQuery.of(context).platformBrightness;

  // Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Customize status bar and icons
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.light.copyWith(
  //     statusBarColor: Colors.black,
  //     statusBarBrightness: Brightness.light,
  //   ),
  // );
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.dark.copyWith(
  //     statusBarColor: Colors.white,
  //     statusBarBrightness: Brightness.dark,
  //   ),
  // );

  // Set portrait orientation only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Run the app
  runApp(
    ProviderScope(
      observers: [
        Observers(),
        AsyncErrorLogger(),
      ],
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const JoggingApp(),
    ),
  );
}

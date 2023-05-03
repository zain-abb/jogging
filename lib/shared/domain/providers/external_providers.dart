import 'package:firebase_auth/firebase_auth.dart';
import 'package:health/health.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/network_info.dart';

part 'external_providers.g.dart';

///
/// Provider for the [SharedPreferences] instance
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

///
/// Provider for the [InternetConnectionChecker] instance
final internetConnectionCheckerProvider =
    Provider<InternetConnectionChecker>((ref) {
  return InternetConnectionChecker();
});

///
/// Provider for the [NetworkInfo] instance
@riverpod
NetworkInfo networkInfo(NetworkInfoRef ref) {
  final internetConnectionChecker =
      ref.watch(internetConnectionCheckerProvider);
  return NetworkInfoImpl(internetConnectionChecker);
}

///
/// Provider for the [FirebaseAuth] instance
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

///
/// Provider for the [HealthFactory] instance
final healthFactoryProvider = Provider<HealthFactory>((ref) {
  // create a HealthFactory for use in the app
  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);
  return health;
});

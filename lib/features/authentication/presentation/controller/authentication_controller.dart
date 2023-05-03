import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogging/features/authentication/application/authentication_providers.dart';
import 'package:jogging/shared/domain/models/no_params.dart';
import 'package:jogging/shared/domain/providers/external_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/firebase_app_user.dart';
import '../../domain/entities/app_user.dart';

part 'authentication_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthenticationController extends _$AuthenticationController {
  @override
  FutureOr<AppUser?> build() {
    // nothing to do at initial stage
    return null;
  }

  Future<AppUser?> continueWithGoogle() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard<AppUser?>(() => _authenticate());
    return state.asData?.value;
  }

  Future<AppUser?> _authenticate() async {
    final usecase = ref.read(signInUsecaseProvider);
    return usecase.call(NoParams());
  }

  AppUser? get currentUser {
    final auth = ref.watch(firebaseAuthProvider);
    return _convertUser(auth.currentUser);
  }

  /// Helper method to convert a [User] to an [AppUser]
  AppUser? _convertUser(User? user) =>
      user != null ? FirebaseAppUser(user) : null;

  Stream<AppUser?> authStateChanges() {
    final auth = ref.watch(firebaseAuthProvider);
    return auth.authStateChanges().map(_convertUser);
  }
}

// * Using keepAlive since other providers need it to be an
// * [AlwaysAliveProviderListenable]
@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChanges(AuthStateChangesRef ref) {
  final authenticationController =
      ref.watch(authenticationControllerProvider.notifier);
  return authenticationController.authStateChanges();
}

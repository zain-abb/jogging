// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateChangesHash() => r'774b974159436f12cf16f713a7c77550e00ab88a';

/// See also [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider = StreamProvider<AppUser?>.internal(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateChangesRef = StreamProviderRef<AppUser?>;
String _$authenticationControllerHash() =>
    r'f9816d0cb0338043a682c5104b9b984788c13829';

/// See also [AuthenticationController].
@ProviderFor(AuthenticationController)
final authenticationControllerProvider =
    AsyncNotifierProvider<AuthenticationController, AppUser?>.internal(
  AuthenticationController.new,
  name: r'authenticationControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthenticationController = AsyncNotifier<AppUser?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

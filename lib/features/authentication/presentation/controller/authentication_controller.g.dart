// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateChangesHash() => r'1b21408fff4b99e6db1ad768faae8dc49af24396';

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
    r'71cc0f22fd8cae362cc367d1a518a82736a6b2b3';

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

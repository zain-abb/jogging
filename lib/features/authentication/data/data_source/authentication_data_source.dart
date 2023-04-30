import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../shared/domain/exception/app_exception.dart';
import '../../domain/entities/app_user.dart';
import '../models/firebase_app_user.dart';

abstract class AuthenticationDataSource {
  /// Starts the interactive sign-in process.
  ///
  /// Returned Future resolves to an instance of [AppUser] for a
  /// successful sign in or [AppException] in case sign in process was failed.
  Future<AppUser?> signInWithGoogle();

  /// Signs out the current user.
  ///
  /// If successful, it also updates
  /// any [authStateChanges], [idTokenChanges] or [userChanges] stream
  /// listeners.
  Future<bool> signOut();
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  final FirebaseAuth _auth;

  AuthenticationDataSourceImpl(this._auth);

  @override
  Future<AppUser?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredentials = await _auth.signInWithCredential(credential);

      // Return the [AppUser] if the userCredentials.user is not null otherwise return null
      return userCredentials.user == null ? null : FirebaseAppUser(userCredentials.user!);
    } on FirebaseAuthException catch (e) {
      // if the email is linked with another account
      if (e.code == 'account-exists-with-different-credential') {
        throw const AppException.accountExists();
        // if the the credentials are invalid
      } else if (e.code == 'invalid-credential') {
        throw const AppException.invalidCredentials();
        // if something went wrong
      } else {
        throw const AppException.unknown();
      }
      // if something went wrong
    } catch (e) {
      log(e.toString());
      throw const AppException.unknown();
    }
  }

  @override
  Future<bool> signOut() async {
    // Trigger the authentication flow
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        // Sign out the user if the [Platform] is web
        await googleSignIn.signOut();
      }
      // Sign out the user form [FirebaseAuth]
      await _auth.signOut();
      // return true if the current user is null
      return _auth.currentUser == null;
    } catch (e) {
      // Catch if anything went wrong
      throw const AppException.unknown();
    }
  }
}

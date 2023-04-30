import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/app_user.dart';

class FirebaseAppUser implements AppUser {
  const FirebaseAppUser(this._user);
  final User _user;

  @override
  UserID get uid => _user.uid;

  @override
  String? get email => _user.email;

  @override
  String? get displayName => _user.displayName;

  @override
  String? get photoUrl => _user.photoURL;
}

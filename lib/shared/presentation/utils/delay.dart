import 'dart:ui';

/// a small helper function to return a Future with a configurable delay
Future<void> delay({bool addDelay = true, int milliseconds = 2000, VoidCallback? operation}) {
  if (addDelay) {
    return Future.delayed(Duration(milliseconds: milliseconds), operation);
  } else {
    return Future.value();
  }
}

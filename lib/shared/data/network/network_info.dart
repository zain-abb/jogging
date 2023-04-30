import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../domain/exception/app_exception.dart';

/// Abstract Class for providing network info
/// [isConnected] method is used for testing
abstract class NetworkInfo {
  /// This method tells whether the system is connected with the internet or not
  Future<bool> get isConnected;

  /// This method returns the IP with which the user is connected
  String getIP();
}

/// [NetworkInfoImpl] implementation of [NetworkInfo]
/// Provides info regarding the network info using network info package
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  /// This method provides info regarding network connectivity using InternetConnectionChecker
  /// Output: [bool] tells whether connected to internet or not
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  String getIP() {
    if (connectionChecker.addresses.isEmpty) {
      throw const AppException.noInternet();
    }
    final address = connectionChecker.addresses.last.address?.address;
    if (address == null) {
      throw const AppException.noInternet();
    }
    return address;
  }
}

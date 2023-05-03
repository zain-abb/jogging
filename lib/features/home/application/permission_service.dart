import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/domain/exception/app_exception.dart';
import '../../../shared/domain/providers/external_providers.dart';

part 'permission_service.g.dart';

@Riverpod(keepAlive: true)
class PermissionService extends _$PermissionService {
  static final types = [HealthDataType.STEPS];

  // with corresponding permissions
  // READ only
  final permissionsToRequest =
      types.map((e) => HealthDataAccess.READ_WRITE).toList();

  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> checkPermission() async {
    final status = await Permission.activityRecognition.status;

    final health = ref.read(healthFactoryProvider);
    // Check if we have permission
    // true - if all of the data types have been granted with the specified access rights.
    // false - if any of the data types has not been granted with the specified access right(s)
    // null - if it can not be determined if the data types have been granted with the specified access right(s).
    // bool hasPermissions = await health.requestAuthorization(types,
    //     permissions: permissionsToRequest);
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> requestPermission() async {
    await _checkPermission();
    // If we are trying to read Step Count, Workout, Sleep or other data that requires
    // the ACTIVITY_RECOGNITION permission, we need to request the permission first.
    // This requires a special request authorization call.
    //
    // The location permission is requested for Workouts using the Distance information.
    await Permission.activityRecognition.request();

    final health = ref.read(healthFactoryProvider);

    // Check if we have permission
    bool? hasPermissions =
        await health.hasPermissions(types, permissions: permissionsToRequest);

    // hasPermissions = false because the hasPermission cannot disclose if WRITE access exists.
    // Hence, we have to request with WRITE as well.
    hasPermissions = false;

    bool authorized = false;
    if (!hasPermissions) {
      // requesting access to the data types before reading them
      try {
        authorized = await health.requestAuthorization(types,
            permissions: permissionsToRequest);

        print('Has Permissions: $authorized');
      } catch (error) {
        throw const AppException.healthNotAuthorized();
      }
    }
    if (!authorized) {
      throw const AppException.healthNotAuthorized();
    }
  }

  Future<bool> _checkPermission() async {
    final status = await Permission.activityRecognition.status;

    if (status != PermissionStatus.granted) {
      final result = await Permission.activityRecognition.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}

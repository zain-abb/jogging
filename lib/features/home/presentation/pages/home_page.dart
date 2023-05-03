import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:jogging/app/extensions.dart';
import 'package:jogging/features/home/presentation/controller/home_controller.dart';
import 'package:jogging/features/home/presentation/widgets/weekly_view.dart';
import 'package:jogging/features/home/presentation/widgets/yearly_view.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../app/resource/assets.dart';
import '../../../../app/resource/i18n.dart';
import '../../../../app/router/app_router.dart';
import '../../../../app/router/app_router.gr.dart';
import '../../../../shared/presentation/widgets/ui_helper.dart';
import '../../application/permission_service.dart';
import '../widgets/daily_view.dart';
import '../widgets/monthly_view.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    final permissionService = ref.read(permissionServiceProvider.notifier);
    permissionService.checkPermission().then((permission) async {
      if (!permission) {
        await permissionService.requestPermission();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.values(context)!;
    final dimens = Assets.dimens;
    ref.listen<AsyncValue>(
      homeControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    ref.listen<AsyncValue>(
      permissionServiceProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: dimens.p32,
            child: TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              labelPadding: EdgeInsets.symmetric(horizontal: dimens.p8),
              indicatorWeight: 1,
              tabs: [
                Tab(text: i18n.tab_day),
                Tab(text: i18n.tab_week),
                Tab(text: i18n.tab_month),
                Tab(text: i18n.tab_year),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                final router = ref.read(appRouterProvider);
                router.pushAndPopUntil(const AuthenticationRoute(),
                    predicate: (_) => false);

                // await getSteps();
              },
              child: ClipOval(
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  child: UiHelper.getNetworkImage(
                    imageUrl: Assets.image.defaultAvatar,
                  ),
                ),
              ),
            ),
            dimens.gapW16
          ],
        ),
        body: const TabBarView(
          children: [
            DailyView(),
            WeeklyView(),
            MonthlyView(),
            YearlyView(),
          ],
        ),
      ),
    );
  }

  Future<void> getSteps() async {
    await _checkPermission();
    // create a HealthFactory for use in the app
    HealthFactory health = HealthFactory();

    // define the types to get
    var types = [
      HealthDataType.STEPS,
      HealthDataType.BLOOD_GLUCOSE,
    ];

    // requesting access to the data types before reading them
    bool requested = await health.requestAuthorization(types);

    var now = DateTime.now();

    // fetch health data from the last 24 hours
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        now.subtract(const Duration(days: 1)), now, types);

    // request permissions to write steps and blood glucose
    types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
    var permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ];
    await health.requestAuthorization(types, permissions: permissions);

    // write steps and blood glucose

    // get the number of steps for today
    var midnight = DateTime(now.year, 3, 30);
    var date = DateTime(now.year, 3, 31);
    int? steps = await health.getTotalStepsInInterval(midnight, date);
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

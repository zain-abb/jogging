import 'package:auto_route/auto_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/authentication/presentation/pages/authentication_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'app_router.gr.dart';

part 'app_router.g.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AdaptiveRoute(page: SplashRoute.page, path: SplashPage.routeName, initial: true),
    AdaptiveRoute(page: AuthenticationRoute.page, path: AuthenticationPage.routeName),
  ];
}

@Riverpod(keepAlive: true)
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jogging/app/router/app_router.dart';
import 'package:jogging/app/router/app_router.gr.dart';

import '../../../../app/resource/assets.dart';
import '../../../../shared/presentation/utils/delay.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();

    delay(operation: () {
      final router = ref.read(appRouterProvider);
      router.push(const AuthenticationRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.image.logo),
      ),
    );
  }
}

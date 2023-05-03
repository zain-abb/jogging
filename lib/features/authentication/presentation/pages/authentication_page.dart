import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jogging/app/router/app_router.dart';
import 'package:jogging/shared/presentation/widgets/ui_helper.dart';

import '../../../../app/extensions.dart';
import '../../../../app/resource/assets.dart';
import '../../../../app/resource/i18n.dart';
import '../../../../app/router/app_router.gr.dart';
import '../../../../shared/presentation/widgets/primary_button.dart';
import '../../domain/entities/app_user.dart';
import '../controller/authentication_controller.dart';

@RoutePage()
class AuthenticationPage extends ConsumerStatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  static const routeName = '/authentication';

  @override
  ConsumerState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends ConsumerState<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    final i18n = I18n.values(context)!;
    final theme = Theme.of(context);
    final dimens = Assets.dimens;
    final state = ref.watch(authenticationControllerProvider);
    ref.listen<AsyncValue<AppUser?>>(
      authenticationControllerProvider,
      (_, state) {
        if (state.hasError) {
          state.showAlertDialogOnError(context);
        } else {
          if (state.asData?.value?.displayName != null) {
            UiHelper.displaySuccess(context,
                'Welcome ${state.asData?.value?.displayName}!'.hardcoded);
          }
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(dimens.p32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                i18n.jogging,
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
              const Spacer(),
              Image.asset(Assets.image.illustration),
              const Spacer(),
              Text(
                i18n.analyze_steps,
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
              dimens.gapH8,
              Text(i18n.analyze_steps_desc, style: theme.textTheme.titleMedium),
              dimens.gapH32,
              Align(
                alignment: Alignment.center,
                child: Platform.isAndroid
                    ? _googleButton(state.isLoading)
                    : _appleButton(state.isLoading),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _googleButton(bool isLoading) {
    return PrimaryButton(
      withIcon: true,
      isLoading: isLoading,
      text: I18n.values(context)!.btn_sign_in_with_google,
      icon: SvgPicture.asset(Assets.image.icGoogle, width: 24, height: 24),
      onPressed: _continueWithGoogle,
    );
  }

  Widget _appleButton(bool isLoading) {
    return PrimaryButton(
      withIcon: true,
      isLoading: isLoading,
      text: I18n.values(context)!.btn_sign_in_with_apple,
      icon: SvgPicture.asset(Assets.image.icApple, width: 24, height: 24),
      onPressed: () {
        // TODO: implement sign in with apple functionality
      },
    );
  }

  Future<void> _continueWithGoogle() async {
    final controller = ref.read(authenticationControllerProvider.notifier);
    final user = await controller.continueWithGoogle();
    if (user != null) {
      final router = ref.read(appRouterProvider);
      router.pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
    }
  }
}

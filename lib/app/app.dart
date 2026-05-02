import 'package:diasight_app/app/router/app_router.dart';
import 'package:diasight_app/core/config/environment/app_environment_provider.dart';
import 'package:diasight_app/core/theme/app_mix_tokens.dart';
import 'package:diasight_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mix/mix.dart';

class DiasightApp extends ConsumerWidget {
  const DiasightApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final environment = ref.watch(appEnvironmentProvider);

    return MixScope.withMaterial(
      colors: AppMixTokens.colors,
      spaces: AppMixTokens.spaces,
      radii: AppMixTokens.radii,
      doubles: AppMixTokens.doubles,
      textStyles: AppMixTokens.textStyles,
      child: MaterialApp.router(
        title: environment.appName,
        debugShowCheckedModeBanner: !environment.flavor.isProduction,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: createAppRouter(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('th'),
        ],
      ),
    );
  }
}

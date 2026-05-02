import 'package:diasight_app/app/app.dart';
import 'package:diasight_app/core/config/environment/app_environment.dart';
import 'package:diasight_app/core/config/environment/app_environment_provider.dart';
import 'package:diasight_app/core/config/flavors/app_flavor.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> bootstrap(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  final environment = await AppEnvironment.load(flavor);

  runApp(
    ProviderScope(
      overrides: [
        appEnvironmentProvider.overrideWithValue(environment),
      ],
      child: const DiasightApp(),
    ),
  );
}

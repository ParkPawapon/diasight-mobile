import 'package:diasight_app/core/config/environment/app_environment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appEnvironmentProvider = Provider<AppEnvironment>((ref) {
  throw StateError('AppEnvironment must be initialized in bootstrap().');
});

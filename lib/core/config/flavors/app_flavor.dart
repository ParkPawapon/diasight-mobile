enum AppFlavor {
  development,
  staging,
  production
  ;

  String get envFileName => 'assets/env/.env.$name';

  bool get isProduction => this == AppFlavor.production;
}

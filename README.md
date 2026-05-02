# Diasight Mobile

Flutter mobile application for Diasight.

The project uses Feature-First Clean Architecture, Riverpod, GoRouter, Dio, Freezed, JSON Serializable, fpdart, flutter_secure_storage, flutter_dotenv, Mix, and Tailwind color tokens.

## Requirements

- macOS for iOS builds
- FVM
- Flutter 3.41.9 through FVM
- Xcode 26 or newer for iOS Simulator
- CocoaPods
- Android Studio
- Android SDK, Platform Tools, Emulator, and at least one Android system image

Check the toolchain:

```sh
fvm flutter doctor -v
```

The project is pinned to Flutter 3.41.9:

```sh
fvm install
fvm flutter --version
```

## Install Dependencies

```sh
fvm flutter pub get
```

Run code generation when model/provider files are added:

```sh
fvm dart run build_runner build
```

## Environment Files

Only the example file is committed:

```text
assets/env/.env.example
```

Create local files from the example:

```sh
cp assets/env/.env.example assets/env/.env.development
cp assets/env/.env.example assets/env/.env.staging
cp assets/env/.env.example assets/env/.env.production
```

Do not commit `.env.*` files. They are ignored by Git.

Use dotenv only for non-secret runtime configuration such as base URLs, timeout values, and public feature flags. Tokens, refresh tokens, and user credentials must use `flutter_secure_storage`.

## Entrypoints

Use a target file for every environment:

```text
lib/main_development.dart
lib/main_staging.dart
lib/main_production.dart
```

Default local run uses development through `lib/main.dart`.

## Run on iOS Simulator

Install and select Xcode:

```sh
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

Install iOS pods after dependency changes:

```sh
cd ios
pod install
cd ..
```

Start the simulator:

```sh
open -a Simulator
```

List devices:

```sh
fvm flutter devices
```

Run development:

```sh
fvm flutter run -d <ios-device-id> -t lib/main_development.dart
```

Run staging:

```sh
fvm flutter run -d <ios-device-id> -t lib/main_staging.dart
```

Run production profile mode:

```sh
fvm flutter run --profile -d <ios-device-id> -t lib/main_production.dart
```

If no iOS simulator appears:

```sh
xcrun simctl list devices available
open -a Simulator
fvm flutter doctor -v
```

If Xcode reports that the iOS platform runtime is not installed, open Xcode, go to Settings > Components, and install the iOS Simulator runtime that matches the active Xcode version.

## Run on Android Emulator

Set Android SDK paths in your shell profile if needed:

```sh
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
```

Install SDK components:

```sh
sdkmanager --install \
  "platform-tools" \
  "emulator" \
  "platforms;android-36" \
  "build-tools;36.0.0" \
  "system-images;android-36;google_apis;arm64-v8a"
```

Accept licenses:

```sh
yes | sdkmanager --licenses
```

Create an emulator:

```sh
avdmanager create avd \
  -n diasight_pixel \
  -k "system-images;android-36;google_apis;arm64-v8a" \
  --device pixel_8
```

Start the emulator:

```sh
emulator -avd diasight_pixel
```

List devices:

```sh
fvm flutter devices
```

Run development:

```sh
fvm flutter run -d <android-device-id> -t lib/main_development.dart
```

Run staging:

```sh
fvm flutter run -d <android-device-id> -t lib/main_staging.dart
```

Run production profile mode:

```sh
fvm flutter run --profile -d <android-device-id> -t lib/main_production.dart
```

If no Android emulator appears:

```sh
emulator -list-avds
fvm flutter emulators
fvm flutter doctor -v
```

## Common Run Commands

Development on the first available device:

```sh
fvm flutter run -t lib/main_development.dart
```

Staging on the first available device:

```sh
fvm flutter run -t lib/main_staging.dart
```

Production profile on the first available device:

```sh
fvm flutter run --profile -t lib/main_production.dart
```

Release build for Android:

```sh
fvm flutter build apk --release -t lib/main_production.dart
```

Android release signing uses `android/key.properties` when present. Create it from the example and keep the real file out of Git:

```sh
cp android/key.properties.example android/key.properties
```

Release build for iOS:

```sh
fvm flutter build ios --release -t lib/main_production.dart
```

## Tailwind-Style Design System

Flutter does not use Node Tailwind CSS. This project uses the Flutter equivalent:

- `tailwind_colors` for Tailwind color palettes
- `mix` for utility-first styling, design tokens, and reusable style composition

Base theme files:

```text
lib/core/theme/app_theme.dart
lib/core/theme/app_mix_tokens.dart
lib/core/theme/tokens/colors/app_colors.dart
lib/core/theme/tokens/colors/app_color_tokens.dart
lib/core/theme/tokens/spacing/app_space_tokens.dart
lib/core/theme/tokens/radius/app_radius_tokens.dart
lib/core/theme/tokens/typography/app_text_tokens.dart
lib/core/theme/tokens/elevation/app_elevation_tokens.dart
lib/core/theme/tokens/motion/app_motion_tokens.dart
```

Color roles are semantic, not feature-specific:

```text
brand
brandForeground
accent
background
surface
surfaceMuted
border
textPrimary
textSecondary
textMuted
success
warning
danger
info
```

Feature code must consume semantic tokens through `core/theme`. Do not hardcode color values inside feature modules.

## Project Structure

```text
lib/
|-- app/                     # App shell, bootstrap, router, app-level providers
|-- core/                    # Shared foundation: config, network, security, theme, storage, errors
|-- features/                # Feature-first modules
|   |-- auth/
|   |   |-- data/
|   |   |-- domain/
|   |   `-- presentation/
|   `-- dashboard/
|       |-- data/
|       |-- domain/
|       `-- presentation/
|-- l10n/                    # ARB localization files
`-- shared/                  # Shared presentation primitives and providers
```

Feature rules:

- `presentation` contains widgets, controllers, route bindings, and state for one feature.
- `domain` contains entities, repository contracts, use cases, value objects, and failures.
- `data` contains DTOs, data sources, mappers, and repository implementations.
- `core` must not depend on any feature.
- A feature must not import another feature directly unless a shared contract is extracted first.

## Quality Checks

Run before every push:

```sh
fvm flutter analyze
fvm dart run build_runner build
fvm flutter test
```

Check ignored sensitive files:

```sh
git check-ignore -v .env assets/env/.env.production android/app/release.keystore ios/Runner/AuthKey_SECRET.p8
```

## Security Rules

- Never commit `.env`, `.env.*`, keystores, certificates with private keys, provisioning profiles, `.p8`, `.p12`, `.pem`, or service account files.
- Do not store access tokens or refresh tokens in dotenv files.
- Use `flutter_secure_storage` for local token storage.
- Keep SSL pinning assets under `assets/certificates/` only when they are public certificate pins or public certificates.
- Keep production signing material outside the repository and inject it through CI secrets.

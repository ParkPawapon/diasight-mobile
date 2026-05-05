# Diasight Mobile

Diasight Mobile เป็น Flutter application ที่วางโครงสร้างแบบ Production Enterprise โดยใช้ Feature-First Clean Architecture, Riverpod, GoRouter, Dio, Freezed, JSON Serializable, fpdart, flutter_secure_storage, flutter_dotenv, Mix และ Tailwind color tokens สำหรับ design system แบบ utility-first ใน Flutter

เอกสารนี้เน้นขั้นตอนการตั้งค่าเครื่อง, เปิด iOS Simulator, เปิด Android Emulator และรันแอปให้ติดบนเครื่องจริงของทีม

## สรุปสิ่งที่ต้องมี

ต้องติดตั้งเครื่องมือเหล่านี้ก่อนเริ่มรันแอป:

- macOS สำหรับ iOS Simulator
- FVM สำหรับ pin Flutter version
- Flutter `3.41.9` ผ่าน FVM
- Xcode และ iOS Simulator runtime ที่ตรงกับ Xcode
- CocoaPods สำหรับ iOS dependencies
- Android Studio
- Android SDK, Platform Tools, Emulator, Command-line Tools และ Android system image
- Git

ตรวจสอบเครื่องมือหลัก:

```sh
fvm flutter doctor -v
```

โปรเจกต์นี้ pin Flutter version ไว้ใน `.fvmrc`:

```sh
fvm install
fvm flutter --version
```

ผลลัพธ์ควรเป็น Flutter `3.41.9`

## Quick Start

ใช้ชุดคำสั่งนี้หลัง clone repo และติดตั้ง Xcode/Android Studio แล้ว:

```sh
cd /Users/pawaponthammalangka/Documents/projects/diasight-mobile
fvm install
fvm flutter pub get
cp assets/env/.env.example assets/env/.env.development
cp assets/env/.env.example assets/env/.env.staging
cp assets/env/.env.example assets/env/.env.production
fvm flutter analyze
fvm flutter test
```

รันแอป development บนอุปกรณ์ตัวแรกที่ Flutter เห็น:

```sh
fvm flutter run -t lib/main_development.dart
```

ถ้าไม่มี device ให้ทำตามหัวข้อ iOS Simulator หรือ Android Emulator ด้านล่าง

## Project Entrypoints

โปรเจกต์แยก entrypoint ตาม environment:

```text
lib/main.dart
lib/main_development.dart
lib/main_staging.dart
lib/main_production.dart
```

ใช้คำสั่งรันตาม environment:

```sh
fvm flutter run -t lib/main_development.dart
fvm flutter run -t lib/main_staging.dart
fvm flutter run --profile -t lib/main_production.dart
```

ถ้าต้องระบุ device:

```sh
fvm flutter devices
fvm flutter run -d <device-id> -t lib/main_development.dart
```

## Environment Files

ไฟล์ตัวอย่างที่ commit ได้:

```text
assets/env/.env.example
```

สร้างไฟล์ local สำหรับแต่ละ environment:

```sh
cp assets/env/.env.example assets/env/.env.development
cp assets/env/.env.example assets/env/.env.staging
cp assets/env/.env.example assets/env/.env.production
```

ค่าเริ่มต้นใน `.env.example`:

```text
APP_ENV=development
APP_NAME=Diasight
API_BASE_URL=https://api.example.invalid
API_TIMEOUT_MS=30000
SSL_PINNING_ENABLED=false
CERTIFICATE_PIN_SHA256=
```

กฎความปลอดภัย:

- ห้าม commit `.env`, `.env.*`, keystore, private certificate, provisioning profile, `.p8`, `.p12`, `.pem` หรือ service account file
- ใช้ dotenv เฉพาะค่าที่ไม่ใช่ secret เช่น base URL, timeout, public feature flag
- token, refresh token และข้อมูลผู้ใช้ต้องเก็บผ่าน `flutter_secure_storage`
- production signing material ต้องเก็บใน CI secret หรือ secure vault เท่านั้น

## iOS Simulator Setup

หัวข้อนี้ใช้สำหรับ macOS และ Xcode

### 1. ติดตั้งและเลือก Xcode

ติดตั้ง Xcode จาก App Store หรือ Apple Developer แล้วเลือก Xcode path:

```sh
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
xcodebuild -version
```

ตรวจสอบ Flutter doctor:

```sh
fvm flutter doctor -v
```

### 2. ติดตั้ง iOS Simulator Runtime

เปิด Xcode:

```sh
open -a Xcode
```

ไปที่:

```text
Xcode > Settings > Components
```

ติดตั้ง iOS Simulator runtime ที่ตรงกับ Xcode version ที่ใช้งานอยู่

ตรวจสอบ runtime ที่ติดตั้ง:

```sh
xcrun simctl list runtimes
```

หมายเหตุสำหรับเครื่องนี้: ถ้า Xcode เป็น `26.4` แต่มี runtime แค่ `iOS 26.2` จะ build/run simulator ไม่ผ่าน ต้องติดตั้ง `iOS 26.4 Simulator Runtime` จาก Xcode Settings > Components ก่อน

### 3. เปิด Simulator

เปิด Simulator:

```sh
open -a Simulator
```

ดูรายการ simulator ที่ใช้ได้:

```sh
xcrun simctl list devices available
```

ถ้าต้อง boot device ด้วย UDID:

```sh
xcrun simctl boot <ios-simulator-udid>
open -a Simulator
```

หลัง Simulator เปิดแล้ว ให้ Flutter ตรวจ device:

```sh
fvm flutter devices
```

### 4. ติดตั้ง CocoaPods Dependencies

รันหลัง `fvm flutter pub get` และทุกครั้งที่ iOS plugin/dependency เปลี่ยน:

```sh
cd ios
pod install
cd ..
```

ถ้า pod มีปัญหาหรือ cache เพี้ยน:

```sh
cd ios
pod deintegrate
pod repo update
pod install
cd ..
```

### 5. Run บน iOS Simulator

Development:

```sh
fvm flutter run -d <ios-device-id> -t lib/main_development.dart
```

Staging:

```sh
fvm flutter run -d <ios-device-id> -t lib/main_staging.dart
```

Production profile:

```sh
fvm flutter run --profile -d <ios-device-id> -t lib/main_production.dart
```

ถ้า Flutter เห็น iOS Simulator ตัวเดียว สามารถไม่ใส่ `-d` ได้:

```sh
fvm flutter run -t lib/main_development.dart
```

### 6. iOS Troubleshooting

ถ้าไม่เห็น iOS Simulator:

```sh
open -a Simulator
xcrun simctl list devices available
fvm flutter devices
fvm flutter doctor -v
```

ถ้าเจอ error ว่า iOS platform runtime is not installed:

```text
Xcode > Settings > Components > install matching iOS Simulator Runtime
```

ถ้า CocoaPods error:

```sh
fvm flutter clean
fvm flutter pub get
cd ios
pod deintegrate
pod repo update
pod install
cd ..
```

ถ้า Xcode path ไม่ถูก:

```sh
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
fvm flutter doctor -v
```

Simulator ไม่ต้องใช้ production code signing สำหรับการรัน debug ปกติ

## Android Emulator Setup

หัวข้อนี้ใช้สำหรับ Android Studio และ Android SDK

### 1. ติดตั้ง Android Studio

ติดตั้ง Android Studio แล้วเปิดครั้งแรกให้จบ Android Setup Wizard

เปิด SDK Manager:

```text
Android Studio > Settings > Languages & Frameworks > Android SDK
```

ติดตั้งรายการหลัก:

- Android SDK Platform `Android 36`
- Android SDK Build-Tools `36.0.0`
- Android SDK Platform-Tools
- Android Emulator
- Android SDK Command-line Tools latest
- Android system image เช่น `Google APIs ARM 64 v8a System Image` สำหรับ Apple Silicon

### 2. ตั้งค่า ANDROID_HOME และ PATH

ค่า default บน macOS:

```sh
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
```

เพิ่มถาวรใน `~/.zshrc`:

```sh
cat <<'EOF' >> ~/.zshrc

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
EOF
source ~/.zshrc
```

ตรวจสอบ SDK path:

```sh
ls "$ANDROID_HOME"
which sdkmanager
which avdmanager
which emulator
which adb
```

หมายเหตุสำหรับเครื่องนี้: `ANDROID_HOME=/Users/pawaponthammalangka/Library/Android/sdk` ถูกตั้งไว้แล้ว แต่ Flutter แจ้งว่า SDK path นี้ยังไม่พบ SDK จริง ต้องติดตั้ง Android SDK ผ่าน Android Studio หรือแก้ path ให้ชี้ไป SDK ที่มีอยู่จริง

### 3. ติดตั้ง SDK Components ด้วย CLI

ถ้า `sdkmanager` พร้อมใช้งานแล้ว:

```sh
sdkmanager --install \
  "cmdline-tools;latest" \
  "platform-tools" \
  "emulator" \
  "platforms;android-36" \
  "build-tools;36.0.0" \
  "system-images;android-36;google_apis;arm64-v8a"
```

สำหรับเครื่อง Intel ให้เปลี่ยน system image เป็น x86_64:

```sh
sdkmanager --install "system-images;android-36;google_apis;x86_64"
```

ยอมรับ Android licenses:

```sh
yes | sdkmanager --licenses
```

ตรวจสอบ Flutter doctor อีกครั้ง:

```sh
fvm flutter doctor -v
```

### 4. สร้าง Android Virtual Device

ดู device profile:

```sh
avdmanager list device
```

สร้าง AVD สำหรับ Apple Silicon:

```sh
avdmanager create avd \
  -n diasight_pixel \
  -k "system-images;android-36;google_apis;arm64-v8a" \
  --device pixel_8
```

สร้าง AVD สำหรับ Intel:

```sh
avdmanager create avd \
  -n diasight_pixel \
  -k "system-images;android-36;google_apis;x86_64" \
  --device pixel_8
```

ดู AVD ที่สร้างแล้ว:

```sh
emulator -list-avds
```

### 5. เปิด Android Emulator

เปิด emulator:

```sh
emulator -avd diasight_pixel
```

เปิดแบบล้าง snapshot ถ้า emulator ค้าง:

```sh
emulator -avd diasight_pixel -no-snapshot-load
```

ตรวจสอบว่า adb เห็น emulator:

```sh
adb devices
```

ตรวจสอบว่า Flutter เห็น device:

```sh
fvm flutter devices
```

### 6. Run บน Android Emulator

Development:

```sh
fvm flutter run -d <android-device-id> -t lib/main_development.dart
```

Staging:

```sh
fvm flutter run -d <android-device-id> -t lib/main_staging.dart
```

Production profile:

```sh
fvm flutter run --profile -d <android-device-id> -t lib/main_production.dart
```

ถ้า Flutter เห็น Android Emulator ตัวเดียว:

```sh
fvm flutter run -t lib/main_development.dart
```

### 7. Android Troubleshooting

ถ้า `sdkmanager` หรือ `avdmanager` ไม่เจอ:

```sh
echo "$ANDROID_HOME"
ls "$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
```

ถ้า Flutter แจ้งว่า Android SDK not found:

```sh
ls "$HOME/Library/Android/sdk"
fvm flutter config --android-sdk "$HOME/Library/Android/sdk"
fvm flutter doctor -v
```

ถ้า emulator ไม่ขึ้นใน Flutter:

```sh
adb kill-server
adb start-server
adb devices
fvm flutter devices
```

ถ้ายังไม่มี AVD:

```sh
emulator -list-avds
fvm flutter emulators
```

ถ้า license ยังไม่ผ่าน:

```sh
yes | sdkmanager --licenses
fvm flutter doctor -v
```

ถ้า Gradle cache มีปัญหา:

```sh
fvm flutter clean
fvm flutter pub get
fvm flutter run -t lib/main_development.dart
```

## Build Commands

Android debug APK:

```sh
fvm flutter build apk --debug -t lib/main_development.dart
```

Android release APK:

```sh
fvm flutter build apk --release -t lib/main_production.dart
```

Android App Bundle:

```sh
fvm flutter build appbundle --release -t lib/main_production.dart
```

iOS simulator debug build:

```sh
fvm flutter build ios --simulator --debug -t lib/main_development.dart
```

iOS release build:

```sh
fvm flutter build ios --release -t lib/main_production.dart
```

Android release signing ใช้ `android/key.properties` เมื่อมีไฟล์จริง:

```sh
cp android/key.properties.example android/key.properties
```

ห้าม commit `android/key.properties` และไฟล์ keystore จริง

## Tailwind-Style Design System

Flutter ไม่ได้ใช้ Node Tailwind CSS โดยตรง โปรเจกต์นี้ใช้แนวคิด Tailwind แบบ utility-first ผ่าน package ของ Flutter:

- `tailwind_colors` สำหรับชุดสีแบบ Tailwind
- `mix` สำหรับ style composition, variants, tokens และ utility-first styling

ไฟล์ design system หลัก:

```text
lib/core/theme/app_theme.dart
lib/core/theme/app_mix_tokens.dart
lib/core/theme/tokens/colors/app_color_palette.dart
lib/core/theme/tokens/colors/app_colors.dart
lib/core/theme/tokens/colors/app_color_tokens.dart
lib/core/theme/tokens/typography/app_font_families.dart
lib/core/theme/tokens/typography/app_font_sizes.dart
lib/core/theme/tokens/typography/app_text_theme.dart
lib/core/theme/tokens/typography/app_text_tokens.dart
lib/core/theme/tokens/spacing/app_space_tokens.dart
lib/core/theme/tokens/radius/app_radius_tokens.dart
lib/core/theme/tokens/elevation/app_elevation_tokens.dart
lib/core/theme/tokens/motion/app_motion_tokens.dart
```

Font ที่ลงไว้:

```text
assets/fonts/kanit/
assets/fonts/montserrat/
```

Font family ที่พร้อมใช้ใน `pubspec.yaml`:

```text
Kanit
Montserrat
```

Color palette ตั้งต้นจาก design system:

```text
#5142AB
#BC8DDE
#C3A6DC
#FFFFFF
#FF7280
#FF8A65
```

กฎของทีม:

- Feature module ต้องใช้ semantic tokens จาก `core/theme`
- ห้าม hardcode สีและขนาดฟอนต์ใน feature โดยตรง
- Design tokens อยู่ใน `core/theme` เท่านั้น
- Feature-specific UI style ควรอยู่ใน feature นั้น ไม่ย้ายกลับเข้า core ถ้ายังไม่ reusable จริง

## Project Structure

โครงสร้างหลัก:

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

กฎ Clean Architecture:

- `core` เป็น shared foundation และต้องไม่ depend on feature ใด
- `features/<name>/presentation` เก็บ widget, controller, route binding และ presentation state ของ feature นั้น
- `features/<name>/domain` เก็บ entity, repository contract, use case, value object และ failure
- `features/<name>/data` เก็บ DTO, remote/local data source, mapper และ repository implementation
- Feature หนึ่งไม่ควร import อีก feature โดยตรง ถ้าต้องแชร์ contract ให้ย้ายไป `core` หรือ `shared` ตามความเหมาะสม
- ห้ามใส่ business logic ใน README, theme token หรือ app bootstrap

## Code Generation

รันเมื่อมีการเพิ่มหรือแก้ไฟล์ที่ใช้ Freezed, JSON Serializable หรือ Riverpod generator:

```sh
fvm dart run build_runner build
```

ถ้ามี generated file conflict:

```sh
fvm dart run build_runner build --delete-conflicting-outputs
```

## Quality Checks

ก่อน push ทุกครั้งให้รัน:

```sh
fvm flutter analyze
fvm flutter test
fvm dart run build_runner build
```

ตรวจว่า Git ignore ไฟล์ sensitive จริง:

```sh
git check-ignore -v .env assets/env/.env.production android/key.properties android/app/release.keystore ios/Runner/AuthKey_SECRET.p8
```

## Clean Rebuild

ใช้เมื่อ dependency, generated file, Gradle, CocoaPods หรือ build cache มีปัญหา:

```sh
fvm flutter clean
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
cd ios
pod install
cd ..
```

รันใหม่:

```sh
fvm flutter run -t lib/main_development.dart
```

## Current Local Checklist

เช็กสถานะเครื่องก่อนเริ่มรันจริง:

```sh
fvm flutter doctor -v
fvm flutter devices
fvm flutter emulators
xcrun simctl list runtimes
xcrun simctl list devices available
emulator -list-avds
adb devices
```

ถ้าเครื่องนี้ยังขึ้นว่า Android SDK not found:

```sh
open -a "Android Studio"
```

แล้วติดตั้ง Android SDK ที่:

```text
Android Studio > Settings > Languages & Frameworks > Android SDK
```

ถ้าเครื่องนี้ยังขึ้นว่า iOS runtime ไม่ตรงกับ Xcode:

```text
Xcode > Settings > Components > install matching iOS Simulator Runtime
```

หลังแก้ SDK/runtime แล้วให้รัน:

```sh
fvm flutter doctor -v
fvm flutter devices
fvm flutter run -t lib/main_development.dart
```

## Security Rules

- ไม่ commit secret ทุกชนิด
- ไม่เก็บ token ใน dotenv
- ไม่ commit production keystore
- ไม่ commit Apple signing private key
- ใช้ `flutter_secure_storage` สำหรับ token storage
- ใช้ CI secret สำหรับ production build signing
- public SSL pin หรือ public certificate วางได้ที่ `assets/certificates/` เท่านั้น

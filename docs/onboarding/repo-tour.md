# Diasight Repo Tour

เอกสารนี้เอาไว้พาเพื่อนใหม่ดู repo แบบเร็วแต่ใช้งานได้จริง อ่านจบควรรู้ว่าไฟล์ไหนอยู่ตรงไหน เวลาได้งานเช่น login, onboarding, dashboard ต้องเริ่มเขียนที่ folder ไหน และเวลาใช้สี/ฟอนต์ต้องใช้ token ตัวไหน

ถ้างานคือทำ UI อย่างเดียวสำหรับ 2 หน้า Onboarding และ Login ให้อ่านคู่มือเฉพาะทางนี้ก่อน: [ui-onboarding-login-guide.md](ui-onboarding-login-guide.md)

## ภาพรวมสั้นๆ

โปรเจกต์นี้ใช้แนว Feature-First Clean Architecture:

- `lib/app/` คือโครงแอปหลัก เช่น bootstrap, router, app shell
- `lib/core/` คือของกลางระดับระบบ เช่น config, network, security, theme, storage, error
- `lib/features/` คือที่เขียนงาน product จริง เช่น auth, onboarding, dashboard
- `lib/shared/` คือ widget/provider กลางที่หลาย feature ใช้ซ้ำ
- `assets/` คือ env, font, icon, image, lottie, certificate public
- `docs/` คือเอกสารทีม
- `test/` คือ test ที่ mirror ตาม `lib/`

กติกาหลัก: งานของ feature ไหน ให้เขียนใน feature นั้นก่อน อย่ารีบย้ายเข้า `core` หรือ `shared` จนกว่าจะใช้ซ้ำจริง

## โฟลเดอร์หลัก

| Folder | ใช้ทำอะไร | ไม่ควรใส่อะไร |
| --- | --- | --- |
| `lib/app/` | ตั้งค่าแอป, theme, localization, root router, bootstrap | business logic ของ login/dashboard |
| `lib/core/` | foundation กลางที่ feature ใช้ร่วมกัน | code ที่รู้จัก feature เฉพาะ เช่น `LoginUseCase` |
| `lib/features/` | งานแต่ละ feature แบบแยกทีมทำได้ | shared button หรือ token กลาง |
| `lib/shared/` | widget/layout/form/dialog ที่ reusable จริง | logic เฉพาะหน้า login |
| `lib/l10n/` | translation key ภาษาอังกฤษ/ไทย | hardcoded UI string ยาวๆ ใน widget |
| `assets/env/` | `.env.example` และ env local ที่ไม่ใช่ secret | token, password, signing key |
| `assets/fonts/` | font Kanit และ Montserrat | font ที่ยังไม่ได้ประกาศใน `pubspec.yaml` |
| `assets/images/` | image asset ของแอป | secret, private certificate |
| `docs/` | architecture, onboarding, release, security docs | source code |
| `test/` | unit/widget test | generated build output |

## App Layer

`lib/app/` เป็นชั้นประกอบแอปทั้งก้อน ไม่ใช่ที่เขียน feature

ไฟล์สำคัญ:

- `lib/app/bootstrap/bootstrap.dart` เริ่มต้น Flutter, โหลด environment, ใส่ Riverpod override แล้ว `runApp`
- `lib/app/app.dart` ประกอบ `MaterialApp.router`, theme, localization, `MixScope`
- `lib/app/router/app_router.dart` root router ของ GoRouter
- `lib/main_development.dart` entrypoint development
- `lib/main_staging.dart` entrypoint staging
- `lib/main_production.dart` entrypoint production

ถ้าจะเพิ่ม route ใหม่ ให้เพิ่ม route ผ่าน `app_router.dart` หรือให้ feature เตรียม route ของตัวเองใน `features/<feature>/presentation/routes/` แล้วค่อย import มาเสียบที่ root router

ข้อควรระวัง: `app_router.dart` เป็นไฟล์ที่ชนกันง่าย ถ้ามีหลายคนทำหลาย feature ให้ตกลงกันว่า 1 PR ใครเป็นคนรวม route

## Core Layer

`lib/core/` คือของกลางระดับระบบ ใช้ได้ทุก feature แต่ต้องไม่รู้จัก feature ใด feature หนึ่ง

โฟลเดอร์ที่มีตอนนี้:

- `core/config/` โหลด environment/flavor เช่น development, staging, production
- `core/network/` วาง Dio client, interceptor, retry, SSL pinning, token refresh
- `core/security/` secure storage, crypto, biometrics, redaction
- `core/storage/` cache/local/session storage
- `core/errors/` exception, failure, result/either pattern
- `core/theme/` design system, color, typography, spacing, radius, motion
- `core/logging/` logger กลาง
- `core/platform/` device, permission, platform service
- `core/validation/` validation กลาง
- `core/utils/` helper กลางที่ไม่ผูกกับ feature

กติกา:

- อย่าเอา login logic, dashboard logic, onboarding logic มาไว้ใน `core`
- อะไรที่ใช้แค่ feature เดียว ให้อยู่ใน feature นั้นก่อน
- ถ้าจะย้ายเข้า `core` ต้องตอบให้ได้ว่า "อย่างน้อย 2 feature ใช้ร่วมกันจริงไหม"

## Feature Layer

ทุก feature อยู่ใน `lib/features/<feature_name>/`

โครงที่ใช้เหมือนกัน:

```text
lib/features/<feature_name>/
|-- data/
|   |-- datasources/
|   |   |-- local/
|   |   `-- remote/
|   |-- dto/
|   |   |-- request/
|   |   `-- response/
|   |-- mappers/
|   |-- models/
|   `-- repositories/
|-- domain/
|   |-- entities/
|   |-- failures/
|   |-- repositories/
|   |-- usecases/
|   `-- value_objects/
`-- presentation/
    |-- controllers/
    |-- providers/
    |-- routes/
    |-- state/
    `-- widgets/
```

ความหมายของแต่ละชั้น:

- `presentation/` คือ UI, state สำหรับหน้าจอ, controller, provider, route ของ feature
- `domain/` คือ business rule แบบไม่สน API/UI เช่น entity, use case, repository contract
- `data/` คือการคุยกับ API/local storage, DTO, mapper, repository implementation

จำง่ายๆ:

- UI กดปุ่ม/แสดงผล = `presentation`
- กติกาธุรกิจ = `domain`
- เรียก API/อ่านเขียน storage = `data`

## ถ้าทำ Login ต้องเขียนตรงไหน

Login เป็นส่วนของ `auth`:

```text
lib/features/auth/
```

แนะนำให้แบ่งงานแบบนี้:

| งาน | วางที่ไหน |
| --- | --- |
| หน้า login เต็มหน้า | `features/auth/presentation/pages/login_page.dart` ถ้ายังไม่มี `pages/` ให้สร้างเพิ่ม |
| widget ย่อย เช่น field, button, form | `features/auth/presentation/widgets/` |
| state ของหน้า login | `features/auth/presentation/state/` |
| controller/notifier ของ login | `features/auth/presentation/controllers/` |
| provider เฉพาะ auth | `features/auth/presentation/providers/` |
| route ของ login | `features/auth/presentation/routes/` |
| use case เช่น login, logout, refresh token | `features/auth/domain/usecases/` |
| entity เช่น authenticated user/session | `features/auth/domain/entities/` |
| repository contract | `features/auth/domain/repositories/` |
| request/response DTO | `features/auth/data/dto/request/`, `features/auth/data/dto/response/` |
| API call login | `features/auth/data/datasources/remote/` |
| secure/local session source | `features/auth/data/datasources/local/` |
| mapper DTO -> entity | `features/auth/data/mappers/` |
| repository implementation | `features/auth/data/repositories/` |

กติกา login:

- UI ห้ามเรียก Dio ตรงๆ
- UI ห้ามรู้จัก response DTO จาก API
- token ห้ามเก็บใน `.env`
- token/refresh token ต้องใช้ secure storage ใน `core/security/secure_storage/`
- ถ้าต้อง refresh token ให้วางระบบกลางไว้ใน `core/network/token_refresh/`

## ถ้าทำ Onboarding ต้องเขียนตรงไหน

Onboarding ควรเป็น feature แยก ไม่ควรยัดไว้ใน auth ถ้ามันมี flow, screen, state ของตัวเอง

ให้สร้าง:

```text
lib/features/onboarding/
|-- data/
|   |-- datasources/
|   |   |-- local/
|   |   `-- remote/
|   |-- dto/
|   |   |-- request/
|   |   `-- response/
|   |-- mappers/
|   |-- models/
|   `-- repositories/
|-- domain/
|   |-- entities/
|   |-- failures/
|   |-- repositories/
|   |-- usecases/
|   `-- value_objects/
`-- presentation/
    |-- controllers/
    |-- pages/
    |-- providers/
    |-- routes/
    |-- state/
    `-- widgets/
```

ตัวอย่างการวางงาน:

| งาน | วางที่ไหน |
| --- | --- |
| หน้า intro/welcome | `features/onboarding/presentation/pages/` |
| carousel/progress indicator | `features/onboarding/presentation/widgets/` |
| state ว่าดูถึง step ไหน | `features/onboarding/presentation/state/` |
| controller กด next/skip/done | `features/onboarding/presentation/controllers/` |
| route onboarding | `features/onboarding/presentation/routes/` |
| use case เช่น mark onboarding completed | `features/onboarding/domain/usecases/` |
| local flag ว่าเคยดูแล้วไหม | `features/onboarding/data/datasources/local/` |

ถ้า onboarding แค่ static UI ยังไม่ต้องสร้าง `data/` หรือ `domain/` เพิ่มเยอะก็ได้ แต่โครง folder เตรียมไว้ให้ขยายได้เมื่อมี state/storage/API จริง

## ถ้าทำ Dashboard ต้องเขียนตรงไหน

Dashboard มี feature เตรียมไว้แล้ว:

```text
lib/features/dashboard/
```

วางงานประมาณนี้:

| งาน | วางที่ไหน |
| --- | --- |
| หน้า dashboard หลัก | `features/dashboard/presentation/pages/dashboard_page.dart` ถ้ายังไม่มี `pages/` ให้สร้างเพิ่ม |
| card/section/chart widget | `features/dashboard/presentation/widgets/` |
| state loading/error/data | `features/dashboard/presentation/state/` |
| controller ดึงข้อมูล dashboard | `features/dashboard/presentation/controllers/` |
| use case เช่น get dashboard summary | `features/dashboard/domain/usecases/` |
| entity summary/metric | `features/dashboard/domain/entities/` |
| API dashboard | `features/dashboard/data/datasources/remote/` |
| DTO response dashboard | `features/dashboard/data/dto/response/` |
| mapper DTO -> entity | `features/dashboard/data/mappers/` |

กติกา dashboard:

- Widget รับข้อมูลที่พร้อมแสดง ไม่ควร parse response เอง
- ถ้ามี chart/table ให้แยก widget ย่อย ไม่ใส่ทุกอย่างในหน้าเดียว
- ถ้ามีหลาย API ให้ controller คุยผ่าน use case ไม่เรียก data source ตรง

## Presentation เขียนยังไง

ใน `presentation/` ให้แยกงานตามหน้าที่:

- `pages/` หน้าจอเต็มที่ผูกกับ route เช่น `login_page.dart`
- `widgets/` widget ย่อยที่ใช้ใน feature เดียว เช่น `login_form.dart`
- `controllers/` Riverpod notifier/controller ที่รับ action จาก UI
- `state/` state class ของหน้า/flow
- `providers/` provider เฉพาะ feature
- `routes/` route name/path/builder ของ feature

ถ้า widget ใช้ซ้ำเฉพาะใน auth ให้อยู่ `auth/presentation/widgets/`

ถ้า widget ใช้ซ้ำทั้ง auth, onboarding, dashboard ค่อยย้ายไป:

```text
lib/shared/presentation/widgets/
```

## Domain เขียนยังไง

`domain/` ต้องเป็น Dart logic ที่ไม่ผูก Flutter UI และไม่รู้จัก API response

ใส่ที่นี่:

- entity ที่ app ใช้จริง
- value object เช่น email/password validation value
- repository contract
- use case
- failure เฉพาะ feature

ไม่ควรใส่:

- `BuildContext`
- `Widget`
- `Dio`
- JSON key จาก API
- `SharedPreferences` หรือ secure storage implementation

## Data เขียนยังไง

`data/` คือชั้นต่อโลกข้างนอก

ใส่ที่นี่:

- remote data source เรียก API
- local data source อ่านเขียน storage
- DTO request/response
- mapper ระหว่าง DTO กับ domain entity
- repository implementation

กติกา:

- DTO อยู่แค่ใน `data`
- Presentation ไม่ควร import DTO
- Domain ไม่ควร import DTO
- API error ควรถูก map เป็น Failure ก่อนส่งกลับขึ้นไป

## Shared ใช้เมื่อไร

ใช้ `lib/shared/` เมื่อของนั้น reusable จริง และไม่ผูกกับ feature เดียว

ตัวอย่างที่ควรอยู่ shared:

- primary button ที่ใช้ทั้งแอป
- app text field
- dialog กลาง
- empty state กลาง
- app scaffold/layout กลาง

ตัวอย่างที่ไม่ควรอยู่ shared:

- `LoginButton` ที่ใช้เฉพาะหน้า login
- `OnboardingSlideCard` ที่ใช้เฉพาะ onboarding
- `DashboardMetricCard` ที่ใช้เฉพาะ dashboard

ถ้ายังไม่แน่ใจ ให้อยู่ใน feature ก่อน ย้ายออกทีหลังง่ายกว่ายัด shared เร็วเกินไป

## Routing ใช้ยังไง

Root router อยู่ที่:

```text
lib/app/router/app_router.dart
```

Feature route ควรเตรียมไว้ใน:

```text
features/<feature>/presentation/routes/
```

แนวทางทำงานเป็นทีม:

- feature owner เขียน route ของตัวเองใน feature
- คนเดียวเป็นคนรวมเข้า `app_router.dart`
- route name/path ควรเก็บเป็น constant ไม่กระจาย string ซ้ำหลายไฟล์
- route ที่ต้อง auth guard ควรรอ infrastructure ใน auth/router guard ก่อน อย่า hardcode check กระจายตามหน้า

## Environment ใช้ยังไง

ไฟล์ environment อยู่ที่:

```text
assets/env/.env.example
assets/env/.env.development
assets/env/.env.staging
assets/env/.env.production
```

ตัวโหลด environment อยู่ที่:

```text
lib/core/config/environment/
lib/core/config/flavors/
```

รันแอปตาม environment:

```sh
fvm flutter run -t lib/main_development.dart
fvm flutter run -t lib/main_staging.dart
fvm flutter run --profile -t lib/main_production.dart
```

ห้ามใส่ secret ใน env file:

- ห้ามใส่ access token
- ห้ามใส่ refresh token
- ห้ามใส่ password
- ห้ามใส่ private key

## สีใช้ยังไง

สีใน repo แบ่งเป็น 3 ชั้น:

### 1. Raw Palette

ไฟล์:

```text
lib/core/theme/tokens/colors/app_color_palette.dart
```

ค่า palette จาก design system:

| Token | Hex |
| --- | --- |
| `deepViolet` | `#5142AB` |
| `lavender` | `#BC8DDE` |
| `softLavender` | `#C3A6DC` |
| `white` | `#FFFFFF` |
| `salmon` | `#FF7280` |
| `coral` | `#FF8A65` |

กติกา: feature ไม่ควรใช้ `AppColorPalette` ตรงๆ เพราะเป็นค่าสีดิบ เอาไว้ให้ design system owner ปรับเท่านั้น

### 2. Semantic Colors

ไฟล์:

```text
lib/core/theme/tokens/colors/app_colors.dart
```

นี่คือสีที่ feature ใช้ได้ เพราะชื่อบอกหน้าที่ ไม่ใช่ชื่อ hex:

| ใช้กับอะไร | ใช้ token |
| --- | --- |
| สีหลักของแบรนด์/primary action | `AppColors.brand` |
| ตัวอักษรบน primary | `AppColors.brandForeground` |
| ปุ่ม/element รอง | `AppColors.accent` |
| background หน้าจอ | `AppColors.background` |
| card/sheet/input surface | `AppColors.surface` |
| surface สีอ่อน | `AppColors.surfaceMuted` |
| border/divider | `AppColors.border` |
| text หลัก | `AppColors.textPrimary` |
| text รอง | `AppColors.textSecondary` |
| text จาง/placeholder | `AppColors.textMuted` |
| success state | `AppColors.success` |
| warning state | `AppColors.warning` |
| error/destructive | `AppColors.danger` |
| info/link/highlight | `AppColors.info` |

ตัวอย่างใช้งานแบบ Flutter ปกติ:

```dart
import 'package:diasight_app/core/theme/tokens/colors/app_colors.dart';

Text(
  'เข้าสู่ระบบ',
  style: Theme.of(context).textTheme.displaySmall?.copyWith(
    color: AppColors.textPrimary,
  ),
)
```

ถ้าเป็น Material widget ให้ใช้ `Theme.of(context).colorScheme` ก่อน เมื่อมันตอบโจทย์:

```dart
final colorScheme = Theme.of(context).colorScheme;
```

เช่น primary button ใช้ `colorScheme.primary`, error ใช้ `colorScheme.error`, surface ใช้ `colorScheme.surface`

### 3. Mix Tokens

ไฟล์:

```text
lib/core/theme/tokens/colors/app_color_tokens.dart
lib/core/theme/app_mix_tokens.dart
```

`AppMixTokens` ถูก register ที่ `lib/app/app.dart` ผ่าน `MixScope.withMaterial` แล้ว

ถ้าใช้ `mix` ให้เรียก token จาก:

```text
AppColorTokens.brand
AppColorTokens.surface
AppColorTokens.textPrimary
AppColorTokens.danger
```

กติกา: ถ้าเขียน style แบบ Mix ให้ใช้ `AppColorTokens` ถ้าเขียน widget Material ปกติให้ใช้ `Theme.of(context)` หรือ `AppColors`

## ฟอนต์และขนาดตัวอักษรใช้ยังไง

Font family อยู่ที่:

```text
lib/core/theme/tokens/typography/app_font_families.dart
```

Font ที่มี:

- `Kanit` เป็น primary font
- `Montserrat` เป็น secondary font

ขนาดตัวอักษรอยู่ที่:

```text
lib/core/theme/tokens/typography/app_font_sizes.dart
```

Scale ปัจจุบัน:

| Role | Size |
| --- | ---: |
| `heading1` | 48 |
| `heading2` | 40 |
| `heading3` | 33 |
| `heading4` | 28 |
| `title` | 23 |
| `body1` | 19 |
| `body2` | 16 |
| `description1` | 13 |
| `description2` | 11 |

Material text theme อยู่ที่:

```text
lib/core/theme/tokens/typography/app_text_theme.dart
```

แนะนำให้ใช้:

```dart
final textTheme = Theme.of(context).textTheme;
```

Mapping ที่ใช้บ่อย:

| งาน | ใช้ style |
| --- | --- |
| hero/title ใหญ่มาก | `textTheme.displayLarge` |
| heading หลักของหน้า | `textTheme.displaySmall` หรือ `headlineMedium` |
| section title | `textTheme.titleLarge` |
| body หลัก | `textTheme.bodyLarge` หรือ `bodyMedium` |
| description/helper text | `textTheme.bodySmall` หรือ `labelSmall` |

กติกา:

- อย่า hardcode `fontSize` ใน feature ถ้า role มีอยู่แล้ว
- ใช้ `Theme.of(context).textTheme` ก่อน
- ใช้ `AppFontSizes` เฉพาะตอนทำ component/token ที่จำเป็นจริง
- ใช้ `Montserrat` เฉพาะจุดที่ design ระบุ ไม่ใช่สุ่มใช้เพื่อความสวย

## Spacing, Radius, Motion

Spacing token:

```text
lib/core/theme/tokens/spacing/app_space_tokens.dart
```

ค่าใช้งาน:

| Token | Size |
| --- | ---: |
| `zero` | 0 |
| `xxs` | 4 |
| `xs` | 8 |
| `sm` | 12 |
| `md` | 16 |
| `lg` | 24 |
| `xl` | 32 |
| `xxl` | 40 |
| `section` | 64 |

Radius token:

```text
lib/core/theme/tokens/radius/app_radius_tokens.dart
```

ค่าใช้งาน:

- `sm` = 4
- `md` = 8
- `lg` = 12
- `full` = 999

Motion token:

```text
lib/core/theme/tokens/motion/app_motion_tokens.dart
```

ค่าใช้งาน:

- `fast` = 150ms
- `normal` = 250ms
- `slow` = 400ms
- curve มาตรฐานคือ `standardCurve`

## Assets วางตรงไหน

ประกาศไว้ใน `pubspec.yaml` แล้ว:

```text
assets/env/
assets/certificates/
assets/icons/
assets/images/
assets/lottie/
```

แนวทางตั้งชื่อ:

- icon: `assets/icons/<feature>/<name>.svg` หรือ `.png`
- image: `assets/images/<feature>/<name>.png`
- lottie: `assets/lottie/<feature>/<name>.json`
- certificate public pin/cert: `assets/certificates/<name>`

ห้ามใส่ private key หรือ signing file ใน assets

## Localization

ไฟล์ภาษาอยู่ที่:

```text
lib/l10n/app_en.arb
lib/l10n/app_th.arb
```

กติกา:

- text ที่ user เห็นควรเข้า l10n
- key ควรสื่อ feature เช่น `authLoginTitle`, `onboardingSkipButton`
- อย่า hardcode copy ยาวๆ ใน widget
- ถ้าแก้ copy พร้อมกันหลายคน ระวัง conflict ใน `.arb`

## Testing วางตรงไหน

ให้ mirror ตาม `lib/`:

```text
test/core/theme/app_theme_test.dart
test/features/auth/...
test/features/onboarding/...
test/features/dashboard/...
```

แนวทาง:

- use case มี unit test
- mapper มี unit test
- controller/provider มี unit test เมื่อมี state สำคัญ
- widget test ใช้กับ component ที่มี interaction หรือ state
- integration flow ให้วางใน `integration_test/`

ก่อนส่งงาน:

```sh
fvm flutter analyze
fvm flutter test
fvm dart run build_runner build
```

## วิธีแบ่งงานให้ไม่ชนกัน

ตัวอย่างแบ่งงานในทีม:

- Dev A ทำ Login UI: แตะ `features/auth/presentation/` เป็นหลัก
- Dev B ทำ Auth API: แตะ `features/auth/data/` และ `features/auth/domain/`
- Dev C ทำ Onboarding: แตะ `features/onboarding/`
- Dev D ทำ Dashboard: แตะ `features/dashboard/`
- Design system owner แตะ `core/theme/`
- App integrator แตะ `app/router/` และ `app/app.dart`

ไฟล์ที่ชนง่าย:

- `lib/app/router/app_router.dart`
- `pubspec.yaml`
- `pubspec.lock`
- `lib/l10n/*.arb`
- theme token ใน `core/theme/`

วิธีลด conflict:

- ให้ feature owner เขียนใน folder ตัวเองก่อน
- route รวมโดยคนเดียวท้ายงาน
- dependency ใหม่ต้องคุยก่อนเพิ่ม
- design token ใหม่ให้รวมผ่านคนดูแล design system
- อย่า format ไฟล์ใหญ่โดยไม่จำเป็น

## Checklist ตอนเริ่ม feature ใหม่

1. สร้าง folder ใน `lib/features/<feature_name>/`
2. เริ่มจาก `presentation/` ถ้าเป็น UI-only
3. เพิ่ม `domain/` เมื่อมี business rule หรือ use case
4. เพิ่ม `data/` เมื่อเริ่มคุย API/storage
5. เพิ่ม route ใน `presentation/routes/`
6. ให้คนรวม route เอาไปเสียบใน `app/router/app_router.dart`
7. ใช้สีจาก `Theme.of(context)`, `AppColors`, หรือ `AppColorTokens`
8. ใช้ font จาก `Theme.of(context).textTheme`
9. เพิ่ม test ตามความเสี่ยงของ logic
10. รัน analyze/test/build_runner ก่อน push

## Checklist ก่อนเปิด PR หรือ push

```sh
fvm flutter analyze
fvm flutter test
fvm dart run build_runner build
git diff --check
```

Commit message ต้องมี type:

```text
feat: add login route
fix: handle empty dashboard state
docs: add repo tour
chore: update tooling config
test: add auth use case tests
refactor: split dashboard widgets
```

## จำสั้นๆ

- Feature อยู่ `lib/features/<feature>/`
- UI อยู่ `presentation`
- Business rule อยู่ `domain`
- API/storage อยู่ `data`
- ของกลางจริงๆ ค่อยเข้า `core` หรือ `shared`
- สีห้าม hardcode hex ใน feature
- ฟอนต์ใช้ `Theme.of(context).textTheme`
- route รวมที่ `app_router.dart` ระวัง conflict
- secret ห้ามเข้า repo

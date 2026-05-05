# UI Guide: Onboarding และ Login

เอกสารนี้สำหรับคนที่ทำ UI อย่างเดียว 2 หน้าแรกของแอป Diasight:

- Onboarding
- Login

ขอบเขตชัดๆ: ทำเฉพาะหน้าจอ, layout, widget, style, responsive, animation เล็กๆ และ state ที่เกี่ยวกับ UI เท่านั้น ยังไม่เขียน API, login จริง, secure storage, validation business rule หรือ business logic

## ต้องแตะ folder ไหนบ้าง

สำหรับงานนี้ให้แตะหลักๆ แค่ 3 จุด:

```text
lib/features/onboarding/presentation/
lib/features/auth/presentation/
lib/shared/presentation/
```

และถ้ามี asset:

```text
assets/images/
assets/icons/
assets/lottie/
```

ถ้าเป็นสี ฟอนต์ spacing radius ห้ามสร้างเองใน feature ให้ใช้จาก:

```text
lib/core/theme/
```

## ห้ามแตะอะไรถ้าทำ UI อย่างเดียว

ยังไม่ต้องยุ่งกับ folder พวกนี้:

```text
lib/features/auth/data/
lib/features/auth/domain/
lib/features/onboarding/data/
lib/features/onboarding/domain/
lib/core/network/
lib/core/security/
lib/core/storage/
```

เหตุผลคือ folder เหล่านี้เอาไว้สำหรับ API, token, storage, use case, business rule และ data model งาน UI รอบนี้ยังไม่ต้องใช้

## โครงที่เตรียมไว้สำหรับ UI-only

```text
lib/features/
|-- onboarding/
|   `-- presentation/
|       |-- controllers/
|       |-- pages/
|       |-- providers/
|       |-- routes/
|       |-- state/
|       `-- widgets/
`-- auth/
    `-- presentation/
        |-- controllers/
        |-- pages/
        |-- providers/
        |-- routes/
        |-- state/
        `-- widgets/
```

## Folder แต่ละตัวทำอะไร

| Folder | ใช้ทำอะไร | ตัวอย่างไฟล์ |
| --- | --- | --- |
| `presentation/pages/` | หน้าจอเต็ม 1 หน้า ที่ router เปิดเข้ามา | `onboarding_page.dart`, `login_page.dart` |
| `presentation/widgets/` | widget ย่อยของหน้านั้น ใช้แยก layout ให้อ่านง่าย | `onboarding_slide_card.dart`, `login_form.dart` |
| `presentation/state/` | state ที่เกี่ยวกับ UI เท่านั้น เช่น current slide, password visible | `onboarding_ui_state.dart`, `login_ui_state.dart` |
| `presentation/controllers/` | controller/notifier ที่คุม UI action เช่น next slide, toggle password | `onboarding_controller.dart`, `login_form_controller.dart` |
| `presentation/providers/` | Riverpod provider เฉพาะ UI ของ feature | `onboarding_providers.dart`, `login_providers.dart` |
| `presentation/routes/` | route path/name/builder ของ feature | `onboarding_routes.dart`, `auth_routes.dart` |
| `shared/presentation/widgets/` | widget ที่ใช้ซ้ำมากกว่า 1 feature จริงๆ | `app_primary_button.dart`, `app_text_field.dart` |
| `shared/presentation/layouts/` | layout กลาง เช่น safe area scaffold หรือ auth layout | `auth_page_layout.dart` |
| `shared/presentation/forms/` | form component กลางที่ reuse ได้ | `app_password_field.dart` |

กติกาง่ายๆ: ถ้าใช้แค่หน้าเดียว ให้อยู่ใน feature ก่อน ถ้าใช้ทั้ง Onboarding และ Login จริงๆ ค่อยย้ายไป `shared`

## Onboarding Page

หน้าที่ของ Onboarding คือแนะนำแอปก่อนเข้าระบบ อาจมี 3 slides, ปุ่ม Next, Skip, indicator และปุ่ม Get Started

### Folder ที่ใช้

```text
lib/features/onboarding/presentation/
|-- pages/
|   `-- onboarding_page.dart
|-- widgets/
|   |-- onboarding_slide_card.dart
|   |-- onboarding_page_indicator.dart
|   |-- onboarding_action_bar.dart
|   `-- onboarding_illustration.dart
|-- state/
|   `-- onboarding_ui_state.dart
|-- controllers/
|   `-- onboarding_controller.dart
|-- providers/
|   `-- onboarding_providers.dart
`-- routes/
    `-- onboarding_routes.dart
```

### แต่ละไฟล์ควรทำอะไร

| ไฟล์ | หน้าที่ |
| --- | --- |
| `onboarding_page.dart` | รวม layout ทั้งหน้า, `PageView`, safe area, background, เรียก widget ย่อย |
| `onboarding_slide_card.dart` | แสดง slide เดียว เช่น image, title, description |
| `onboarding_page_indicator.dart` | จุด indicator บอก slide ปัจจุบัน |
| `onboarding_action_bar.dart` | ปุ่ม Skip, Next, Get Started |
| `onboarding_illustration.dart` | รูปหรือ lottie ของแต่ละ slide |
| `onboarding_ui_state.dart` | เก็บ `currentIndex`, `totalSlides`, `isLastPage` แบบ UI-only |
| `onboarding_controller.dart` | คุม next/previous/skip/changePage เฉพาะ UI |
| `onboarding_providers.dart` | ประกาศ provider ที่หน้า onboarding ใช้ |
| `onboarding_routes.dart` | route name/path ของหน้า onboarding |

### สิ่งที่ยังไม่ควรทำใน Onboarding UI

- ยังไม่เขียน local storage ว่าดู onboarding แล้ว
- ยังไม่เขียน API
- ยังไม่ redirect จริงหลังจบ onboarding ถ้ายังไม่มี auth flow
- ยังไม่ hardcode สีแบบ `Color(0xFF...)` ใน widget
- ยังไม่ใส่ business rule ใน widget

ถ้าต้อง mock flow ชั่วคราว ให้ทำแค่ UI action เช่นกด Next แล้วเปลี่ยน slide ส่วน Get Started ให้ปล่อย callback หรือ TODO สั้นๆ ได้

## Login Page

หน้าที่ของ Login คือหน้าเข้าสู่ระบบ UI เท่านั้น ยังไม่ login จริง

### Folder ที่ใช้

```text
lib/features/auth/presentation/
|-- pages/
|   `-- login_page.dart
|-- widgets/
|   |-- login_header.dart
|   |-- login_form.dart
|   |-- login_email_field.dart
|   |-- login_password_field.dart
|   |-- login_submit_button.dart
|   `-- login_footer_links.dart
|-- state/
|   `-- login_ui_state.dart
|-- controllers/
|   `-- login_form_controller.dart
|-- providers/
|   `-- login_providers.dart
`-- routes/
    `-- auth_routes.dart
```

### แต่ละไฟล์ควรทำอะไร

| ไฟล์ | หน้าที่ |
| --- | --- |
| `login_page.dart` | รวม layout ทั้งหน้า, logo/header/form/footer, keyboard safe area |
| `login_header.dart` | โลโก้, title, subtitle ของหน้า login |
| `login_form.dart` | จัด field + submit button เป็น form layout |
| `login_email_field.dart` | email text field เฉพาะ UI |
| `login_password_field.dart` | password field และปุ่ม show/hide password |
| `login_submit_button.dart` | ปุ่มเข้าสู่ระบบแบบ disabled/loading UI state |
| `login_footer_links.dart` | forgot password, create account หรือ link อื่นตาม design |
| `login_ui_state.dart` | เก็บ UI state เช่น `isPasswordVisible`, `isSubmittingMock`, `canSubmit` |
| `login_form_controller.dart` | คุม toggle password, clear field, mock submit UI |
| `login_providers.dart` | ประกาศ provider ที่หน้า login ใช้ |
| `auth_routes.dart` | route name/path ของ auth เช่น login |

### สิ่งที่ยังไม่ควรทำใน Login UI

- ยังไม่เรียก API login
- ยังไม่เก็บ token
- ยังไม่ refresh token
- ยังไม่สร้าง repository/use case
- ยังไม่ validate แบบ business rule ลึกๆ
- ยังไม่ผูก secure storage

ถ้าจะทำ validation เพื่อ demo UI ให้ทำแค่ระดับ presentation เช่น field ว่างแล้วขึ้นข้อความ แต่ logic จริงค่อยย้ายไป domain/value object ตอนเริ่มทำ auth จริง

## ใช้สีอย่างไร

อย่าใส่ hex color ในหน้า UI โดยตรง ให้ใช้ 2 ทางนี้:

### ทางที่ 1: ใช้ Theme ก่อน

ใช้กับ Material widget ทั่วไป:

```dart
final colorScheme = Theme.of(context).colorScheme;
final textTheme = Theme.of(context).textTheme;
```

ใช้ประมาณนี้:

| งาน | ใช้ |
| --- | --- |
| ปุ่มหลัก | `colorScheme.primary` |
| ตัวอักษรบนปุ่มหลัก | `colorScheme.onPrimary` |
| พื้นหลัง card/input | `colorScheme.surface` |
| error text/border | `colorScheme.error` |
| border/divider | `colorScheme.outline` |

### ทางที่ 2: ใช้ AppColors เมื่อ Theme ไม่มี role ที่ตรง

import:

```dart
import 'package:diasight_app/core/theme/tokens/colors/app_colors.dart';
```

ใช้ role เหล่านี้:

| UI | Token |
| --- | --- |
| background หน้า Onboarding/Login | `AppColors.background` |
| title หลัก | `AppColors.textPrimary` |
| subtitle/helper text | `AppColors.textSecondary` |
| placeholder | `AppColors.textMuted` |
| primary CTA | `AppColors.brand` |
| secondary CTA/link | `AppColors.accent` |
| soft background/illustration | `AppColors.brandSoft` |
| input border | `AppColors.border` |
| error message | `AppColors.danger` |

### สีที่แนะนำต่อหน้า

Onboarding:

| ส่วน | สี |
| --- | --- |
| background | `AppColors.background` |
| illustration soft area | `AppColors.brandSoft` หรือ `AppColors.accentSoft` |
| title | `AppColors.textPrimary` |
| description | `AppColors.textSecondary` |
| active indicator | `AppColors.brand` |
| inactive indicator | `AppColors.border` |
| primary button | `AppColors.brand` |
| skip text | `AppColors.textSecondary` |

Login:

| ส่วน | สี |
| --- | --- |
| background | `AppColors.background` |
| title | `AppColors.textPrimary` |
| label | `AppColors.textSecondary` |
| input background | `AppColors.surface` |
| input border | `AppColors.border` |
| focused border | `AppColors.brand` |
| primary button | `AppColors.brand` |
| forgot password link | `AppColors.accent` |
| error | `AppColors.danger` |

## ใช้ฟอนต์อย่างไร

อย่ากำหนด font family และ font size เองใน widget ถ้าไม่จำเป็น ให้ใช้ `Theme.of(context).textTheme`

```dart
final textTheme = Theme.of(context).textTheme;
```

Mapping ที่ใช้สำหรับ 2 หน้านี้:

| งาน | Style |
| --- | --- |
| Onboarding title | `textTheme.displaySmall` |
| Onboarding description | `textTheme.bodyMedium` |
| Login title | `textTheme.displaySmall` หรือ `textTheme.headlineMedium` |
| Field label | `textTheme.bodyMedium` |
| Field input | `textTheme.bodyMedium` |
| Button text | `textTheme.bodyMedium` หรือ `textTheme.titleLarge` ตามขนาดปุ่ม |
| Helper/error text | `textTheme.bodySmall` |
| Footer link | `textTheme.bodySmall` |

Font ที่ระบบตั้งไว้แล้ว:

- Primary: `Kanit`
- Secondary: `Montserrat`

ถ้า design ไม่ได้บอกชัด ให้ใช้ Kanit จาก theme เป็นหลัก

## Spacing และ Radius

Spacing ที่ควรยึด:

| งาน | ค่าแนะนำ |
| --- | --- |
| padding ซ้ายขวาหน้าจอ mobile | 24 |
| ระยะระหว่าง section ใหญ่ | 32 หรือ 40 |
| ระยะระหว่าง title กับ subtitle | 8 หรือ 12 |
| ระยะระหว่าง field | 12 หรือ 16 |
| ความสูง button | 48 ถึง 56 |
| radius card/input/button | 8 |

ถ้าเขียน component กลางภายหลัง ให้โยงไปที่ token:

```text
lib/core/theme/tokens/spacing/app_space_tokens.dart
lib/core/theme/tokens/radius/app_radius_tokens.dart
```

กติกา design system ตอนนี้:

- card/input radius หลักใช้ 8
- ปุ่ม pill ใช้เฉพาะ design ระบุจริงๆ
- อย่าใช้ radius ใหญ่มั่วทั้งแอป
- อย่าใช้สี/spacing แบบสุ่มเพื่อแก้เฉพาะจุด

## Responsive ที่ต้องเช็ก

สำหรับสองหน้านี้ต้องรองรับ:

- iPhone ขนาดเล็ก
- iPhone Pro/Max
- Android ขนาดกลาง
- keyboard เปิดอยู่ในหน้า Login
- text ยาวขึ้นในภาษาไทย
- landscape อย่างน้อยต้องไม่พัง layout

เช็กก่อนส่ง:

- ไม่มี text ล้นปุ่ม
- field ไม่โดน keyboard บัง
- ปุ่มหลักกดได้ง่าย
- Onboarding indicator ไม่ชน CTA
- Login footer ไม่ทับ keyboard
- SafeArea ครอบบน/ล่าง

## Assets ของ 2 หน้า

ถ้ามีรูป:

```text
assets/images/onboarding/
assets/images/auth/
```

ถ้ามี icon:

```text
assets/icons/onboarding/
assets/icons/auth/
```

ถ้ามี lottie:

```text
assets/lottie/onboarding/
assets/lottie/auth/
```

กติกา:

- ตั้งชื่อไฟล์เป็น lowercase + underscore เช่น `welcome_eye_check.png`
- อย่าใส่ไฟล์ใหญ่มากโดยไม่บีบอัด
- อย่าใส่ไฟล์ส่วนตัวหรือ secret
- ถ้าเพิ่ม folder asset ใหม่ ให้เช็กว่า `pubspec.yaml` include parent folder อยู่แล้ว

## Copy และภาษา

ไฟล์ภาษา:

```text
lib/l10n/app_en.arb
lib/l10n/app_th.arb
```

สำหรับ UI demo ถ้ายังไม่ได้ต่อ l10n สามารถใช้ข้อความชั่วคราวได้สั้นๆ แต่ก่อนส่งงานจริงควรย้าย text ที่ user เห็นเข้า `.arb`

ตัวอย่าง key:

```text
onboardingTitle1
onboardingDescription1
onboardingSkipButton
onboardingNextButton
authLoginTitle
authLoginEmailLabel
authLoginPasswordLabel
authLoginSubmitButton
authForgotPasswordButton
```

## Shared component ใช้เมื่อไร

อย่าเพิ่งย้ายทุกอย่างไป shared ตั้งแต่วันแรก

ควรอยู่ใน feature:

- `onboarding_slide_card.dart`
- `onboarding_page_indicator.dart`
- `login_header.dart`
- `login_footer_links.dart`

ควรย้ายไป shared ถ้าใช้ซ้ำทั้ง Onboarding และ Login:

- `app_primary_button.dart`
- `app_text_button.dart`
- `app_text_field.dart`
- `app_page_scaffold.dart`

folder ที่ใช้:

```text
lib/shared/presentation/widgets/
lib/shared/presentation/forms/
lib/shared/presentation/layouts/
```

## Route สำหรับ UI demo

Feature route ควรอยู่ใน:

```text
lib/features/onboarding/presentation/routes/onboarding_routes.dart
lib/features/auth/presentation/routes/auth_routes.dart
```

Root router อยู่ที่:

```text
lib/app/router/app_router.dart
```

กติกา:

- route path/name ให้ตั้งเป็น constant
- ให้คนเดียวรวม route เข้า `app_router.dart` เพื่อลด conflict
- ถ้า UI ยังไม่ต่อ flow จริง ให้ route เปิดหน้าได้อย่างเดียวพอ

## Test สำหรับ UI-only

ขั้นต่ำที่ควรมีเมื่อเริ่มสร้างหน้าจอ:

```text
test/features/onboarding/presentation/pages/onboarding_page_test.dart
test/features/auth/presentation/pages/login_page_test.dart
```

ควร test:

- render หน้าได้
- title/button สำคัญแสดง
- Onboarding กด next แล้ว indicator เปลี่ยน
- Login กด show/hide password แล้ว icon/state เปลี่ยน
- Login submit button disabled/enabled ตาม UI state ถ้ามี

## Checklist สำหรับคนทำ Onboarding UI

1. สร้าง `onboarding_page.dart` ใน `features/onboarding/presentation/pages/`
2. แยก slide card, indicator, action bar ไป `widgets/`
3. ใช้ `Theme.of(context).textTheme`
4. ใช้ `Theme.of(context).colorScheme` หรือ `AppColors`
5. ใส่ SafeArea
6. เช็กขนาดจอเล็กและ text ไทย
7. ไม่เรียก API
8. ไม่เขียน storage flag ว่าดูแล้ว
9. เพิ่ม widget test ถ้าเริ่มมี interaction
10. รัน analyze/test

## Checklist สำหรับคนทำ Login UI

1. สร้าง `login_page.dart` ใน `features/auth/presentation/pages/`
2. แยก header, form, field, submit button, footer link ไป `widgets/`
3. ทำ keyboard-safe layout
4. ใช้ `TextFormField` หรือ shared text field ถ้ามีแล้ว
5. ใช้ `Theme.of(context).textTheme`
6. ใช้ `Theme.of(context).colorScheme` หรือ `AppColors`
7. ทำ password show/hide เป็น UI state เท่านั้น
8. ยังไม่เรียก API login
9. ยังไม่เก็บ token
10. รัน analyze/test

## ก่อนส่งงาน

รัน:

```sh
fvm flutter analyze
fvm flutter test
git diff --check
```

Commit message ใช้ type:

```text
feat: add onboarding ui
feat: add login ui
test: add login ui tests
docs: update ui guide
```

## จำสั้นๆ

- Onboarding UI อยู่ `lib/features/onboarding/presentation/`
- Login UI อยู่ `lib/features/auth/presentation/`
- หน้าเต็มอยู่ `pages/`
- ส่วนประกอบย่อยอยู่ `widgets/`
- UI state อยู่ `state/`
- UI action อยู่ `controllers/`
- route อยู่ `routes/`
- ใช้สีจาก theme หรือ `AppColors`
- ใช้ฟอนต์จาก `Theme.of(context).textTheme`
- UI-only ห้ามแตะ API, token, secure storage, domain/data

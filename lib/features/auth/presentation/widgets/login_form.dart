import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:diasight_app/features/auth/presentation/widgets/login_fields.dart';
import 'package:diasight_app/features/auth/presentation/widgets/login_openid_button.dart';
import 'package:diasight_app/features/auth/presentation/widgets/login_submit_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final dynamicSpacing = (screenHeight * 0.025).clamp(10.0, 20.0);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColorPalette.white.withValues(alpha: 0.25),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 15,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColorPalette.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoginTextField(
                        type: TextInputType.emailAddress,
                        title: 'Email / เบอร์โทรศัพท์',
                        placeholder: 'Email / เบอร์โทรศัพท์',
                      ),
                      SizedBox(height: dynamicSpacing),
                      const LoginTextField(
                        type: TextInputType.visiblePassword,
                        title: 'รหัสผ่าน',
                        placeholder: 'รหัสผ่าน',
                        obscure: true,
                      ),
                      SizedBox(height: dynamicSpacing),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(color: AppColorPalette.lavender),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'หรือ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppFontFamilies.kanit,
                              fontSize: AppFontSizes.base,
                              color: AppColorPalette.lavender,
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Divider(color: AppColorPalette.lavender),
                          ),
                        ],
                      ),
                      SizedBox(height: dynamicSpacing),
                      const LoginOpenIdButton(
                        icon: Image(
                          image: AssetImage('assets/icons/apple_logo.png'),
                          width: 24,
                          height: 24,
                        ),
                        text: 'เข้าสู่ระบบด้วย Apple',
                      ),
                      SizedBox(height: dynamicSpacing),
                      const LoginOpenIdButton(
                        icon: Image(
                          image: AssetImage('assets/icons/google_logo.png'),
                          width: 24,
                          height: 24,
                        ),
                        text: 'เข้าสู่ระบบด้วย Google',
                      ),
                      SizedBox(height: dynamicSpacing),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'ลืมรหัสผ่าน?',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: AppFontFamilies.kanit,
                              fontSize: AppFontSizes.base,
                              color: AppColorPalette.deepViolet,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: dynamicSpacing),
                      const LoginSubmitButton(text: 'เข้าสู่ระบบ'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

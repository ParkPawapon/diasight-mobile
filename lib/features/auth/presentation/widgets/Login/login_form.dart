import 'package:diasight_app/features/dashboard/presentation/pages/mainPage.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../../../../../core/theme/tokens/typography/app_font_families.dart';
import '../../../../../core/theme/tokens/typography/app_font_sizes.dart';
import 'login_fields.dart';
import 'login_openid_button.dart';
import 'login_submit_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicSpacing = (screenHeight * 0.025).clamp(12.0, 24.0);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Stack(
        children: [
          // Back rectangle
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

          // White rectangle
          Positioned.fill(
            top: 15,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColorPalette.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),

              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Field(
                        type: TextInputType.emailAddress,
                        title: 'Email / เบอร์โทรศัพท์',
                        placeholder: 'Email / เบอร์โทรศัพท์',
                      ),

                      SizedBox(height: dynamicSpacing),

                      const Field(
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
                          SizedBox(width: 5,),
                          Text(
                            'หรือ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppFontFamilies.kanit,
                              fontSize: AppFontSizes.base,
                              color: AppColorPalette.lavender,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            child: Divider(color: AppColorPalette.lavender),
                          ),
                        ],
                      ),

                      SizedBox(height: dynamicSpacing),

                      const LoginWithButton(
                        icon: Image(
                          image: AssetImage('assets/icons/apple_logo.png'),
                          width: 24,
                          height: 24,
                        ),
                        text: 'เข้าสู่ระบบด้วย Apple'
                      ),

                      SizedBox(height: dynamicSpacing),

                      const LoginWithButton(
                        icon: Image(
                          image: AssetImage('assets/icons/google_logo.png'),
                          width: 24,
                          height: 24,
                        ),
                        text: 'เข้าสู่ระบบด้วย Google'
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

                      LoginButton(
                        text: 'เข้าสู่ระบบ',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingPage(),
                            settings: const RouteSettings(name: '/setting')
                            )
                        )
                      ),
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

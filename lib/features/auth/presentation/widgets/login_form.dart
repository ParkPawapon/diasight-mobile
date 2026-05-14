import 'package:flutter/material.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../../../../core/theme/tokens/typography/app_font_families.dart';
import '../../../../core/theme/tokens/typography/app_font_sizes.dart';
import 'login_fields.dart';
import 'login_openid_button.dart';
import 'login_submit_button.dart';

class ModalFormBackground extends StatelessWidget {
  const ModalFormBackground({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicSpacing = (screenHeight * 0.025).clamp(10.0, 20.0);

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
                      Field(
                        type: TextInputType.emailAddress,
                        title: 'Email / เบอร์โทรศัพท์',
                        placeholder: 'Email / เบอร์โทรศัพท์',
                      ),

                      SizedBox(height: dynamicSpacing),

                      Field(
                        type: TextInputType.visiblePassword,
                        title: 'รหัสผ่าน',
                        placeholder: 'รหัสผ่าน',
                        obscure: true,
                      ),

                      SizedBox(height: dynamicSpacing),

                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: AppColorPalette.lavender),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            'หรือ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppFontFamilies.kanit,
                              fontSize: AppFontSizes.base,
                              color: AppColorPalette.lavender,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Expanded(
                            child: Divider(color: AppColorPalette.lavender),
                          ),
                        ],
                      ),

                      SizedBox(height: dynamicSpacing),

                      LoginWithButton(
                        icon: Image(
                          image: AssetImage('assets/icons/apple_logo.png'),
                          width: 24,
                          height: 24,
                        ),
                        text: 'เข้าสู่ระบบด้วย Apple'
                      ),

                      SizedBox(height: dynamicSpacing),

                      LoginWithButton(
                        icon: Image(
                          image: AssetImage('assets/icons/google_logo.png'),
                          width: 24,
                          height: 24,
                        ),
                        text: 'เข้าสู่ระบบด้วย Google'
                      ),

                      SizedBox(height: dynamicSpacing),
                      Row(
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

                      LoginButton(text: 'เข้าสู่ระบบ'),
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

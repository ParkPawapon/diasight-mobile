import 'package:diasight_app/features/auth/presentation/pages/register_page_second.dart';
import 'package:diasight_app/features/auth/presentation/pages/register_page_third.dart';
import 'package:diasight_app/features/auth/presentation/widgets/Login/login_submit_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../Login/login_fields.dart';
import 'page_indicator.dart';

class RegisterFormFirst extends StatelessWidget {
  const RegisterFormFirst({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicSpacing = (screenHeight * 0.025).clamp(10.0, 20.0);

    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},

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
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),

              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 36),
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

                      const Field(
                        type: TextInputType.visiblePassword,
                        title: 'ยืนยันรหัสผ่าน',
                        placeholder: 'ยืนยันรหัสผ่าน',
                        obscure: true,
                      ),

                      const SizedBox(height: 24),

                      LoginButton(
                        text: 'ถัดไป',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPageSecond(),
                            settings: const RouteSettings(name: '/registertwo')
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      StepIndicator(
                        currentStep: 1,
                        onStepTap: (step) {
                          switch (step) {
                            case 1:
                              break;

                            case 2:
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPageSecond(),
                              ));
                              break;

                            case 3:
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPageThird(),
                              ));
                              break;
                          }
                        },
                      )
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

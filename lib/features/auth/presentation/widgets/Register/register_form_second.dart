import 'package:diasight_app/features/auth/presentation/pages/register_page_third.dart';
import 'package:diasight_app/features/auth/presentation/widgets/Login/login_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../Login/login_fields.dart';
import 'page_indicator.dart';

class RegisterFormSecond extends StatelessWidget {
  const RegisterFormSecond({super.key});

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

                      Row(
                        children: [
                          const Expanded(
                            child: Field(
                              type: TextInputType.datetime,
                              title: 'วัน/เดือน/ปีเกิด',
                              placeholder: 'วัน/เดือน/ปีเกิด',
                            ),
                          ),

                          SizedBox(width: dynamicSpacing),

                          const Expanded(
                            child: Field(
                              type: TextInputType.text,
                              options: ['ชาย', 'หญิง'],
                              title: 'เพศ',
                              placeholder: 'เพศ',
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: dynamicSpacing),

                      Row(
                        children: [
                          Expanded(
                            child: Field(
                              type: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              title: 'น้ำหนัก',
                              placeholder: 'น้ำหนัก',

                              inputFormat: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d{0,2}'),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: dynamicSpacing),

                          const Expanded(
                            child: Field(
                              type: TextInputType.text,
                              title: 'ส่วนสูง',
                              placeholder: 'ส่วนสูง',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      LoginButton(
                        text: 'ถัดไป',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPageThird(),
                            settings: const RouteSettings(
                              name: '/registerthree',
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      StepIndicator(
                        currentStep: 2,
                        onStepTap: (step) {
                          switch (step) {
                            case 1:
                              Navigator.popUntil(
                                context,
                                ModalRoute.withName('/registerone'),
                              );
                              break;

                            case 2:
                              break;

                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPageThird(),
                                  settings: const RouteSettings(
                                    name: 'registerthree',
                                  ),
                                ),
                              );
                              break;
                          }
                        },
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

import 'package:diasight_app/features/auth/presentation/widgets/Login/login_submit_button.dart';
import 'package:diasight_app/features/auth/presentation/widgets/Register/page_indicator.dart';
import 'package:diasight_app/features/dashboard/presentation/pages/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../../../../../core/theme/tokens/typography/app_font_families.dart';
import '../../../../../core/theme/tokens/typography/app_font_sizes.dart';
import '../../../../../core/theme/tokens/colors/app_color_palette.dart';

class RegisterOtp extends StatefulWidget {
  const RegisterOtp({super.key});

  @override
  State<RegisterOtp> createState() => _OtpState();
}

class _OtpState extends State<RegisterOtp> {
  int countdown = 30;
  Timer? _timer;
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() => countdown = 30);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (countdown > 0)
        setState(() => countdown--);
      else
        t.cancel();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in _controllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 36),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 15,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ยืนยัน OTP",
                    style: TextStyle(
                      color: AppColorPalette.deepViolet,
                      fontFamily: AppFontFamilies.kanit,
                      fontSize: AppFontSizes.heading3,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "ใส่รหัสยืนยันที่ได้รับในกล่องข้อความ \nเราส่งรหัสไปที่ 088 888 8888",
                      style: TextStyle(
                        color: AppColorPalette.deepViolet,
                        fontFamily: AppFontFamilies.kanit,
                        fontSize: AppFontSizes.base,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      6,
                      (i) => SizedBox(
                        width: 40,
                        height: 40,
                        child: TextField(
                          controller: _controllers[i],
                          focusNode: _focusNodes[i],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontSizes.base,
                            color: AppColorPalette.deepViolet,
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: AppColorPalette.deepViolet,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: AppColorPalette.deepViolet,
                                width: 2,
                              ),
                            ),
                          ),
                          onChanged: (v) {
                            if (v.isNotEmpty && i < 5) {
                              _focusNodes[i + 1].requestFocus();
                            }
                            if (v.isEmpty && i > 0) {
                              _focusNodes[i - 1].requestFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Text(
                    "รหัสอ้างอิง: sxVhc2z4",
                    style: TextStyle(
                      color: AppColorPalette.deepViolet,
                      fontFamily: AppFontFamilies.kanit,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_filled,
                            color: AppColorPalette.deepViolet,
                          ),
                          Text(
                            " 00:${countdown.toString().padLeft(2, '0')}",
                            style: const TextStyle(
                              color: AppColorPalette.deepViolet,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: countdown == 0 ? startTimer : null,
                        child: Text(
                          "ไม่ได้รับรหัส ส่งใหม่",
                          style: TextStyle(
                            color: countdown == 0
                                ? AppColorPalette.deepViolet
                                : AppColorPalette.gray400,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  LoginButton(
                    text: 'สมัครสมาชิก',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    ),
                  ),

                  const SizedBox(height: 40),

                  StepIndicator(
                    currentStep: 3,
                    onStepTap: (step) {
                      switch (step) {
                        case 1:
                          Navigator.popUntil(
                            context,
                            ModalRoute.withName('/registerone'),
                          );

                        case 2:
                          Navigator.popUntil(
                            context,
                            ModalRoute.withName('/registertwo'),
                          );
                          break;

                        case 3:
                          break;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

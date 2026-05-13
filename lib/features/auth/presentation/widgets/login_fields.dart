import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    required this.type,
    required this.title,
    required this.placeholder,
    this.obscure = false,
    super.key,
  });

  final TextInputType type;
  final String title;
  final String placeholder;
  final bool obscure;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: const TextStyle(
              color: AppColorPalette.deepViolet,
              fontSize: AppFontSizes.base,
              fontFamily: AppFontFamilies.kanit,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColorPalette.softLavender,
                blurRadius: 15,
                spreadRadius: -12,
                offset: Offset(0, 1),
              ),
            ],
          ),
          width: double.infinity,
          child: TextField(
            keyboardType: widget.type,
            obscureText: widget.obscure && _isObscured,
            obscuringCharacter: '●',
            style: const TextStyle(
              color: AppColorPalette.lavender,
              fontFamily: AppFontFamilies.montserrat,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColorPalette.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              hintText: widget.placeholder,
              hintStyle: const TextStyle(
                color: AppColorPalette.softLavender,
                fontFamily: AppFontFamilies.kanit,
              ),
              suffixIcon: widget.obscure
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                        color: AppColorPalette.lavender,
                        size: 20,
                      ),
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColorPalette.softLavender,
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColorPalette.lavender),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

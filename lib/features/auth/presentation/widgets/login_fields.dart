import 'package:flutter/material.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../../../../core/theme/tokens/typography/app_font_sizes.dart';
import '../../../../core/theme/tokens/typography/app_font_families.dart';

class Field extends StatefulWidget {
  final TextInputType type;
  final String title;
  final String placeholder;
  final bool obscure;
  const Field({
    super.key,
    required this.type,
    required this.title,
    required this.placeholder,
    this.obscure = false,
  });

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool ishidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
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
          const SizedBox(
            height: 5,
          ),

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
              keyboardType: TextInputType.emailAddress,
              obscureText: widget.obscure ? ishidden : false,
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
                        ishidden = !ishidden;
                      });
                    },
                    icon: Icon(
                      ishidden ? Icons.visibility_off : Icons.visibility,
                      color: AppColorPalette.lavender,
                      size: 20, // ปรับขนาดตามความเหมาะสม
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
                  borderSide: const BorderSide(
                    color: AppColorPalette.lavender,
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

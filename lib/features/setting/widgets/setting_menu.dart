import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/colors/app_colors.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menubox extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback? onPressed;
  final String trailingText;
  const Menubox({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
    required this.trailingText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColorPalette.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.brand.withValues(alpha: 0.5),
            blurRadius: 10,
            spreadRadius: -2,
            offset:const Offset(0, 1),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                textAlign: TextAlign.start,
                text,
                style: const TextStyle(
                  fontFamily: AppFontFamilies.kanit,
                  fontSize: AppFontSizes.base,
                  fontWeight: FontWeight.w600,
                  color: AppColorPalette.deepViolet,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            
            if (trailingText != '')
              Text(
                trailingText,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColorPalette.softLavender, 
                  fontFamily: AppFontFamilies.kanit,
                ),
              )
            else
             const Icon(
              Icons.chevron_right,
              color: AppColorPalette.softLavender,
             )
          ],
        ),
      ),
    );
  }
}

class MenuBoxToggle extends StatefulWidget {
  final String icon;
  final String text;
  final VoidCallback onToggle;
  final bool is_navigate;
  const MenuBoxToggle({
    super.key,
    required this.icon,
    required this.text,
    required this.onToggle,
    required this.is_navigate,
  });

  @override
  State<MenuBoxToggle> createState() => _MenuBoxToggleState();
}

class _MenuBoxToggleState extends State<MenuBoxToggle> {
  bool is_active = false;
  void handleToggle(bool status) async {
    if (status) {
      setState(() {
        is_active = true;
      });

      await Future.delayed(const Duration(seconds: 1)); //wait 2 secs

      if (widget.is_navigate) {
        // await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          widget.onToggle(); //navigate to sub setting page
        } else {
          widget.onToggle();
        }
      }
    } else {
      setState(() {
        is_active = false;
      });
      widget.onToggle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36,),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColorPalette.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.brand.withValues(alpha: 0.5),
            blurRadius: 10,
            spreadRadius: -2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Row(
          children: [
            Image.asset(
              widget.icon,
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                textAlign: TextAlign.start,
                widget.text,
                style: const TextStyle(
                  fontFamily: AppFontFamilies.kanit,
                  fontSize: AppFontSizes.base,
                  fontWeight: FontWeight.w600,
                  color: AppColorPalette.deepViolet,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),

            GestureDetector(
              onTap: () => handleToggle(!is_active),
              child: AnimatedContainer(
                duration: Duration.zero,
                width: 48,
                height: 24,
                padding: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: is_active
                      ? AppColorPalette.salmon
                      : AppColorPalette.gray200,
                ),
                child: AnimatedAlign(
                  alignment: is_active
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration: Duration.zero,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: AppColorPalette.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

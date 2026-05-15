import 'package:flutter/material.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';


class ModalFormBackground extends StatelessWidget {
  const ModalFormBackground({super.key});

  @override
  Widget build(BuildContext context) {

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
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
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

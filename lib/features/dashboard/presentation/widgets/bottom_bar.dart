import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomState();
}

class _BottomState extends State<BottomBar> {
  int selectedIndex = 0;
  // bool isCenterSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: SizedBox(
          height: 80,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned.fill(
                top: 10,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        offset: const Offset(0, 3),
                        color: AppColorPalette.deepViolet.withOpacity(0.3),
                      ),
                    ],
                  ),

                  child: ClipPath(
                    clipper: DiamondNotchClipper(),

                    child: Container(
                      color: Colors.white,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          _item(
                            index: 0,
                            icon: 'assets/icons/home-32.png',
                            activeIcon: 'assets/icons/home-33.png',
                            text: 'หน้าหลัก',
                          ),

                          _item(
                            index: 1,
                            icon: 'assets/icons/document-32.png',
                            activeIcon: 'assets/icons/document-33.png',
                            text: 'บันทึก',
                          ),

                          const SizedBox(width: 60),

                          _item(
                            index: 2,
                            icon: 'assets/icons/bot32.png',
                            activeIcon: 'assets/icons/bot33.png',
                            text: 'AI',
                          ),

                          _item(
                            index: 3,
                            icon: 'assets/icons/settings-22.png',
                            activeIcon: 'assets/icons/settings-41.png',
                            text: 'การตั้งค่า',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: -25,

                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 4;
                    });
                  },

                  child: Transform.rotate(
                    angle: math.pi / 4,

                    child: Container(
                      width: 65,
                      height: 65,

                      decoration: BoxDecoration(
                        color: selectedIndex == 4
                            ? AppColorPalette.deepViolet
                            : AppColorPalette.white,

                        borderRadius: BorderRadius.circular(12),

                        border: Border.all(
                          color: AppColorPalette.deepViolet,
                          width: 2.5,
                        ),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: -12,
                            offset: const Offset(0, 1),
                            color: AppColorPalette.deepViolet.withOpacity(0.3),
                          ),
                        ],
                      ),

                      child: Transform.rotate(
                        angle: -math.pi / 4,

                        child: Center(
                          child: Container(
                            width: 42,
                            height: 42,

                            child: Image.asset(
                              selectedIndex == 4
                                  ? 'assets/icons/iris55.png'
                                  : 'assets/icons/iris12.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item({
    required int index,
    required String icon,
    required String activeIcon,
    required String text,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Image.asset(
            isSelected ? activeIcon : icon,
            width: 30,
            height: 30,
          ),

          const SizedBox(height: 2),

          Text(
            text,

            style: TextStyle(
              fontFamily: AppFontFamilies.kanit,
              fontSize: AppFontSizes.description1,
              fontWeight: FontWeight.w800,

              color: text == 'AI' && isSelected
                  ? AppColorPalette.salmon
                  : AppColorPalette.deepViolet,
            ),
          ),
        ],
      ),
    );
  }
}

class DiamondNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double notchWidth = 100;
    double notchHeight = 48;
    double radius = 12;
    double outerRadius = 10;

    path.moveTo(0, outerRadius);

    path.quadraticBezierTo(0, 0, outerRadius, 0);

    path.lineTo((size.width - notchWidth) / 2, 0);

    path.lineTo(
      size.width / 2 - (radius / 2),
      notchHeight - (radius / 4),
    );

    path.quadraticBezierTo(
      size.width / 2,
      notchHeight,

      size.width / 2 + (radius / 2),
      notchHeight - (radius / 4),
    );

    path.lineTo((size.width + notchWidth) / 2, 0);

    path.lineTo(size.width - outerRadius, 0);

    path.quadraticBezierTo(
      size.width,
      0,
      size.width,
      outerRadius,
    );

    path.lineTo(
      size.width,
      size.height - outerRadius,
    );

    path.quadraticBezierTo(
      size.width,
      size.height,

      size.width - outerRadius,
      size.height,
    );

    path.lineTo(
      outerRadius,
      size.height,
    );

    path.quadraticBezierTo(
      0,
      size.height,

      0,
      size.height - outerRadius,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

import 'package:flutter/material.dart';
import '../../../../core/theme/tokens/colors/app_color_palette.dart';
import '../../../../core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_sizes.dart';
import 'package:diasight_app/features/dashboard/presentation/widgets/bottom_bar.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _mainState();
}

class _mainState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello',
          style: TextStyle(
            color: AppColorPalette.deepViolet,
            fontFamily: AppFontFamilies.kanit,
            fontSize: AppFontSizes.heading2
          ),
        ),
      ),

      bottomNavigationBar: Container(
        child: BottomBar(),
      ),
    );
  }
}
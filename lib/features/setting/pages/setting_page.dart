import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/features/dashboard/presentation/widgets/bottom_bar.dart';
import 'package:diasight_app/features/setting/widgets/setting_menu.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColorPalette.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Menubox(
              icon: 'assets/icons/setting_icon/password_icon.png', 
              text: 'เปลี่ยนรหัสผ่าน')
          ],
        ),
      ),

      bottomNavigationBar: const BottomBar(),

    );
  }
}
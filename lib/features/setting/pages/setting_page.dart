import 'package:diasight_app/core/theme/tokens/colors/app_color_palette.dart';
import 'package:diasight_app/core/theme/tokens/typography/app_font_families.dart';
import 'package:diasight_app/features/auth/presentation/pages/login_page.dart';
import 'package:diasight_app/features/dashboard/presentation/widgets/bottom_bar.dart';
import 'package:diasight_app/features/setting/widgets/setting_header_navigation.dart';
import 'package:diasight_app/features/setting/widgets/setting_menu.dart';
import 'package:diasight_app/features/setting/widgets/setting_profile_box.dart';
import 'package:diasight_app/features/setting/widgets/setting_search_box.dart';
import 'package:diasight_app/features/setting/widgets/setting_signout_button.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  String searchQuery = "";


  bool shouldShow(String menuText) {
    if (searchQuery.isEmpty) return true;
    return menuText.toLowerCase().contains(searchQuery.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColorPalette.white,
        body: SafeArea(
          child: ListView(
            children: [
              SettingHeader(
                text: 'การตั้งค่า',
                onBack: () => {
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/loginPage'),
                  ),
                },
              ),

              const SizedBox(height: 10),


              SearchBox(
                onSearchSubmitted: (value) {
                  setState(() {
                    searchQuery = value; 
                  });
                },
                onClear: () {
                  setState(() {
                    searchQuery = ""; 
                  });
                },
              ),

              const SizedBox(height: 20),


              if (searchQuery.isEmpty) ...[
                const TextTitle(text: 'ข้อมูลบัญชี'),
                const SizedBox(height: 8),
                const ProfileBox(
                  profile: 'assets/images/profile.png',
                  name: 'กิตติพงษ์ วัฒนชัย',
                ),
                const SizedBox(height: 20),
              ],


              if (shouldShow('ความปลอดภัย') || shouldShow('เปลี่ยนรหัสผ่าน') || shouldShow('เบอร์โทรศัพท์และ Email') || shouldShow('PIN Code') || shouldShow('เข้าสู่ระบบด้วยชีวมิติ') || shouldShow('อุปกรณ์ที่เข้าสู่ระบบ')) ...[
                if (shouldShow('เปลี่ยนรหัสผ่าน') || shouldShow('เบอร์โทรศัพท์และ Email') || shouldShow('PIN Code') || shouldShow('เข้าสู่ระบบด้วยชีวมิติ') || shouldShow('อุปกรณ์ที่เข้าสู่ระบบ'))
                  const TextTitle(text: 'ความปลอดภัย'),
                  const SizedBox(height: 8),
                
                if (shouldShow('เปลี่ยนรหัสผ่าน')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/password-icon.png',
                    text: 'เปลี่ยนรหัสผ่าน',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],

                if (shouldShow('เบอร์โทรศัพท์และ Email')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/telephone-icon.png',
                    text: 'เบอร์โทรศัพท์และ Email',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],

                if (shouldShow('PIN Code')) ...[
                  MenuBoxToggle(
                    icon: 'assets/icons/setting_icon/pin-code-icon.png',
                    text: 'PIN Code',
                    is_navigate: true,
                    onToggle: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],

                if (shouldShow('เข้าสู่ระบบด้วยชีวมิติ')) ...[
                  MenuBoxToggle(
                    icon: 'assets/icons/setting_icon/face-id-icon.png',
                    text: 'เข้าสู่ระบบด้วยชีวมิติ',
                    is_navigate: false,
                    onToggle: () => {},
                  ),
                  const SizedBox(height: 20),
                ],

                if (shouldShow('อุปกรณ์ที่เข้าสู่ระบบ')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/devices-icon.png',
                    text: 'อุปกรณ์ที่เข้าสู่ระบบ',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],
              ],


              if (shouldShow('ความเป็นส่วนตัวและสิทธิ์') || shouldShow('สิทธิการเข้าถึงแอป') || shouldShow('จัดการความยินยอม') || shouldShow('ลบบัญชี')) ...[
                if (shouldShow('สิทธิการเข้าถึงแอป') || shouldShow('จัดการความยินยอม') || shouldShow('ลบบัญชี'))
                  const TextTitle(text: 'ความเป็นส่วนตัวและสิทธิ์'),
                const SizedBox(height: 8),

                if (shouldShow('สิทธิการเข้าถึงแอป')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/accessing-icon.png',
                    text: 'สิทธิการเข้าถึงแอป',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],

                if (shouldShow('จัดการความยินยอม')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/consent-icon.png',
                    text: 'จัดการความยินยอม',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],

                if (shouldShow('ลบบัญชี')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/delete-account-icon.png',
                    text: 'ลบบัญชี',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],
              ],


              if (shouldShow('การตั้งค่าแอพลิเคชัน') || shouldShow('การแจ้งเตือน')) ...[
                if (shouldShow('การแจ้งเตือน'))
                  const TextTitle(text: 'การตั้งค่าแอพลิเคชัน'),
                const SizedBox(height: 8),

                if (shouldShow('การแจ้งเตือน')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/notification-icon.png',
                    text: 'การแจ้งเตือน',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],
              ],


              if (shouldShow('นโยบายและความช่วยเหลือ') || shouldShow('ข้อกำหนดและเงื่อนไข') || shouldShow('นโยบายความเป็นส่วนตัว') || shouldShow('ศูนย์ช่วยเหลือ / ติดต่อเรา') || shouldShow('เวอร์ชัน')) ...[
                if (shouldShow('ข้อกำหนดและเงื่อนไข') || shouldShow('นโยบายความเป็นส่วนตัว') || shouldShow('ศูนย์ช่วยเหลือ / ติดต่อเรา') || shouldShow('เวอร์ชัน'))
                  const TextTitle(text: 'นโยบายและความช่วยเหลือ'),
                const SizedBox(height: 8),

                if (shouldShow('ข้อกำหนดและเงื่อนไข')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/condition-icon.png',
                    text: 'ข้อกำหนดและเงื่อนไข',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],

                if (shouldShow('นโยบายความเป็นส่วนตัว')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/private-policy-icon.png',
                    text: 'นโยบายความเป็นส่วนตัว',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],

                if (shouldShow('ศูนย์ช่วยเหลือ / ติดต่อเรา')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/contact-icon.png',
                    text: 'ศูนย์ช่วยเหลือ / ติดต่อเรา',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],

                if (shouldShow('เวอร์ชัน')) ...[
                  const Menubox(
                    icon: 'assets/icons/setting_icon/version-icon.png',
                    text: 'เวอร์ชัน',
                    trailingText: '',
                  ),
                  const SizedBox(height: 20),
                ],
              ],


              if (searchQuery.isEmpty) ...[
                SignOutButton(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    ),
                  },
                ),
                const SizedBox(height: 20),
              ],
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerStart,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 36),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColorPalette.deepViolet,
            fontSize: 20,
            fontFamily: AppFontFamilies.kanit,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
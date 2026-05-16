import 'package:diasight_app/features/auth/presentation/pages/auth_base.dart';
import 'package:diasight_app/features/auth/presentation/pages/login_page.dart';
import 'package:diasight_app/features/auth/presentation/widgets/Register/register_form_first.dart';
import 'package:flutter/material.dart';



class RegisterPageFirst extends StatelessWidget {
  const RegisterPageFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBased(
      onBack: () {
        Navigator.popUntil(context, (route) {
          return route.isFirst; 
        });
      },
      customForm: RegisterFormFirst(),
      customTitle: 'Register',
      headerText: 'มีบัญชีแล้ว?',
      headerAction: 'เข้าสู่ระบบ',
      onPressed: () => 
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const LoginPage(),
        settings: const RouteSettings(name: '/loginPage')
        ),
        
      ),
    );
  }
}
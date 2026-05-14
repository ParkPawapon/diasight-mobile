import 'package:diasight_app/features/auth/presentation/pages/auth_base.dart';
import 'package:diasight_app/features/auth/presentation/pages/register_page_first.dart';
import 'package:diasight_app/features/auth/presentation/widgets/Login/login_form.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBased(
      onBack: () {
        Navigator.popUntil(context, (route) {
          return route.isFirst; 
        });
      },
      customForm: LoginForm(),
      customTitle: 'Login',
      headerText: 'ยังไม่มีบัญชี?',
      headerAction: 'สมัครสมาชิก',
      onPressed: () => 
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const RegisterPageFirst(),
        settings: const RouteSettings(name: '/registerone')
        ),
        
      ),
    );
  }
}
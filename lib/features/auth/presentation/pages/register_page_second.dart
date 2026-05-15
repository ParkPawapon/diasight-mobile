import 'package:diasight_app/features/auth/presentation/pages/auth_base.dart';
import 'package:diasight_app/features/auth/presentation/widgets/Register/register_form_second.dart';
import 'package:flutter/material.dart';

class RegisterPageSecond extends StatelessWidget {
  const RegisterPageSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBased(
        onBack: () => Navigator.popUntil(context, ModalRoute.withName('/registerone')),       
        customForm: RegisterFormSecond(),
        customTitle: 'Register',
      ),
    );
  }
}
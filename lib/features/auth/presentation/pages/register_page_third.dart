import 'package:diasight_app/features/auth/presentation/pages/auth_base.dart';
import 'package:diasight_app/features/auth/presentation/widgets/Register/register_form_third.dart';
import 'package:flutter/material.dart';

class RegisterPageThird extends StatelessWidget {
  const RegisterPageThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBased(
        onBack: () => Navigator.popUntil(context, ModalRoute.withName('/registertwo')),       
        customForm: RegisterOtp(),
        customTitle: 'Register',
      ),
    );
  }
}
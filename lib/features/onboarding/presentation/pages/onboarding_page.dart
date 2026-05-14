// ไฟล์ main.dart
import 'package:diasight_app/features/onboarding/presentation/pages/onboarding_element.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiaSight App',
      theme: ThemeData(primarySwatch: Colors.blue),
      
      home: const OnboardingPage(), 
    );
  }
}
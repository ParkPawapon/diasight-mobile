import 'package:diasight_app/core/theme/app_theme.dart';
import 'package:diasight_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_fonts.dart';

void main() {
  setUpAll(loadAppFonts);

  testWidgets('renders the login form content', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const LoginPage(),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Email / เบอร์โทรศัพท์'), findsNWidgets(2));
    expect(find.text('รหัสผ่าน'), findsNWidgets(2));
    expect(find.text('เข้าสู่ระบบด้วย Apple'), findsOneWidget);
    expect(find.text('เข้าสู่ระบบด้วย Google'), findsOneWidget);
    expect(find.text('ลืมรหัสผ่าน?'), findsOneWidget);
  });
}

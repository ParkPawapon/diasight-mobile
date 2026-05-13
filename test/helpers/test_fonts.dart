import 'package:flutter/services.dart';

Future<void> loadAppFonts() async {
  final kanitLoader = FontLoader('Kanit')
    ..addFont(rootBundle.load('assets/fonts/kanit/Kanit-Regular.ttf'))
    ..addFont(rootBundle.load('assets/fonts/kanit/Kanit-Medium.ttf'))
    ..addFont(rootBundle.load('assets/fonts/kanit/Kanit-SemiBold.ttf'))
    ..addFont(rootBundle.load('assets/fonts/kanit/Kanit-Bold.ttf'));

  final montserratLoader = FontLoader('Montserrat')
    ..addFont(
      rootBundle.load('assets/fonts/montserrat/Montserrat[wght].ttf'),
    );

  await Future.wait([
    kanitLoader.load(),
    montserratLoader.load(),
  ]);
}

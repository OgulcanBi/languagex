import 'package:flutter/material.dart';

import '../enums/enum_app.dart';
import '../settings/controller_theme.dart';
import '_r.dart';

class AppColor {
  final Color transparent = const Color(0x00000000);
  final Color white = const Color(0xFFFFFFFF);
  final Color black = const Color(0xFF000000);

  final Color grayLight = const Color(0xFF999999);
  final Color grayLightBlue = const Color(0xFFDAE2E9);

  final Color borderBottomNav = const Color(0xFFD5E1E2);
  final Color viewBg = const Color(0xFFF4F5F7);
  final Color price = const Color(0xFF2C2B32);
  final Color actionSheetTitle = const Color(0xFFEBEBF5);

  final Color bottomSheetRadiusColor = const Color(0xFF858585);
  final Color bottomNavigatorColor = const Color(0xFFF9432B);



  final MaterialColor primary = MaterialColor(0xFF0037FF, {
    25: const Color(0xFFFCFAFF),
    50: const Color(0xFFF9F5FF),
    100: const Color(0xFFF2F3FF),
    200: const Color(0xFFE4E5FF),
    300: const Color(0xFFC6C9FF),
    400: const Color(0xFFA1A7FF),
    500: const Color(0xFF727CFF),
    600: const Color(0xFF0037FF),
    700: const Color(0xFF0031E4),
    800: const Color(0xFF002BC6),
    900: const Color(0xFF0023A1),
  });
  final MaterialColor dark = MaterialColor(0xFF130240, {

    100: const Color(0xFF130240),
    200: const Color(0xFF3247CF),

  });

  final MaterialColor gray = MaterialColor(0xFF475467, {
    25: const Color(0xFFFCFCFD),
    50: const Color(0xFFF9FAFB),
    100: const Color(0xFFF2F4F7),
    200: const Color(0xFFEAECF0),
    300: const Color(0xFFD0D5DD),
    400: const Color(0xFF98A2B3),
    500: const Color(0xFF667085),
    600: const Color(0xFF475467),
    700: const Color(0xFF344054),
    800: const Color(0xFF1D2939),
    900: const Color(0xFF101828),
  });

  final MaterialColor error = MaterialColor(0xFFD92D20, {
    25: const Color(0xFFFFFBFA),
    50: const Color(0xFFFEF3F2),
    100: const Color(0xFFFEE4E2),
    200: const Color(0xFFFECDCA),
    300: const Color(0xFFFDA29B),
    400: const Color(0xFFF97066),
    500: const Color(0xFFF04438),
    600: const Color(0xFFD92D20),
    700: const Color(0xFFB42318),
    800: const Color(0xFF912018),
    900: const Color(0xFF7A271A),
  });

  final MaterialColor warning = MaterialColor(0xFFDC6803, {
    25: const Color(0xFFFFFCF5),
    50: const Color(0xFFFFFAEB),
    100: const Color(0xFFFFEF0C7),
    200: const Color(0xFFFEDF89),
    300: const Color(0xFFFEC84B),
    400: const Color(0xFFFDB022),
    500: const Color(0xFFF79009),
    600: const Color(0xFFDC6803),
    700: const Color(0xFFB54708),
    800: const Color(0xFF93370D),
    900: const Color(0xFF7A2E0E),
  });

  final MaterialColor success = MaterialColor(0xFF039855, {
    25: const Color(0xFFF6FEF9),
    50: const Color(0xFFECFDF3),
    100: const Color(0xFFD1FADF),
    200: const Color(0xFFA6F4C5),
    300: const Color(0xFF6CE9A6),
    400: const Color(0xFF32D583),
    500: const Color(0xFF12B76A),
    600: const Color(0xFF039855),
    700: const Color(0xFF027A48),
    800: const Color(0xFF05603A),
    900: const Color(0xFF054F31),
  });
}

class AppThemeColor {
  final Color viewBg = _ThemeColor(dark: R.color.white, light: R.color.black).theme;
}

class _ThemeColor {
  Color light;
  Color dark;

  Color get theme {
    switch (ThemeController.getInstance().currentAppTheme) {
      case ThemeApperance.light:
        return light;
      case ThemeApperance.dark:
        return dark;
      default:
        return light;
    }
  }

  _ThemeColor({required this.dark, required this.light});
}

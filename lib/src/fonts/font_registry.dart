import 'package:flutter/material.dart';
import '../core/enums/script_type.dart';

/// Registry for fonts used in the application
class FontRegistry {
  /// Private constructor to prevent instantiation
  FontRegistry._();

  // Khmer fonts
  static const String khmerBattambang = 'Battambang';
  static const String khmerKoulen = 'Koulen';
  static const String khmerMoul = 'Moul';
  static const String khmerNotoSerifKhmer = 'NotoSerifKhmer';
  static const String khmerSiemreap = 'Siemreap';
  static const String khmerSuwannaphum = 'Suwannaphum';

  // Latin fonts
  static const String latinIBMPlexSans = 'IBMPlexSans';
  static const String latinInter = 'Inter';
  static const String latinLato = 'Lato';
  static const String latinMontserrat = 'Montserrat';
  static const String latinNunito = 'Nunito';
  static const String latinOpenSans = 'OpenSans';
  static const String latinPoppins = 'Poppins';
  static const String latinRaleway = 'Raleway';
  static const String latinRoboto = 'Roboto';
  static const String latinSFNSDisplay = 'SFNSDisplay';

  // Default fonts for each script type
  static const String _defaultKhmerFont = khmerSiemreap;
  static const String _defaultLatinFont = latinRoboto;

  /// Get the default font family for a given script type
  static String getDefaultFontFamily(ScriptType type) {
    switch (type) {
      case ScriptType.khmer:
        return _defaultKhmerFont;
      case ScriptType.latin:
        return _defaultLatinFont;
      case ScriptType.neutral:
        return _defaultLatinFont;
    }
  }

  /// Get recommended font fallbacks for a given script type
  static List<String> getFontFallbacks(ScriptType type) {
    switch (type) {
      case ScriptType.khmer:
        return [khmerBattambang, khmerNotoSerifKhmer, khmerSuwannaphum];
      case ScriptType.latin:
        return [latinRoboto, latinOpenSans, latinLato];
      case ScriptType.neutral:
        return [latinRoboto, latinOpenSans, khmerSiemreap];
    }
  }

  // Font weight helper constants
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

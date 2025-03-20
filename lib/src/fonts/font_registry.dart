import 'package:flutter/material.dart';
import '../core/enums/script_type.dart';

/// A centralized registry for font families used in multilingual text rendering.
///
/// This class provides a single source of truth for font family names,
/// default font selections, and font fallback chains for supported scripts.
/// It eliminates hardcoded font names throughout the application and ensures
/// consistent font usage across different components.
///
/// The registry includes:
/// - Predefined font family constants for Khmer and Latin scripts
/// - Default font selection for each script type
/// - Recommended fallback font chains for graceful degradation
/// - Font weight constants for semantic weight specification
///
/// Using this registry instead of direct string literals improves code
/// maintainability and allows for centralized font management.
///
/// Example usage:
/// ```dart
/// TextStyle khmerTextStyle = TextStyle(
///   fontFamily: FontRegistry.khmerBattambang,
///   fontWeight: FontRegistry.medium,
/// );
/// ```
class FontRegistry {
  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static constants and utility methods
  /// and should not be instantiated.
  FontRegistry._();

  // Khmer fonts
  /// Battambang font for Khmer script.
  /// A versatile font with good readability and multiple weights.
  static const String khmerBattambang = 'Battambang';

  /// Koulen font for Khmer script.
  /// A decorative font suitable for headlines and titles.
  static const String khmerKoulen = 'Koulen';

  /// Moul font for Khmer script.
  /// A traditional style font appropriate for formal or cultural contexts.
  static const String khmerMoul = 'Moul';

  /// Noto Serif Khmer font.
  /// A serif font with excellent readability for long-form content.
  static const String khmerNotoSerifKhmer = 'NotoSerifKhmer';

  /// Siemreap font for Khmer script.
  /// A clean, modern font with good legibility at various sizes.
  static const String khmerSiemreap = 'Siemreap';

  /// Suwannaphum font for Khmer script.
  /// A modern font suitable for various UI elements.
  static const String khmerSuwannaphum = 'Suwannaphum';

  // Latin fonts
  /// IBM Plex Sans font for Latin script.
  /// A professional sans-serif font with a technical appearance.
  static const String latinIBMPlexSans = 'IBMPlexSans';

  /// Inter font for Latin script.
  /// A modern font with excellent readability designed for interfaces.
  static const String latinInter = 'Inter';

  /// Lato font for Latin script.
  /// A friendly and versatile font suitable for most text content.
  static const String latinLato = 'Lato';

  /// Montserrat font for Latin script.
  /// An elegant geometric font good for headers and feature text.
  static const String latinMontserrat = 'Montserrat';

  /// Nunito font for Latin script.
  /// A rounded, friendly font great for casual applications.
  static const String latinNunito = 'Nunito';

  /// Open Sans font for Latin script.
  /// A highly readable font excellent for content-heavy applications.
  static const String latinOpenSans = 'OpenSans';

  /// Poppins font for Latin script.
  /// A contemporary, friendly font good for modern applications.
  static const String latinPoppins = 'Poppins';

  /// Raleway font for Latin script.
  /// An elegant font with distinct characters good for branding.
  static const String latinRaleway = 'Raleway';

  /// Roboto font for Latin script.
  /// Android's standard font providing a consistent look.
  static const String latinRoboto = 'Roboto';

  /// SF NS Display font for Latin script.
  /// An iOS-like font appearance for iOS-styled applications.
  static const String latinSFNSDisplay = 'SFNSDisplay';

  // Default fonts for each script type
  /// Default font family for Khmer script (Siemreap).
  /// This is the recommended font for general Khmer text rendering.
  static const String _defaultKhmerFont = khmerSiemreap;

  /// Default font family for Latin script (Roboto).
  /// This is the recommended font for general Latin text rendering.
  static const String _defaultLatinFont = latinRoboto;

  /// Returns the default font family for a given script type.
  ///
  /// This method provides the recommended default font for each supported
  /// script type, ensuring consistent typography across the application.
  /// For neutral characters (symbols, spaces, etc.), it uses Latin defaults.
  ///
  /// Parameters:
  /// - [type]: The script type for which to retrieve the default font
  ///
  /// Returns the name of the default font family for the specified script type.
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

  /// Returns recommended font fallbacks for a given script type.
  ///
  /// This method provides a carefully selected list of fallback fonts
  /// for each script type. These fallbacks are used when the primary font
  /// is unavailable or missing a specific glyph.
  ///
  /// The fallback chain is ordered by preference, with fonts selected
  /// for their comprehensive character coverage and complementary design.
  ///
  /// Parameters:
  /// - [type]: The script type for which to retrieve fallback fonts
  ///
  /// Returns a list of font family names ordered by fallback preference.
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
  /// Thin font weight (w100).
  /// Extremely light weight, suitable for very large display text.
  static const FontWeight thin = FontWeight.w100;

  /// Extra-light font weight (w200).
  /// Very light weight, suitable for large display text.
  static const FontWeight extraLight = FontWeight.w200;

  /// Light font weight (w300).
  /// Light weight, suitable for subtitles and less emphasized text.
  static const FontWeight light = FontWeight.w300;

  /// Regular font weight (w400).
  /// Standard weight for body text.
  static const FontWeight regular = FontWeight.w400;

  /// Medium font weight (w500).
  /// Slightly emphasized weight, good for subheadings.
  static const FontWeight medium = FontWeight.w500;

  /// Semi-bold font weight (w600).
  /// Moderately emphasized weight, good for section titles.
  static const FontWeight semiBold = FontWeight.w600;

  /// Bold font weight (w700).
  /// Strongly emphasized weight, good for headings.
  static const FontWeight bold = FontWeight.w700;

  /// Extra-bold font weight (w800).
  /// Very strong emphasis, good for major headings.
  static const FontWeight extraBold = FontWeight.w800;

  /// Black font weight (w900).
  /// Extremely heavy weight, suitable for display text.
  static const FontWeight black = FontWeight.w900;
}

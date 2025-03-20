import 'package:flutter/material.dart';
import '../../core/enums/script_type.dart';
import '../../core/models/text_style_properties.dart';
import '../../fonts/font_registry.dart';

/// Handler for Thai script styling with specialized typographic optimizations.
///
/// This class is responsible for creating properly configured [TextStyle] objects
/// specifically optimized for Thai script text. It handles:
///
/// - Applying Thai-specific font families and fallbacks
/// - Managing style property inheritance between base and Thai-specific properties
/// - Ensuring proper package references for font loading
/// - Optimizing typography settings for Thai script readability
///
/// The Thai script has unique typographic requirements including appropriate
/// font selection, line height, and proper rendering of tone marks and vowel positioning
/// for optimal legibility.
///
/// This class is part of the script handling system and should not be used directly
/// by most consumers. Instead, interact with [LocalizedRichText] or [ScriptRegistry].
class ThaiStyle {
  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static utility methods and should not be instantiated.
  ThaiStyle._();

  /// Creates a TextStyle for Thai text based on provided properties.
  ///
  /// This method generates a properly configured TextStyle optimized for Thai script
  /// text rendering. It follows a property inheritance model where Thai-specific
  /// properties override base properties when present.
  ///
  /// The method handles two scenarios:
  /// 1. When no Thai-specific properties are provided, it applies Thai fonts to the base style
  /// 2. When Thai-specific properties are provided, it creates a new style with property prioritization
  ///
  /// Parameters:
  /// - [baseProperties]: Base text style properties that apply to all scripts
  /// - [thaiProperties]: Optional Thai-specific style properties that override base properties
  ///
  /// Returns a TextStyle configured for optimal Thai script rendering.
  static TextStyle createTextStyle({
    /// Base text style properties that apply as defaults.
    required TextStyleProperties baseProperties,

    /// Optional Thai-specific style properties that override base properties.
    ScriptStyleProperties? thaiProperties,
  }) {
    // Create base TextStyle from common properties
    final TextStyle baseStyle = baseProperties.toTextStyle();

    // If no Thai-specific properties are provided, simply apply Thai fonts to the base style
    // This optimization avoids unnecessary style object creation when no overrides exist
    if (thaiProperties == null) {
      return baseStyle.copyWith(
        fontFamily: FontRegistry.getDefaultFontFamily(ScriptType.thai),
        fontFamilyFallback: FontRegistry.getFontFallbacks(ScriptType.thai),
        package:
            'flutter_script_renderer', // Required for package font reference
      );
    }

    // When Thai-specific properties exist, create a new style with property prioritization:
    // Thai-specific properties take precedence, falling back to base properties when needed
    return TextStyle(
      fontSize: thaiProperties.fontSize ?? baseProperties.fontSize,
      color: thaiProperties.color ?? baseProperties.color,
      backgroundColor:
          thaiProperties.backgroundColor ?? baseProperties.backgroundColor,
      fontWeight: thaiProperties.fontWeight ?? baseProperties.fontWeight,
      fontStyle: thaiProperties.fontStyle ?? baseProperties.fontStyle,
      letterSpacing:
          thaiProperties.letterSpacing ?? baseProperties.letterSpacing,
      wordSpacing: thaiProperties.wordSpacing ?? baseProperties.wordSpacing,
      textBaseline: thaiProperties.textBaseline ?? baseProperties.textBaseline,
      height: thaiProperties.height ?? baseProperties.height,
      leadingDistribution: thaiProperties.leadingDistribution ??
          baseProperties.leadingDistribution,
      locale: thaiProperties.locale ?? baseProperties.locale,
      foreground: thaiProperties.foreground ?? baseProperties.foreground,
      background: thaiProperties.background ?? baseProperties.background,
      shadows: thaiProperties.shadows ?? baseProperties.shadows,
      fontFeatures: thaiProperties.fontFeatures ?? baseProperties.fontFeatures,
      fontVariations:
          thaiProperties.fontVariations ?? baseProperties.fontVariations,
      decoration: thaiProperties.decoration ?? baseProperties.decoration,
      decorationColor:
          thaiProperties.decorationColor ?? baseProperties.decorationColor,
      decorationStyle:
          thaiProperties.decorationStyle ?? baseProperties.decorationStyle,
      decorationThickness: thaiProperties.decorationThickness ??
          baseProperties.decorationThickness,
      fontFamily: thaiProperties.fontFamily ??
          FontRegistry.getDefaultFontFamily(ScriptType.thai),
      fontFamilyFallback: thaiProperties.fontFamilyFallback ??
          FontRegistry.getFontFallbacks(ScriptType.thai),
      debugLabel: thaiProperties.debugLabel ?? baseProperties.debugLabel,
      inherit: thaiProperties.inherit ?? baseProperties.inherit ?? true,
      package: 'flutter_script_renderer', // Required for package font reference
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/enums/script_type.dart';
import '../../core/models/text_style_properties.dart';
import '../../fonts/font_registry.dart';

/// Handler for Lao script styling with specialized typographic optimizations.
///
/// This class is responsible for creating properly configured [TextStyle] objects
/// specifically optimized for Lao script text. It handles:
///
/// - Applying Lao-specific font families and fallbacks
/// - Managing style property inheritance between base and Lao-specific properties
/// - Ensuring proper package references for font loading
/// - Optimizing typography settings for Lao script readability
///
/// The Lao script has unique typographic requirements including appropriate
/// font selection, line height, and proper rendering of tone marks and vowel positioning
/// for optimal legibility.
///
/// This class is part of the script handling system and should not be used directly
/// by most consumers. Instead, interact with [LocalizedRichText] or [ScriptRegistry].
class LaoStyle {
  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static utility methods and should not be instantiated.
  LaoStyle._();

  /// Creates a TextStyle for Lao text based on provided properties.
  ///
  /// This method generates a properly configured TextStyle optimized for Lao script
  /// text rendering. It follows a property inheritance model where Lao-specific
  /// properties override base properties when present.
  ///
  /// The method handles two scenarios:
  /// 1. When no Lao-specific properties are provided, it applies Lao fonts to the base style
  /// 2. When Lao-specific properties are provided, it creates a new style with property prioritization
  ///
  /// Parameters:
  /// - [baseProperties]: Base text style properties that apply to all scripts
  /// - [laoProperties]: Optional Lao-specific style properties that override base properties
  ///
  /// Returns a TextStyle configured for optimal Lao script rendering.
  static TextStyle createTextStyle({
    /// Base text style properties that apply as defaults.
    required TextStyleProperties baseProperties,

    /// Optional Lao-specific style properties that override base properties.
    ScriptStyleProperties? laoProperties,
  }) {
    // Create base TextStyle from common properties
    final TextStyle baseStyle = baseProperties.toTextStyle();

    // If no Lao-specific properties are provided, simply apply Lao fonts to the base style
    // This optimization avoids unnecessary style object creation when no overrides exist
    if (laoProperties == null) {
      return baseStyle.copyWith(
        fontFamily: FontRegistry.getDefaultFontFamily(ScriptType.lao),
        fontFamilyFallback: FontRegistry.getFontFallbacks(ScriptType.lao),
        package:
            'flutter_script_renderer', // Required for package font reference
      );
    }

    // When Lao-specific properties exist, create a new style with property prioritization:
    // Lao-specific properties take precedence, falling back to base properties when needed
    return TextStyle(
      fontSize: laoProperties.fontSize ?? baseProperties.fontSize,
      color: laoProperties.color ?? baseProperties.color,
      backgroundColor:
          laoProperties.backgroundColor ?? baseProperties.backgroundColor,
      fontWeight: laoProperties.fontWeight ?? baseProperties.fontWeight,
      fontStyle: laoProperties.fontStyle ?? baseProperties.fontStyle,
      letterSpacing:
          laoProperties.letterSpacing ?? baseProperties.letterSpacing,
      wordSpacing: laoProperties.wordSpacing ?? baseProperties.wordSpacing,
      textBaseline: laoProperties.textBaseline ?? baseProperties.textBaseline,
      height: laoProperties.height ?? baseProperties.height,
      leadingDistribution: laoProperties.leadingDistribution ??
          baseProperties.leadingDistribution,
      locale: laoProperties.locale ?? baseProperties.locale,
      foreground: laoProperties.foreground ?? baseProperties.foreground,
      background: laoProperties.background ?? baseProperties.background,
      shadows: laoProperties.shadows ?? baseProperties.shadows,
      fontFeatures: laoProperties.fontFeatures ?? baseProperties.fontFeatures,
      fontVariations:
          laoProperties.fontVariations ?? baseProperties.fontVariations,
      decoration: laoProperties.decoration ?? baseProperties.decoration,
      decorationColor:
          laoProperties.decorationColor ?? baseProperties.decorationColor,
      decorationStyle:
          laoProperties.decorationStyle ?? baseProperties.decorationStyle,
      decorationThickness: laoProperties.decorationThickness ??
          baseProperties.decorationThickness,
      fontFamily: laoProperties.fontFamily ??
          FontRegistry.getDefaultFontFamily(ScriptType.lao),
      fontFamilyFallback: laoProperties.fontFamilyFallback ??
          FontRegistry.getFontFallbacks(ScriptType.lao),
      debugLabel: laoProperties.debugLabel ?? baseProperties.debugLabel,
      inherit: laoProperties.inherit ?? baseProperties.inherit ?? true,
      package: 'flutter_script_renderer', // Required for package font reference
    );
  }
}

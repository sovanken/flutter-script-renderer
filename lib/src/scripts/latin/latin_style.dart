import 'package:flutter/material.dart';
import '../../core/enums/script_type.dart';
import '../../core/models/text_style_properties.dart';
import '../../fonts/font_registry.dart';

/// Handler for Latin script styling with specialized typographic optimizations.
///
/// This class is responsible for creating properly configured [TextStyle] objects
/// specifically optimized for Latin script text. It handles:
///
/// - Applying Latin-specific font families and fallbacks
/// - Managing style property inheritance between base and Latin-specific properties
/// - Ensuring proper package references for font loading
/// - Optimizing typography settings for Latin script readability
///
/// This class is part of the script handling system and should not be used directly
/// by most consumers. Instead, interact with [LocalizedRichText] or [ScriptRegistry].
class LatinStyle {
  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static utility methods and should not be instantiated.
  LatinStyle._();

  /// Creates a TextStyle for Latin text based on provided properties.
  ///
  /// This method generates a properly configured TextStyle optimized for Latin script
  /// text rendering. It follows a property inheritance model where Latin-specific
  /// properties override base properties when present.
  ///
  /// The method handles two scenarios:
  /// 1. When no Latin-specific properties are provided, it applies Latin fonts to the base style
  /// 2. When Latin-specific properties are provided, it creates a new style with property prioritization
  ///
  /// Parameters:
  /// - [baseProperties]: Base text style properties that apply to all scripts
  /// - [latinProperties]: Optional Latin-specific style properties that override base properties
  ///
  /// Returns a TextStyle configured for optimal Latin script rendering.
  static TextStyle createTextStyle({
    /// Base text style properties that apply as defaults.
    required TextStyleProperties baseProperties,

    /// Optional Latin-specific style properties that override base properties.
    ScriptStyleProperties? latinProperties,
  }) {
    // Create base TextStyle from common properties
    final TextStyle baseStyle = baseProperties.toTextStyle();

    // If no Latin-specific properties are provided, simply apply Latin fonts to the base style
    // This optimization avoids unnecessary style object creation when no overrides exist
    if (latinProperties == null) {
      return baseStyle.copyWith(
        fontFamily: FontRegistry.getDefaultFontFamily(ScriptType.latin),
        fontFamilyFallback: FontRegistry.getFontFallbacks(ScriptType.latin),
        package:
            'flutter_script_renderer', // Required for package font reference
      );
    }

    // When Latin-specific properties exist, create a new style with property prioritization:
    // Latin-specific properties take precedence, falling back to base properties when needed
    return TextStyle(
      fontSize: latinProperties.fontSize ?? baseProperties.fontSize,
      color: latinProperties.color ?? baseProperties.color,
      backgroundColor:
          latinProperties.backgroundColor ?? baseProperties.backgroundColor,
      fontWeight: latinProperties.fontWeight ?? baseProperties.fontWeight,
      fontStyle: latinProperties.fontStyle ?? baseProperties.fontStyle,
      letterSpacing:
          latinProperties.letterSpacing ?? baseProperties.letterSpacing,
      wordSpacing: latinProperties.wordSpacing ?? baseProperties.wordSpacing,
      textBaseline: latinProperties.textBaseline ?? baseProperties.textBaseline,
      height: latinProperties.height ?? baseProperties.height,
      leadingDistribution: latinProperties.leadingDistribution ??
          baseProperties.leadingDistribution,
      locale: latinProperties.locale ?? baseProperties.locale,
      foreground: latinProperties.foreground ?? baseProperties.foreground,
      background: latinProperties.background ?? baseProperties.background,
      shadows: latinProperties.shadows ?? baseProperties.shadows,
      fontFeatures: latinProperties.fontFeatures ?? baseProperties.fontFeatures,
      fontVariations:
          latinProperties.fontVariations ?? baseProperties.fontVariations,
      decoration: latinProperties.decoration ?? baseProperties.decoration,
      decorationColor:
          latinProperties.decorationColor ?? baseProperties.decorationColor,
      decorationStyle:
          latinProperties.decorationStyle ?? baseProperties.decorationStyle,
      decorationThickness: latinProperties.decorationThickness ??
          baseProperties.decorationThickness,
      fontFamily: latinProperties.fontFamily ??
          FontRegistry.getDefaultFontFamily(ScriptType.latin),
      fontFamilyFallback: latinProperties.fontFamilyFallback ??
          FontRegistry.getFontFallbacks(ScriptType.latin),
      debugLabel: latinProperties.debugLabel ?? baseProperties.debugLabel,
      inherit: latinProperties.inherit ?? baseProperties.inherit ?? true,
      package: 'flutter_script_renderer', // Required for package font reference
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/enums/script_type.dart';
import '../../core/models/text_style_properties.dart';
import '../../fonts/font_registry.dart';

/// Handler for Myanmar script styling with specialized typographic optimizations.
///
/// This class is responsible for creating properly configured [TextStyle] objects
/// specifically optimized for Myanmar script text. It handles:
///
/// - Applying Myanmar-specific font families and fallbacks
/// - Managing style property inheritance between base and Myanmar-specific properties
/// - Ensuring proper package references for font loading
/// - Optimizing typography settings for Myanmar script readability
///
/// The Myanmar script has unique typographic requirements including appropriate
/// font selection, line height, and proper rendering of complex glyph positioning
/// and stacked consonants for optimal legibility.
///
/// This class is part of the script handling system and should not be used directly
/// by most consumers. Instead, interact with [LocalizedRichText] or [ScriptRegistry].
class MyanmarStyle {
  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static utility methods and should not be instantiated.
  MyanmarStyle._();

  /// Creates a TextStyle for Myanmar text based on provided properties.
  ///
  /// This method generates a properly configured TextStyle optimized for Myanmar script
  /// text rendering. It follows a property inheritance model where Myanmar-specific
  /// properties override base properties when present.
  ///
  /// The method handles two scenarios:
  /// 1. When no Myanmar-specific properties are provided, it applies Myanmar fonts to the base style
  /// 2. When Myanmar-specific properties are provided, it creates a new style with property prioritization
  ///
  /// Parameters:
  /// - [baseProperties]: Base text style properties that apply to all scripts
  /// - [myanmarProperties]: Optional Myanmar-specific style properties that override base properties
  ///
  /// Returns a TextStyle configured for optimal Myanmar script rendering.
  static TextStyle createTextStyle({
    /// Base text style properties that apply as defaults.
    required TextStyleProperties baseProperties,

    /// Optional Myanmar-specific style properties that override base properties.
    ScriptStyleProperties? myanmarProperties,
  }) {
    // Create base TextStyle from common properties
    final TextStyle baseStyle = baseProperties.toTextStyle();

    // If no Myanmar-specific properties are provided, simply apply Myanmar fonts to the base style
    // This optimization avoids unnecessary style object creation when no overrides exist
    if (myanmarProperties == null) {
      return baseStyle.copyWith(
        fontFamily: FontRegistry.getDefaultFontFamily(ScriptType.myanmar),
        fontFamilyFallback: FontRegistry.getFontFallbacks(ScriptType.myanmar),
        package:
            'flutter_script_renderer', // Required for package font reference
      );
    }

    // When Myanmar-specific properties exist, create a new style with property prioritization:
    // Myanmar-specific properties take precedence, falling back to base properties when needed
    return TextStyle(
      fontSize: myanmarProperties.fontSize ?? baseProperties.fontSize,
      color: myanmarProperties.color ?? baseProperties.color,
      backgroundColor:
          myanmarProperties.backgroundColor ?? baseProperties.backgroundColor,
      fontWeight: myanmarProperties.fontWeight ?? baseProperties.fontWeight,
      fontStyle: myanmarProperties.fontStyle ?? baseProperties.fontStyle,
      letterSpacing:
          myanmarProperties.letterSpacing ?? baseProperties.letterSpacing,
      wordSpacing: myanmarProperties.wordSpacing ?? baseProperties.wordSpacing,
      textBaseline:
          myanmarProperties.textBaseline ?? baseProperties.textBaseline,
      height: myanmarProperties.height ?? baseProperties.height,
      leadingDistribution: myanmarProperties.leadingDistribution ??
          baseProperties.leadingDistribution,
      locale: myanmarProperties.locale ?? baseProperties.locale,
      foreground: myanmarProperties.foreground ?? baseProperties.foreground,
      background: myanmarProperties.background ?? baseProperties.background,
      shadows: myanmarProperties.shadows ?? baseProperties.shadows,
      fontFeatures:
          myanmarProperties.fontFeatures ?? baseProperties.fontFeatures,
      fontVariations:
          myanmarProperties.fontVariations ?? baseProperties.fontVariations,
      decoration: myanmarProperties.decoration ?? baseProperties.decoration,
      decorationColor:
          myanmarProperties.decorationColor ?? baseProperties.decorationColor,
      decorationStyle:
          myanmarProperties.decorationStyle ?? baseProperties.decorationStyle,
      decorationThickness: myanmarProperties.decorationThickness ??
          baseProperties.decorationThickness,
      fontFamily: myanmarProperties.fontFamily ??
          FontRegistry.getDefaultFontFamily(ScriptType.myanmar),
      fontFamilyFallback: myanmarProperties.fontFamilyFallback ??
          FontRegistry.getFontFallbacks(ScriptType.myanmar),
      debugLabel: myanmarProperties.debugLabel ?? baseProperties.debugLabel,
      inherit: myanmarProperties.inherit ?? baseProperties.inherit ?? true,
      package: 'flutter_script_renderer', // Required for package font reference
    );
  }
}

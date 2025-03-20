import 'package:flutter/material.dart';
import '../../core/enums/script_type.dart';
import '../../core/models/text_style_properties.dart';
import '../../fonts/font_registry.dart';

/// Handler for Khmer script styling with specialized typographic optimizations.
///
/// This class is responsible for creating properly configured [TextStyle] objects
/// specifically optimized for Khmer script text. It handles:
///
/// - Applying Khmer-specific font families and fallbacks
/// - Managing style property inheritance between base and Khmer-specific properties
/// - Ensuring proper package references for font loading
/// - Optimizing typography settings for Khmer script readability
///
/// The Khmer script has unique typographic requirements including appropriate
/// font selection, line height, and spacing considerations for optimal legibility.
///
/// This class is part of the script handling system and should not be used directly
/// by most consumers. Instead, interact with [LocalizedRichText] or [ScriptRegistry].
class KhmerStyle {
  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static utility methods and should not be instantiated.
  KhmerStyle._();

  /// Creates a TextStyle for Khmer text based on provided properties.
  ///
  /// This method generates a properly configured TextStyle optimized for Khmer script
  /// text rendering. It follows a property inheritance model where Khmer-specific
  /// properties override base properties when present.
  ///
  /// The method handles two scenarios:
  /// 1. When no Khmer-specific properties are provided, it applies Khmer fonts to the base style
  /// 2. When Khmer-specific properties are provided, it creates a new style with property prioritization
  ///
  /// Parameters:
  /// - [baseProperties]: Base text style properties that apply to all scripts
  /// - [khmerProperties]: Optional Khmer-specific style properties that override base properties
  ///
  /// Returns a TextStyle configured for optimal Khmer script rendering.
  static TextStyle createTextStyle({
    /// Base text style properties that apply as defaults.
    required TextStyleProperties baseProperties,

    /// Optional Khmer-specific style properties that override base properties.
    ScriptStyleProperties? khmerProperties,
  }) {
    // Create base TextStyle from common properties
    final TextStyle baseStyle = baseProperties.toTextStyle();

    // If no Khmer-specific properties are provided, simply apply Khmer fonts to the base style
    // This optimization avoids unnecessary style object creation when no overrides exist
    if (khmerProperties == null) {
      return baseStyle.copyWith(
        fontFamily: FontRegistry.getDefaultFontFamily(ScriptType.khmer),
        fontFamilyFallback: FontRegistry.getFontFallbacks(ScriptType.khmer),
        package:
            'flutter_script_renderer', // Required for package font reference
      );
    }

    // When Khmer-specific properties exist, create a new style with property prioritization:
    // Khmer-specific properties take precedence, falling back to base properties when needed
    return TextStyle(
      fontSize: khmerProperties.fontSize ?? baseProperties.fontSize,
      color: khmerProperties.color ?? baseProperties.color,
      backgroundColor:
          khmerProperties.backgroundColor ?? baseProperties.backgroundColor,
      fontWeight: khmerProperties.fontWeight ?? baseProperties.fontWeight,
      fontStyle: khmerProperties.fontStyle ?? baseProperties.fontStyle,
      letterSpacing:
          khmerProperties.letterSpacing ?? baseProperties.letterSpacing,
      wordSpacing: khmerProperties.wordSpacing ?? baseProperties.wordSpacing,
      textBaseline: khmerProperties.textBaseline ?? baseProperties.textBaseline,
      height: khmerProperties.height ?? baseProperties.height,
      leadingDistribution: khmerProperties.leadingDistribution ??
          baseProperties.leadingDistribution,
      locale: khmerProperties.locale ?? baseProperties.locale,
      foreground: khmerProperties.foreground ?? baseProperties.foreground,
      background: khmerProperties.background ?? baseProperties.background,
      shadows: khmerProperties.shadows ?? baseProperties.shadows,
      fontFeatures: khmerProperties.fontFeatures ?? baseProperties.fontFeatures,
      fontVariations:
          khmerProperties.fontVariations ?? baseProperties.fontVariations,
      decoration: khmerProperties.decoration ?? baseProperties.decoration,
      decorationColor:
          khmerProperties.decorationColor ?? baseProperties.decorationColor,
      decorationStyle:
          khmerProperties.decorationStyle ?? baseProperties.decorationStyle,
      decorationThickness: khmerProperties.decorationThickness ??
          baseProperties.decorationThickness,
      fontFamily: khmerProperties.fontFamily ??
          FontRegistry.getDefaultFontFamily(ScriptType.khmer),
      fontFamilyFallback: khmerProperties.fontFamilyFallback ??
          FontRegistry.getFontFallbacks(ScriptType.khmer),
      debugLabel: khmerProperties.debugLabel ?? baseProperties.debugLabel,
      inherit: khmerProperties.inherit ?? baseProperties.inherit ?? true,
      package: 'flutter_script_renderer', // Required for package font reference
    );
  }
}

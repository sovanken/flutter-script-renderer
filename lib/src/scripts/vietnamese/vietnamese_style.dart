import 'package:flutter/material.dart';
import '../../core/enums/script_type.dart';
import '../../core/models/text_style_properties.dart';
import '../../fonts/font_registry.dart';

/// Handler for Vietnamese script styling with specialized typographic optimizations.
///
/// This class is responsible for creating properly configured [TextStyle] objects
/// specifically optimized for Vietnamese text. It handles:
///
/// - Applying Vietnamese-specific font families and fallbacks
/// - Managing style property inheritance between base and Vietnamese-specific properties
/// - Ensuring proper package references for font loading
/// - Optimizing typography settings for Vietnamese text readability
///
/// While Vietnamese uses Latin-based characters, it has unique typographic requirements
/// including the proper rendering of multiple diacritical marks and tone marks that
/// can appear simultaneously on characters.
///
/// This class is part of the script handling system and should not be used directly
/// by most consumers. Instead, interact with [LocalizedRichText] or [ScriptRegistry].
class VietnameseStyle {
  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static utility methods and should not be instantiated.
  VietnameseStyle._();

  /// Creates a TextStyle for Vietnamese text based on provided properties.
  ///
  /// This method generates a properly configured TextStyle optimized for Vietnamese text
  /// rendering. It follows a property inheritance model where Vietnamese-specific
  /// properties override base properties when present.
  ///
  /// The method handles two scenarios:
  /// 1. When no Vietnamese-specific properties are provided, it applies Vietnamese fonts to the base style
  /// 2. When Vietnamese-specific properties are provided, it creates a new style with property prioritization
  ///
  /// Parameters:
  /// - [baseProperties]: Base text style properties that apply to all scripts
  /// - [vietnameseProperties]: Optional Vietnamese-specific style properties that override base properties
  ///
  /// Returns a TextStyle configured for optimal Vietnamese text rendering.
  static TextStyle createTextStyle({
    /// Base text style properties that apply as defaults.
    required TextStyleProperties baseProperties,

    /// Optional Vietnamese-specific style properties that override base properties.
    ScriptStyleProperties? vietnameseProperties,
  }) {
    // Create base TextStyle from common properties
    final TextStyle baseStyle = baseProperties.toTextStyle();

    // If no Vietnamese-specific properties are provided, simply apply Vietnamese fonts to the base style
    // This optimization avoids unnecessary style object creation when no overrides exist
    if (vietnameseProperties == null) {
      return baseStyle.copyWith(
        fontFamily: FontRegistry.getDefaultFontFamily(ScriptType.vietnamese),
        fontFamilyFallback:
            FontRegistry.getFontFallbacks(ScriptType.vietnamese),
        package:
            'flutter_script_renderer', // Required for package font reference
      );
    }

    // When Vietnamese-specific properties exist, create a new style with property prioritization:
    // Vietnamese-specific properties take precedence, falling back to base properties when needed
    return TextStyle(
      fontSize: vietnameseProperties.fontSize ?? baseProperties.fontSize,
      color: vietnameseProperties.color ?? baseProperties.color,
      backgroundColor: vietnameseProperties.backgroundColor ??
          baseProperties.backgroundColor,
      fontWeight: vietnameseProperties.fontWeight ?? baseProperties.fontWeight,
      fontStyle: vietnameseProperties.fontStyle ?? baseProperties.fontStyle,
      letterSpacing:
          vietnameseProperties.letterSpacing ?? baseProperties.letterSpacing,
      wordSpacing:
          vietnameseProperties.wordSpacing ?? baseProperties.wordSpacing,
      textBaseline:
          vietnameseProperties.textBaseline ?? baseProperties.textBaseline,
      height: vietnameseProperties.height ?? baseProperties.height,
      leadingDistribution: vietnameseProperties.leadingDistribution ??
          baseProperties.leadingDistribution,
      locale: vietnameseProperties.locale ?? baseProperties.locale,
      foreground: vietnameseProperties.foreground ?? baseProperties.foreground,
      background: vietnameseProperties.background ?? baseProperties.background,
      shadows: vietnameseProperties.shadows ?? baseProperties.shadows,
      fontFeatures:
          vietnameseProperties.fontFeatures ?? baseProperties.fontFeatures,
      fontVariations:
          vietnameseProperties.fontVariations ?? baseProperties.fontVariations,
      decoration: vietnameseProperties.decoration ?? baseProperties.decoration,
      decorationColor: vietnameseProperties.decorationColor ??
          baseProperties.decorationColor,
      decorationStyle: vietnameseProperties.decorationStyle ??
          baseProperties.decorationStyle,
      decorationThickness: vietnameseProperties.decorationThickness ??
          baseProperties.decorationThickness,
      fontFamily: vietnameseProperties.fontFamily ??
          FontRegistry.getDefaultFontFamily(ScriptType.vietnamese),
      fontFamilyFallback: vietnameseProperties.fontFamilyFallback ??
          FontRegistry.getFontFallbacks(ScriptType.vietnamese),
      debugLabel: vietnameseProperties.debugLabel ?? baseProperties.debugLabel,
      inherit: vietnameseProperties.inherit ?? baseProperties.inherit ?? true,
      package: 'flutter_script_renderer', // Required for package font reference
    );
  }
}

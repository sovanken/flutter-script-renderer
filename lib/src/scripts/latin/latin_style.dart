import 'package:flutter/material.dart';
import '../../core/enums/script_type.dart';
import '../../core/models/text_style_properties.dart';
import '../../fonts/font_registry.dart';

/// Handler for Latin script styling
class LatinStyle {
  /// Private constructor to prevent instantiation
  LatinStyle._();

  /// Creates a TextStyle for Latin text based on provided properties
  static TextStyle createTextStyle({
    required TextStyleProperties baseProperties,
    ScriptStyleProperties? latinProperties,
  }) {
    // Create base TextStyle
    final TextStyle baseStyle = baseProperties.toTextStyle();

    // If no Latin-specific properties, use base style with Latin font
    if (latinProperties == null) {
      return baseStyle.copyWith(
        fontFamily: FontRegistry.getDefaultFontFamily(ScriptType.latin),
        fontFamilyFallback: FontRegistry.getFontFallbacks(ScriptType.latin),
        package: 'flutter_script_renderer',
      );
    }

    // Create Latin-specific style, falling back to base properties as needed
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
      package: 'flutter_script_renderer',
    );
  }
}

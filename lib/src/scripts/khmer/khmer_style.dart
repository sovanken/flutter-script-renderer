import 'package:flutter/material.dart';
import '../../../flutter_script_renderer.dart';

/// Handler for Khmer script styling
class KhmerStyle {
  /// Private constructor to prevent instantiation
  KhmerStyle._();

  /// Creates a TextStyle for Khmer text based on provided properties
  static TextStyle createTextStyle({
    required TextStyleProperties baseProperties,
    ScriptStyleProperties? khmerProperties,
  }) {
    // Create base TextStyle
    final TextStyle baseStyle = baseProperties.toTextStyle();

    // If no Khmer-specific properties, use base style with Khmer font
    if (khmerProperties == null) {
      return baseStyle.copyWith(
        fontFamily: FontRegistry.getDefaultFontFamily(ScriptType.khmer),
        fontFamilyFallback: FontRegistry.getFontFallbacks(ScriptType.khmer),
      );
    }

    // Create Khmer-specific style, falling back to base properties as needed 
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
    );
  }
}

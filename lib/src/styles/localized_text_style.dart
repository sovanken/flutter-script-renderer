import 'package:flutter/material.dart';
import '../core/enums/script_type.dart';
import '../core/models/text_style_properties.dart';
import '../scripts/script_registry.dart';

/// Utility class for generating TextStyle objects based on script type
class LocalizedTextStyle {
  /// Private constructor to prevent instantiation
  LocalizedTextStyle._();
  
  /// Generates a TextStyle appropriate for the given script type
  static TextStyle getTextStyle({
    required ScriptType type,
    
    // Base properties
    double? fontSize,
    Color? color,
    Color? backgroundColor,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    List<String>? fontFamilyFallback,
    String? debugLabel,
    bool? inherit,
    
    // Khmer properties
    double? khmerFontSize,
    Color? khmerColor,
    Color? khmerBackgroundColor,
    FontWeight? khmerFontWeight,
    FontStyle? khmerFontStyle,
    double? khmerLetterSpacing,
    double? khmerWordSpacing,
    TextBaseline? khmerTextBaseline,
    double? khmerHeight,
    TextLeadingDistribution? khmerLeadingDistribution,
    Locale? khmerLocale,
    Paint? khmerForeground,
    Paint? khmerBackground,
    List<Shadow>? khmerShadows,
    List<FontFeature>? khmerFontFeatures,
    List<FontVariation>? khmerFontVariations,
    TextDecoration? khmerDecoration,
    Color? khmerDecorationColor,
    TextDecorationStyle? khmerDecorationStyle,
    double? khmerDecorationThickness,
    List<String>? khmerFontFamilyFallback,
    String? khmerFontFamily,
    
    // Latin properties
    double? latinFontSize,
    Color? latinColor,
    Color? latinBackgroundColor,
    FontWeight? latinFontWeight,
    FontStyle? latinFontStyle,
    double? latinLetterSpacing,
    double? latinWordSpacing,
    TextBaseline? latinTextBaseline,
    double? latinHeight,
    TextLeadingDistribution? latinLeadingDistribution,
    Locale? latinLocale,
    Paint? latinForeground,
    Paint? latinBackground,
    List<Shadow>? latinShadows,
    List<FontFeature>? latinFontFeatures,
    List<FontVariation>? latinFontVariations,
    TextDecoration? latinDecoration,
    Color? latinDecorationColor,
    TextDecorationStyle? latinDecorationStyle,
    double? latinDecorationThickness,
    List<String>? latinFontFamilyFallback,
    String? latinFontFamily,
  }) {
    // Create base properties object
    final baseProperties = TextStyleProperties(
      fontSize: fontSize,
      color: color,
      backgroundColor: backgroundColor,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      leadingDistribution: leadingDistribution,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontFamilyFallback: fontFamilyFallback,
      debugLabel: debugLabel,
      inherit: inherit,
    );
    
    // Create Khmer-specific properties object if Khmer-specific properties are provided
    final khmerProperties = ScriptStyleProperties(
      fontSize: khmerFontSize,
      color: khmerColor,
      backgroundColor: khmerBackgroundColor,
      fontWeight: khmerFontWeight,
      fontStyle: khmerFontStyle,
      letterSpacing: khmerLetterSpacing,
      wordSpacing: khmerWordSpacing,
      textBaseline: khmerTextBaseline,
      height: khmerHeight,
      leadingDistribution: khmerLeadingDistribution,
      locale: khmerLocale,
      foreground: khmerForeground,
      background: khmerBackground,
      shadows: khmerShadows,
      fontFeatures: khmerFontFeatures,
      fontVariations: khmerFontVariations,
      decoration: khmerDecoration,
      decorationColor: khmerDecorationColor,
      decorationStyle: khmerDecorationStyle,
      decorationThickness: khmerDecorationThickness,
      fontFamilyFallback: khmerFontFamilyFallback,
      fontFamily: khmerFontFamily,
    );
    
    // Create Latin-specific properties object if Latin-specific properties are provided
    final latinProperties = ScriptStyleProperties(
      fontSize: latinFontSize,
      color: latinColor,
      backgroundColor: latinBackgroundColor,
      fontWeight: latinFontWeight,
      fontStyle: latinFontStyle,
      letterSpacing: latinLetterSpacing,
      wordSpacing: latinWordSpacing,
      textBaseline: latinTextBaseline,
      height: latinHeight,
      leadingDistribution: latinLeadingDistribution,
      locale: latinLocale,
      foreground: latinForeground,
      background: latinBackground,
      shadows: latinShadows,
      fontFeatures: latinFontFeatures,
      fontVariations: latinFontVariations,
      decoration: latinDecoration,
      decorationColor: latinDecorationColor,
      decorationStyle: latinDecorationStyle,
      decorationThickness: latinDecorationThickness,
      fontFamilyFallback: latinFontFamilyFallback,
      fontFamily: latinFontFamily,
    );
    
    // Generate appropriate TextStyle using ScriptRegistry
    return ScriptRegistry.createTextStyle(
      type: type,
      baseProperties: baseProperties,
      khmerProperties: khmerProperties,
      latinProperties: latinProperties,
    );
  }
}
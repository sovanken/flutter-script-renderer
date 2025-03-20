import 'package:flutter/material.dart';
import '../core/enums/script_type.dart';
import '../core/models/text_style_properties.dart';
import '../scripts/script_registry.dart';

/// Utility class for generating TextStyle objects based on script type.
///
/// This class serves as a central hub for creating properly configured [TextStyle]
/// objects that are optimized for different scripts. It handles the complexities of:
///
/// - Applying appropriate style properties for each script type
/// - Managing style property inheritance and overrides
/// - Consolidating base and script-specific styling properties
/// - Delegating to the ScriptRegistry for final style generation
///
/// This approach allows for consistent styling application while maintaining
/// the typographic requirements specific to each supported script.
class LocalizedTextStyle {
  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static utility methods and should not be instantiated.
  LocalizedTextStyle._();

  /// Generates a TextStyle appropriate for the given script type.
  ///
  /// This method consolidates base and script-specific styling properties, then
  /// delegates to [ScriptRegistry] to create the appropriate TextStyle object
  /// for the specified script type.
  ///
  /// The styling follows a hierarchy of specificity:
  /// 1. Script-specific properties (e.g., khmerFontSize for Khmer text)
  /// 2. Base properties (e.g., fontSize)
  /// 3. System defaults
  ///
  /// Parameters are organized into groups:
  /// - Base properties: Applied to all text segments as defaults
  /// - Khmer properties: Overrides for Khmer script segments
  /// - Thai properties: Overrides for Thai script segments
  /// - Lao properties: Overrides for Lao script segments
  /// - Myanmar properties: Overrides for Myanmar script segments
  /// - Vietnamese properties: Overrides for Vietnamese script segments
  /// - Latin properties: Overrides for Latin script segments
  ///
  /// Example usage:
  /// ```dart
  /// TextStyle thaiStyle = LocalizedTextStyle.getTextStyle(
  ///   type: ScriptType.thai,
  ///   fontSize: 16.0,
  ///   color: Colors.black,
  ///   thaiFontFamily: 'Sarabun',
  /// );
  /// ```
  ///
  /// @param type The script type for which to generate a TextStyle
  /// @returns A TextStyle configured appropriately for the specified script type
  static TextStyle getTextStyle({
    /// The script type for which to generate a TextStyle.
    /// This determines which script-specific properties will be applied.
    required ScriptType type,

    // Base properties - applied to all text segments unless overridden
    /// Base font size applied to all text segments unless overridden.
    double? fontSize,

    /// Base text color applied to all text segments unless overridden.
    Color? color,

    /// Base background color applied to all text segments unless overridden.
    Color? backgroundColor,

    /// Base font weight applied to all text segments unless overridden.
    FontWeight? fontWeight,

    /// Base font style (normal/italic) applied to all text segments unless overridden.
    FontStyle? fontStyle,

    /// Base letter spacing applied to all text segments unless overridden.
    double? letterSpacing,

    /// Base word spacing applied to all text segments unless overridden.
    double? wordSpacing,

    /// Base text baseline alignment applied to all text segments unless overridden.
    TextBaseline? textBaseline,

    /// Base line height applied to all text segments unless overridden.
    double? height,

    /// Base text leading distribution applied to all text segments unless overridden.
    TextLeadingDistribution? leadingDistribution,

    /// Base locale setting applied to all text segments unless overridden.
    Locale? locale,

    /// Base foreground paint applied to all text segments unless overridden.
    Paint? foreground,

    /// Base background paint applied to all text segments unless overridden.
    Paint? background,

    /// Base shadow effects applied to all text segments unless overridden.
    List<Shadow>? shadows,

    /// Base font features applied to all text segments unless overridden.
    List<FontFeature>? fontFeatures,

    /// Base font variations applied to all text segments unless overridden.
    List<FontVariation>? fontVariations,

    /// Base text decoration applied to all text segments unless overridden.
    TextDecoration? decoration,

    /// Base decoration color applied to all text segments unless overridden.
    Color? decorationColor,

    /// Base decoration style applied to all text segments unless overridden.
    TextDecorationStyle? decorationStyle,

    /// Base decoration thickness applied to all text segments unless overridden.
    double? decorationThickness,

    /// Base font family fallback list applied to all text segments unless overridden.
    List<String>? fontFamilyFallback,

    /// Debug label for identifying this text style in debugging tools.
    String? debugLabel,

    /// Whether to inherit text style from parent. Defaults to true if not specified.
    bool? inherit,

    // Khmer properties - override base properties for Khmer script
    /// Font size specifically for Khmer script segments, overrides base fontSize.
    double? khmerFontSize,

    /// Text color specifically for Khmer script segments, overrides base color.
    Color? khmerColor,

    /// Background color specifically for Khmer script segments, overrides base backgroundColor.
    Color? khmerBackgroundColor,

    /// Font weight specifically for Khmer script segments, overrides base fontWeight.
    FontWeight? khmerFontWeight,

    /// Font style specifically for Khmer script segments, overrides base fontStyle.
    FontStyle? khmerFontStyle,

    /// Letter spacing specifically for Khmer script segments, overrides base letterSpacing.
    double? khmerLetterSpacing,

    /// Word spacing specifically for Khmer script segments, overrides base wordSpacing.
    double? khmerWordSpacing,

    /// Text baseline alignment specifically for Khmer script segments.
    TextBaseline? khmerTextBaseline,

    /// Line height specifically for Khmer script segments, overrides base height.
    double? khmerHeight,

    /// Text leading distribution specifically for Khmer script segments.
    TextLeadingDistribution? khmerLeadingDistribution,

    /// Locale specifically for Khmer script segments, overrides base locale.
    Locale? khmerLocale,

    /// Foreground paint specifically for Khmer script segments.
    Paint? khmerForeground,

    /// Background paint specifically for Khmer script segments.
    Paint? khmerBackground,

    /// Shadow effects specifically for Khmer script segments.
    List<Shadow>? khmerShadows,

    /// Font features specifically for Khmer script segments.
    List<FontFeature>? khmerFontFeatures,

    /// Font variations specifically for Khmer script segments.
    List<FontVariation>? khmerFontVariations,

    /// Text decoration specifically for Khmer script segments.
    TextDecoration? khmerDecoration,

    /// Decoration color specifically for Khmer script segments.
    Color? khmerDecorationColor,

    /// Decoration style specifically for Khmer script segments.
    TextDecorationStyle? khmerDecorationStyle,

    /// Decoration thickness specifically for Khmer script segments.
    double? khmerDecorationThickness,

    /// Font family fallback list specifically for Khmer script segments.
    List<String>? khmerFontFamilyFallback,

    /// Font family specifically for Khmer script segments.
    /// This is particularly important for proper rendering of Khmer text.
    String? khmerFontFamily,

    // Thai properties - override base properties for Thai script
    /// Font size specifically for Thai script segments, overrides base fontSize.
    double? thaiFontSize,

    /// Text color specifically for Thai script segments, overrides base color.
    Color? thaiColor,

    /// Background color specifically for Thai script segments, overrides base backgroundColor.
    Color? thaiBackgroundColor,

    /// Font weight specifically for Thai script segments, overrides base fontWeight.
    FontWeight? thaiFontWeight,

    /// Font style specifically for Thai script segments, overrides base fontStyle.
    FontStyle? thaiFontStyle,

    /// Letter spacing specifically for Thai script segments, overrides base letterSpacing.
    double? thaiLetterSpacing,

    /// Word spacing specifically for Thai script segments, overrides base wordSpacing.
    double? thaiWordSpacing,

    /// Text baseline alignment specifically for Thai script segments.
    TextBaseline? thaiTextBaseline,

    /// Line height specifically for Thai script segments, overrides base height.
    double? thaiHeight,

    /// Text leading distribution specifically for Thai script segments.
    TextLeadingDistribution? thaiLeadingDistribution,

    /// Locale specifically for Thai script segments, overrides base locale.
    Locale? thaiLocale,

    /// Foreground paint specifically for Thai script segments.
    Paint? thaiForeground,

    /// Background paint specifically for Thai script segments.
    Paint? thaiBackground,

    /// Shadow effects specifically for Thai script segments.
    List<Shadow>? thaiShadows,

    /// Font features specifically for Thai script segments.
    List<FontFeature>? thaiFontFeatures,

    /// Font variations specifically for Thai script segments.
    List<FontVariation>? thaiFontVariations,

    /// Text decoration specifically for Thai script segments.
    TextDecoration? thaiDecoration,

    /// Decoration color specifically for Thai script segments.
    Color? thaiDecorationColor,

    /// Decoration style specifically for Thai script segments.
    TextDecorationStyle? thaiDecorationStyle,

    /// Decoration thickness specifically for Thai script segments.
    double? thaiDecorationThickness,

    /// Font family fallback list specifically for Thai script segments.
    List<String>? thaiFontFamilyFallback,

    /// Font family specifically for Thai script segments.
    /// This is particularly important for proper rendering of Thai text with tone marks.
    String? thaiFontFamily,

    // Lao properties - override base properties for Lao script
    /// Font size specifically for Lao script segments, overrides base fontSize.
    double? laoFontSize,

    /// Text color specifically for Lao script segments, overrides base color.
    Color? laoColor,

    /// Background color specifically for Lao script segments, overrides base backgroundColor.
    Color? laoBackgroundColor,

    /// Font weight specifically for Lao script segments, overrides base fontWeight.
    FontWeight? laoFontWeight,

    /// Font style specifically for Lao script segments, overrides base fontStyle.
    FontStyle? laoFontStyle,

    /// Letter spacing specifically for Lao script segments, overrides base letterSpacing.
    double? laoLetterSpacing,

    /// Word spacing specifically for Lao script segments, overrides base wordSpacing.
    double? laoWordSpacing,

    /// Text baseline alignment specifically for Lao script segments.
    TextBaseline? laoTextBaseline,

    /// Line height specifically for Lao script segments, overrides base height.
    double? laoHeight,

    /// Text leading distribution specifically for Lao script segments.
    TextLeadingDistribution? laoLeadingDistribution,

    /// Locale specifically for Lao script segments, overrides base locale.
    Locale? laoLocale,

    /// Foreground paint specifically for Lao script segments.
    Paint? laoForeground,

    /// Background paint specifically for Lao script segments.
    Paint? laoBackground,

    /// Shadow effects specifically for Lao script segments.
    List<Shadow>? laoShadows,

    /// Font features specifically for Lao script segments.
    List<FontFeature>? laoFontFeatures,

    /// Font variations specifically for Lao script segments.
    List<FontVariation>? laoFontVariations,

    /// Text decoration specifically for Lao script segments.
    TextDecoration? laoDecoration,

    /// Decoration color specifically for Lao script segments.
    Color? laoDecorationColor,

    /// Decoration style specifically for Lao script segments.
    TextDecorationStyle? laoDecorationStyle,

    /// Decoration thickness specifically for Lao script segments.
    double? laoDecorationThickness,

    /// Font family fallback list specifically for Lao script segments.
    List<String>? laoFontFamilyFallback,

    /// Font family specifically for Lao script segments.
    /// This is particularly important for proper rendering of Lao text.
    String? laoFontFamily,

    // Myanmar properties - override base properties for Myanmar script
    /// Font size specifically for Myanmar script segments, overrides base fontSize.
    double? myanmarFontSize,

    /// Text color specifically for Myanmar script segments, overrides base color.
    Color? myanmarColor,

    /// Background color specifically for Myanmar script segments, overrides base backgroundColor.
    Color? myanmarBackgroundColor,

    /// Font weight specifically for Myanmar script segments, overrides base fontWeight.
    FontWeight? myanmarFontWeight,

    /// Font style specifically for Myanmar script segments, overrides base fontStyle.
    FontStyle? myanmarFontStyle,

    /// Letter spacing specifically for Myanmar script segments, overrides base letterSpacing.
    double? myanmarLetterSpacing,

    /// Word spacing specifically for Myanmar script segments, overrides base wordSpacing.
    double? myanmarWordSpacing,

    /// Text baseline alignment specifically for Myanmar script segments.
    TextBaseline? myanmarTextBaseline,

    /// Line height specifically for Myanmar script segments, overrides base height.
    double? myanmarHeight,

    /// Text leading distribution specifically for Myanmar script segments.
    TextLeadingDistribution? myanmarLeadingDistribution,

    /// Locale specifically for Myanmar script segments, overrides base locale.
    Locale? myanmarLocale,

    /// Foreground paint specifically for Myanmar script segments.
    Paint? myanmarForeground,

    /// Background paint specifically for Myanmar script segments.
    Paint? myanmarBackground,

    /// Shadow effects specifically for Myanmar script segments.
    List<Shadow>? myanmarShadows,

    /// Font features specifically for Myanmar script segments.
    List<FontFeature>? myanmarFontFeatures,

    /// Font variations specifically for Myanmar script segments.
    List<FontVariation>? myanmarFontVariations,

    /// Text decoration specifically for Myanmar script segments.
    TextDecoration? myanmarDecoration,

    /// Decoration color specifically for Myanmar script segments.
    Color? myanmarDecorationColor,

    /// Decoration style specifically for Myanmar script segments.
    TextDecorationStyle? myanmarDecorationStyle,

    /// Decoration thickness specifically for Myanmar script segments.
    double? myanmarDecorationThickness,

    /// Font family fallback list specifically for Myanmar script segments.
    List<String>? myanmarFontFamilyFallback,

    /// Font family specifically for Myanmar script segments.
    /// This is particularly important for proper rendering of Myanmar text.
    String? myanmarFontFamily,

    // Vietnamese properties - override base properties for Vietnamese script
    /// Font size specifically for Vietnamese script segments, overrides base fontSize.
    double? vietnameseFontSize,

    /// Text color specifically for Vietnamese script segments, overrides base color.
    Color? vietnameseColor,

    /// Background color specifically for Vietnamese script segments, overrides base backgroundColor.
    Color? vietnameseBackgroundColor,

    /// Font weight specifically for Vietnamese script segments, overrides base fontWeight.
    FontWeight? vietnameseFontWeight,

    /// Font style specifically for Vietnamese script segments, overrides base fontStyle.
    FontStyle? vietnameseFontStyle,

    /// Letter spacing specifically for Vietnamese script segments, overrides base letterSpacing.
    double? vietnameseLetterSpacing,

    /// Word spacing specifically for Vietnamese script segments, overrides base wordSpacing.
    double? vietnameseWordSpacing,

    /// Text baseline alignment specifically for Vietnamese script segments.
    TextBaseline? vietnameseTextBaseline,

    /// Line height specifically for Vietnamese script segments, overrides base height.
    double? vietnameseHeight,

    /// Text leading distribution specifically for Vietnamese script segments.
    TextLeadingDistribution? vietnameseLeadingDistribution,

    /// Locale specifically for Vietnamese script segments, overrides base locale.
    Locale? vietnameseLocale,

    /// Foreground paint specifically for Vietnamese script segments.
    Paint? vietnameseForeground,

    /// Background paint specifically for Vietnamese script segments.
    Paint? vietnameseBackground,

    /// Shadow effects specifically for Vietnamese script segments.
    List<Shadow>? vietnameseShadows,

    /// Font features specifically for Vietnamese script segments.
    List<FontFeature>? vietnameseFontFeatures,

    /// Font variations specifically for Vietnamese script segments.
    List<FontVariation>? vietnameseFontVariations,

    /// Text decoration specifically for Vietnamese script segments.
    TextDecoration? vietnameseDecoration,

    /// Decoration color specifically for Vietnamese script segments.
    Color? vietnameseDecorationColor,

    /// Decoration style specifically for Vietnamese script segments.
    TextDecorationStyle? vietnameseDecorationStyle,

    /// Decoration thickness specifically for Vietnamese script segments.
    double? vietnameseDecorationThickness,

    /// Font family fallback list specifically for Vietnamese script segments.
    List<String>? vietnameseFontFamilyFallback,

    /// Font family specifically for Vietnamese script segments.
    /// This is particularly important for proper rendering of Vietnamese diacritics.
    String? vietnameseFontFamily,

    // Latin properties - override base properties for Latin script
    /// Font size specifically for Latin script segments, overrides base fontSize.
    double? latinFontSize,

    /// Text color specifically for Latin script segments, overrides base color.
    Color? latinColor,

    /// Background color specifically for Latin script segments, overrides base backgroundColor.
    Color? latinBackgroundColor,

    /// Font weight specifically for Latin script segments, overrides base fontWeight.
    FontWeight? latinFontWeight,

    /// Font style specifically for Latin script segments, overrides base fontStyle.
    FontStyle? latinFontStyle,

    /// Letter spacing specifically for Latin script segments, overrides base letterSpacing.
    double? latinLetterSpacing,

    /// Word spacing specifically for Latin script segments, overrides base wordSpacing.
    double? latinWordSpacing,

    /// Text baseline alignment specifically for Latin script segments.
    TextBaseline? latinTextBaseline,

    /// Line height specifically for Latin script segments, overrides base height.
    double? latinHeight,

    /// Text leading distribution specifically for Latin script segments.
    TextLeadingDistribution? latinLeadingDistribution,

    /// Locale specifically for Latin script segments, overrides base locale.
    Locale? latinLocale,

    /// Foreground paint specifically for Latin script segments.
    Paint? latinForeground,

    /// Background paint specifically for Latin script segments.
    Paint? latinBackground,

    /// Shadow effects specifically for Latin script segments.
    List<Shadow>? latinShadows,

    /// Font features specifically for Latin script segments.
    List<FontFeature>? latinFontFeatures,

    /// Font variations specifically for Latin script segments.
    List<FontVariation>? latinFontVariations,

    /// Text decoration specifically for Latin script segments.
    TextDecoration? latinDecoration,

    /// Decoration color specifically for Latin script segments.
    Color? latinDecorationColor,

    /// Decoration style specifically for Latin script segments.
    TextDecorationStyle? latinDecorationStyle,

    /// Decoration thickness specifically for Latin script segments.
    double? latinDecorationThickness,

    /// Font family fallback list specifically for Latin script segments.
    List<String>? latinFontFamilyFallback,

    /// Font family specifically for Latin script segments.
    String? latinFontFamily,
  }) {
    // Create base properties object to consolidate common styling
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

    // Create Thai-specific properties object if Thai-specific properties are provided
    final thaiProperties = ScriptStyleProperties(
      fontSize: thaiFontSize,
      color: thaiColor,
      backgroundColor: thaiBackgroundColor,
      fontWeight: thaiFontWeight,
      fontStyle: thaiFontStyle,
      letterSpacing: thaiLetterSpacing,
      wordSpacing: thaiWordSpacing,
      textBaseline: thaiTextBaseline,
      height: thaiHeight,
      leadingDistribution: thaiLeadingDistribution,
      locale: thaiLocale,
      foreground: thaiForeground,
      background: thaiBackground,
      shadows: thaiShadows,
      fontFeatures: thaiFontFeatures,
      fontVariations: thaiFontVariations,
      decoration: thaiDecoration,
      decorationColor: thaiDecorationColor,
      decorationStyle: thaiDecorationStyle,
      decorationThickness: thaiDecorationThickness,
      fontFamilyFallback: thaiFontFamilyFallback,
      fontFamily: thaiFontFamily,
    );

    // Create Lao-specific properties object if Lao-specific properties are provided
    final laoProperties = ScriptStyleProperties(
      fontSize: laoFontSize,
      color: laoColor,
      backgroundColor: laoBackgroundColor,
      fontWeight: laoFontWeight,
      fontStyle: laoFontStyle,
      letterSpacing: laoLetterSpacing,
      wordSpacing: laoWordSpacing,
      textBaseline: laoTextBaseline,
      height: laoHeight,
      leadingDistribution: laoLeadingDistribution,
      locale: laoLocale,
      foreground: laoForeground,
      background: laoBackground,
      shadows: laoShadows,
      fontFeatures: laoFontFeatures,
      fontVariations: laoFontVariations,
      decoration: laoDecoration,
      decorationColor: laoDecorationColor,
      decorationStyle: laoDecorationStyle,
      decorationThickness: laoDecorationThickness,
      fontFamilyFallback: laoFontFamilyFallback,
      fontFamily: laoFontFamily,
    );

    // Create Myanmar-specific properties object if Myanmar-specific properties are provided
    final myanmarProperties = ScriptStyleProperties(
      fontSize: myanmarFontSize,
      color: myanmarColor,
      backgroundColor: myanmarBackgroundColor,
      fontWeight: myanmarFontWeight,
      fontStyle: myanmarFontStyle,
      letterSpacing: myanmarLetterSpacing,
      wordSpacing: myanmarWordSpacing,
      textBaseline: myanmarTextBaseline,
      height: myanmarHeight,
      leadingDistribution: myanmarLeadingDistribution,
      locale: myanmarLocale,
      foreground: myanmarForeground,
      background: myanmarBackground,
      shadows: myanmarShadows,
      fontFeatures: myanmarFontFeatures,
      fontVariations: myanmarFontVariations,
      decoration: myanmarDecoration,
      decorationColor: myanmarDecorationColor,
      decorationStyle: myanmarDecorationStyle,
      decorationThickness: myanmarDecorationThickness,
      fontFamilyFallback: myanmarFontFamilyFallback,
      fontFamily: myanmarFontFamily,
    );

    // Create Vietnamese-specific properties object if Vietnamese-specific properties are provided
    final vietnameseProperties = ScriptStyleProperties(
      fontSize: vietnameseFontSize,
      color: vietnameseColor,
      backgroundColor: vietnameseBackgroundColor,
      fontWeight: vietnameseFontWeight,
      fontStyle: vietnameseFontStyle,
      letterSpacing: vietnameseLetterSpacing,
      wordSpacing: vietnameseWordSpacing,
      textBaseline: vietnameseTextBaseline,
      height: vietnameseHeight,
      leadingDistribution: vietnameseLeadingDistribution,
      locale: vietnameseLocale,
      foreground: vietnameseForeground,
      background: vietnameseBackground,
      shadows: vietnameseShadows,
      fontFeatures: vietnameseFontFeatures,
      fontVariations: vietnameseFontVariations,
      decoration: vietnameseDecoration,
      decorationColor: vietnameseDecorationColor,
      decorationStyle: vietnameseDecorationStyle,
      decorationThickness: vietnameseDecorationThickness,
      fontFamilyFallback: vietnameseFontFamilyFallback,
      fontFamily: vietnameseFontFamily,
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

    // Generate appropriate TextStyle using ScriptRegistry, which handles
    // script-specific optimizations and font selection logic
    return ScriptRegistry.createTextStyle(
      type: type,
      baseProperties: baseProperties,
      khmerProperties: khmerProperties,
      thaiProperties: thaiProperties,
      laoProperties: laoProperties,
      myanmarProperties: myanmarProperties,
      vietnameseProperties: vietnameseProperties,
      latinProperties: latinProperties,
    );
  }
}

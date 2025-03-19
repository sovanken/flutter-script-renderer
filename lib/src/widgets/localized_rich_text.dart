
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../core/enums/script_type.dart';
import '../core/utils/script_detector.dart';
import '../styles/localized_text_style.dart';

/// A text widget that automatically applies different text styles to different scripts
/// within the same string, optimizing for multilingual content.
class LocalizedRichText extends StatelessWidget {
  final String text;

  // Base properties
  final double? fontSize;
  final Color? color;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final double? height;
  final ui.TextLeadingDistribution? leadingDistribution;
  final Locale? locale;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final List<FontVariation>? fontVariations;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final List<String>? fontFamilyFallback;
  final String? debugLabel;
  final bool? inherit;

  // Khmer properties
  final double? khmerFontSize;
  final Color? khmerColor;
  final Color? khmerBackgroundColor;
  final FontWeight? khmerFontWeight;
  final FontStyle? khmerFontStyle;
  final double? khmerLetterSpacing;
  final double? khmerWordSpacing;
  final TextBaseline? khmerTextBaseline;
  final double? khmerHeight;
  final ui.TextLeadingDistribution? khmerLeadingDistribution;
  final Locale? khmerLocale;
  final Paint? khmerForeground;
  final Paint? khmerBackground;
  final List<Shadow>? khmerShadows;
  final List<FontFeature>? khmerFontFeatures;
  final List<FontVariation>? khmerFontVariations;
  final TextDecoration? khmerDecoration;
  final Color? khmerDecorationColor;
  final TextDecorationStyle? khmerDecorationStyle;
  final double? khmerDecorationThickness;
  final List<String>? khmerFontFamilyFallback;
  final String? khmerFontFamily;

  // Latin properties
  final double? latinFontSize;
  final Color? latinColor;
  final Color? latinBackgroundColor;
  final FontWeight? latinFontWeight;
  final FontStyle? latinFontStyle;
  final double? latinLetterSpacing;
  final double? latinWordSpacing;
  final TextBaseline? latinTextBaseline;
  final double? latinHeight;
  final ui.TextLeadingDistribution? latinLeadingDistribution;
  final Locale? latinLocale;
  final Paint? latinForeground;
  final Paint? latinBackground;
  final List<Shadow>? latinShadows;
  final List<FontFeature>? latinFontFeatures;
  final List<FontVariation>? latinFontVariations;
  final TextDecoration? latinDecoration;
  final Color? latinDecorationColor;
  final TextDecorationStyle? latinDecorationStyle;
  final double? latinDecorationThickness;
  final List<String>? latinFontFamilyFallback;
  final String? latinFontFamily;

  // Text widget properties
  final TextOverflow overflow;
  final TextAlign textAlign;
  final int? maxLines;
  final bool softWrap;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  const LocalizedRichText({
    super.key,
    required this.text,

    // Base properties
    this.fontSize,
    this.color,
    this.backgroundColor,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.leadingDistribution,
    this.locale,
    this.foreground,
    this.background,
    this.shadows,
    this.fontFeatures,
    this.fontVariations,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.fontFamilyFallback,
    this.debugLabel,
    this.inherit,

    // Khmer properties
    this.khmerFontSize,
    this.khmerColor,
    this.khmerBackgroundColor,
    this.khmerFontWeight,
    this.khmerFontStyle,
    this.khmerLetterSpacing,
    this.khmerWordSpacing,
    this.khmerTextBaseline,
    this.khmerHeight,
    this.khmerLeadingDistribution,
    this.khmerLocale,
    this.khmerForeground,
    this.khmerBackground,
    this.khmerShadows,
    this.khmerFontFeatures,
    this.khmerFontVariations,
    this.khmerDecoration,
    this.khmerDecorationColor,
    this.khmerDecorationStyle,
    this.khmerDecorationThickness,
    this.khmerFontFamilyFallback,
    this.khmerFontFamily,

    // Latin properties
    this.latinFontSize,
    this.latinColor,
    this.latinBackgroundColor,
    this.latinFontWeight,
    this.latinFontStyle,
    this.latinLetterSpacing,
    this.latinWordSpacing,
    this.latinTextBaseline,
    this.latinHeight,
    this.latinLeadingDistribution,
    this.latinLocale,
    this.latinForeground,
    this.latinBackground,
    this.latinShadows,
    this.latinFontFeatures,
    this.latinFontVariations,
    this.latinDecoration,
    this.latinDecorationColor,
    this.latinDecorationStyle,
    this.latinDecorationThickness,
    this.latinFontFamilyFallback,
    this.latinFontFamily,

    // Text widget properties
    this.overflow = TextOverflow.clip,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.softWrap = true,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
  });

  /// Simplified constructor for common use cases
  factory LocalizedRichText.simple({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign textAlign = TextAlign.start,
    String? khmerFontFamily,
    String? latinFontFamily,
  }) {
    return LocalizedRichText(
      text: text,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
      khmerFontFamily: khmerFontFamily,
      latinFontFamily: latinFontFamily,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<InlineSpan> spans = _buildTextSpans();
    return RichText(
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      text: TextSpan(children: spans),
    );
  }

  List<InlineSpan> _buildTextSpans() {
    final List<InlineSpan> spans = [];
    final segments = ScriptDetector.splitByScript(text);
    
    for (final segment in segments) {
      final text = segment.$1;
      final type = segment.$2;
      
      spans.add(TextSpan(
        text: text,
        style: _getTextStyle(type),
      ));
    }
    
    return spans;
  }

  /// Returns the appropriate TextStyle based on script type
  TextStyle _getTextStyle(ScriptType type) {
    return LocalizedTextStyle.getTextStyle(
      type: type,
      
      // Base properties
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
      
      // Khmer properties
      khmerFontSize: khmerFontSize,
      khmerColor: khmerColor,
      khmerBackgroundColor: khmerBackgroundColor,
      khmerFontWeight: khmerFontWeight,
      khmerFontStyle: khmerFontStyle,
      khmerLetterSpacing: khmerLetterSpacing,
      khmerWordSpacing: khmerWordSpacing,
      khmerTextBaseline: khmerTextBaseline,
      khmerHeight: khmerHeight,
      khmerLeadingDistribution: khmerLeadingDistribution,
      khmerLocale: khmerLocale,
      khmerForeground: khmerForeground,
      khmerBackground: khmerBackground,
      khmerShadows: khmerShadows,
      khmerFontFeatures: khmerFontFeatures,
      khmerFontVariations: khmerFontVariations,
      khmerDecoration: khmerDecoration,
      khmerDecorationColor: khmerDecorationColor,
      khmerDecorationStyle: khmerDecorationStyle,
      khmerDecorationThickness: khmerDecorationThickness,
      khmerFontFamilyFallback: khmerFontFamilyFallback,
      khmerFontFamily: khmerFontFamily,
      
      // Latin properties
      latinFontSize: latinFontSize,
      latinColor: latinColor,
      latinBackgroundColor: latinBackgroundColor,
      latinFontWeight: latinFontWeight,
      latinFontStyle: latinFontStyle,
      latinLetterSpacing: latinLetterSpacing,
      latinWordSpacing: latinWordSpacing,
      latinTextBaseline: latinTextBaseline,
      latinHeight: latinHeight,
      latinLeadingDistribution: latinLeadingDistribution,
      latinLocale: latinLocale,
      latinForeground: latinForeground,
      latinBackground: latinBackground,
      latinShadows: latinShadows,
      latinFontFeatures: latinFontFeatures,
      latinFontVariations: latinFontVariations,
      latinDecoration: latinDecoration,
      latinDecorationColor: latinDecorationColor,
      latinDecorationStyle: latinDecorationStyle,
      latinDecorationThickness: latinDecorationThickness,
      latinFontFamilyFallback: latinFontFamilyFallback,
      latinFontFamily: latinFontFamily,
    );
  }
}
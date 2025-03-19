import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/// Base class containing common text style properties
class TextStyleProperties {
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

  const TextStyleProperties({
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
  });

  /// Creates a TextStyle from these properties
  TextStyle toTextStyle({String? fontFamily}) {
    return TextStyle(
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
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      debugLabel: debugLabel,
      inherit: inherit ?? true,
    );
  }
}

/// Script-specific properties with font family
class ScriptStyleProperties extends TextStyleProperties {
  final String? fontFamily;

  const ScriptStyleProperties({
    super.fontSize,
    super.color,
    super.backgroundColor,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.fontFamilyFallback,
    super.debugLabel,
    super.inherit,
    this.fontFamily,
  });

  @override
  TextStyle toTextStyle({String? fontFamily}) {
    return super.toTextStyle(fontFamily: fontFamily ?? this.fontFamily);
  }
}

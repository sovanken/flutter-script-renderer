import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../core/enums/script_type.dart';
import '../core/utils/script_detector.dart';
import '../styles/localized_text_style.dart';

/// A highly customizable text widget that automatically detects and applies
/// different text styles to different scripts within a single string.
///
/// This widget is designed for multilingual applications where text may contain
/// mixed scripts (currently supporting Khmer and Latin) and each script requires
/// specific typography settings for optimal readability and appearance.
///
/// The widget automatically:
/// - Detects different script segments within the provided text
/// - Applies appropriate font families and styling to each segment
/// - Renders the text as a cohesive unit with script-specific optimizations
///
/// Example usage:
/// ```dart
/// LocalizedRichText(
///   text: 'English text និងអក្សរខ្មែរ mixed together',
///   fontSize: 16,
///   color: Colors.black,
///   khmerColor: Colors.blue,
///   latinFontFamily: 'Roboto',
///   khmerFontFamily: 'Battambang',
/// )
/// ```
///
/// For simpler use cases, see the [LocalizedRichText.simple] factory constructor.
class LocalizedRichText extends StatelessWidget {
  /// The text string to render, which may contain multiple scripts.
  ///
  /// This string will be automatically analyzed to detect different script segments.
  final String text;

  // Base properties
  /// Base font size applied to all text segments unless overridden by script-specific settings.
  final double? fontSize;

  /// Base text color applied to all text segments unless overridden by script-specific settings.
  final Color? color;

  /// Base background color applied to all text segments unless overridden by script-specific settings.
  final Color? backgroundColor;

  /// Base font weight applied to all text segments unless overridden by script-specific settings.
  final FontWeight? fontWeight;

  /// Base font style (normal or italic) applied to all text segments unless overridden.
  final FontStyle? fontStyle;

  /// Base letter spacing applied to all text segments unless overridden by script-specific settings.
  final double? letterSpacing;

  /// Base word spacing applied to all text segments unless overridden by script-specific settings.
  final double? wordSpacing;

  /// Base text baseline alignment applied to all text segments unless overridden.
  final TextBaseline? textBaseline;

  /// Base line height applied to all text segments unless overridden by script-specific settings.
  final double? height;

  /// Base text leading distribution applied to all text segments unless overridden.
  final ui.TextLeadingDistribution? leadingDistribution;

  /// Base locale for text rendering applied to all text segments unless overridden.
  final Locale? locale;

  /// Base foreground paint applied to all text segments unless overridden.
  final Paint? foreground;

  /// Base background paint applied to all text segments unless overridden.
  final Paint? background;

  /// Base shadow effects applied to all text segments unless overridden.
  final List<Shadow>? shadows;

  /// Base font features applied to all text segments unless overridden.
  final List<FontFeature>? fontFeatures;

  /// Base font variations applied to all text segments unless overridden.
  final List<FontVariation>? fontVariations;

  /// Base text decoration (underline, etc.) applied to all text segments unless overridden.
  final TextDecoration? decoration;

  /// Base decoration color applied to all text segments unless overridden.
  final Color? decorationColor;

  /// Base decoration style applied to all text segments unless overridden.
  final TextDecorationStyle? decorationStyle;

  /// Base decoration thickness applied to all text segments unless overridden.
  final double? decorationThickness;

  /// Base font family fallback list applied to all text segments unless overridden.
  final List<String>? fontFamilyFallback;

  /// Debug label for identifying this text style in debugging tools.
  final String? debugLabel;

  /// Whether to inherit text style from parent. Defaults to true if not specified.
  final bool? inherit;

  // Khmer properties
  /// Font size specifically for Khmer script segments, overrides the base fontSize.
  final double? khmerFontSize;

  /// Text color specifically for Khmer script segments, overrides the base color.
  final Color? khmerColor;

  /// Background color specifically for Khmer script segments, overrides the base backgroundColor.
  final Color? khmerBackgroundColor;

  /// Font weight specifically for Khmer script segments, overrides the base fontWeight.
  final FontWeight? khmerFontWeight;

  /// Font style specifically for Khmer script segments, overrides the base fontStyle.
  final FontStyle? khmerFontStyle;

  /// Letter spacing specifically for Khmer script segments, overrides the base letterSpacing.
  final double? khmerLetterSpacing;

  /// Word spacing specifically for Khmer script segments, overrides the base wordSpacing.
  final double? khmerWordSpacing;

  /// Text baseline alignment specifically for Khmer script segments.
  final TextBaseline? khmerTextBaseline;

  /// Line height specifically for Khmer script segments, overrides the base height.
  final double? khmerHeight;

  /// Text leading distribution specifically for Khmer script segments.
  final ui.TextLeadingDistribution? khmerLeadingDistribution;

  /// Locale specifically for Khmer script segments, overrides the base locale.
  final Locale? khmerLocale;

  /// Foreground paint specifically for Khmer script segments.
  final Paint? khmerForeground;

  /// Background paint specifically for Khmer script segments.
  final Paint? khmerBackground;

  /// Shadow effects specifically for Khmer script segments.
  final List<Shadow>? khmerShadows;

  /// Font features specifically for Khmer script segments.
  final List<FontFeature>? khmerFontFeatures;

  /// Font variations specifically for Khmer script segments.
  final List<FontVariation>? khmerFontVariations;

  /// Text decoration specifically for Khmer script segments.
  final TextDecoration? khmerDecoration;

  /// Decoration color specifically for Khmer script segments.
  final Color? khmerDecorationColor;

  /// Decoration style specifically for Khmer script segments.
  final TextDecorationStyle? khmerDecorationStyle;

  /// Decoration thickness specifically for Khmer script segments.
  final double? khmerDecorationThickness;

  /// Font family fallback list specifically for Khmer script segments.
  final List<String>? khmerFontFamilyFallback;

  /// Font family specifically for Khmer script segments. This is particularly important
  /// for proper rendering of Khmer text.
  final String? khmerFontFamily;

  // Latin properties
  /// Font size specifically for Latin script segments, overrides the base fontSize.
  final double? latinFontSize;

  /// Text color specifically for Latin script segments, overrides the base color.
  final Color? latinColor;

  /// Background color specifically for Latin script segments, overrides the base backgroundColor.
  final Color? latinBackgroundColor;

  /// Font weight specifically for Latin script segments, overrides the base fontWeight.
  final FontWeight? latinFontWeight;

  /// Font style specifically for Latin script segments, overrides the base fontStyle.
  final FontStyle? latinFontStyle;

  /// Letter spacing specifically for Latin script segments, overrides the base letterSpacing.
  final double? latinLetterSpacing;

  /// Word spacing specifically for Latin script segments, overrides the base wordSpacing.
  final double? latinWordSpacing;

  /// Text baseline alignment specifically for Latin script segments.
  final TextBaseline? latinTextBaseline;

  /// Line height specifically for Latin script segments, overrides the base height.
  final double? latinHeight;

  /// Text leading distribution specifically for Latin script segments.
  final ui.TextLeadingDistribution? latinLeadingDistribution;

  /// Locale specifically for Latin script segments, overrides the base locale.
  final Locale? latinLocale;

  /// Foreground paint specifically for Latin script segments.
  final Paint? latinForeground;

  /// Background paint specifically for Latin script segments.
  final Paint? latinBackground;

  /// Shadow effects specifically for Latin script segments.
  final List<Shadow>? latinShadows;

  /// Font features specifically for Latin script segments.
  final List<FontFeature>? latinFontFeatures;

  /// Font variations specifically for Latin script segments.
  final List<FontVariation>? latinFontVariations;

  /// Text decoration specifically for Latin script segments.
  final TextDecoration? latinDecoration;

  /// Decoration color specifically for Latin script segments.
  final Color? latinDecorationColor;

  /// Decoration style specifically for Latin script segments.
  final TextDecorationStyle? latinDecorationStyle;

  /// Decoration thickness specifically for Latin script segments.
  final double? latinDecorationThickness;

  /// Font family fallback list specifically for Latin script segments.
  final List<String>? latinFontFamilyFallback;

  /// Font family specifically for Latin script segments.
  final String? latinFontFamily;

  // Text widget properties
  /// How to handle text that overflows its container.
  ///
  /// Defaults to [TextOverflow.clip] which will simply clip the overflowing text.
  final TextOverflow overflow;

  /// How to align the text within its container.
  ///
  /// Defaults to [TextAlign.start] which aligns text to the leading edge of the container.
  final TextAlign textAlign;

  /// Maximum number of lines to display before truncating.
  ///
  /// If null (the default), the text will be displayed on as many lines as needed.
  final int? maxLines;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the text will only wrap at explicit newline characters.
  /// Defaults to true.
  final bool softWrap;

  /// The strategy to use when calculating the width of the text.
  ///
  /// Defaults to [TextWidthBasis.parent] which sizes the text to the width of its parent.
  final TextWidthBasis textWidthBasis;

  /// Defines how the paragraph will apply TextStyle.height to the ascent of the first line
  /// and descent of the last line.
  final TextHeightBehavior? textHeightBehavior;

  /// Creates a localized rich text widget with full customization options.
  ///
  /// The [text] parameter is required and will be analyzed to detect script segments.
  /// All other parameters are optional and allow for extensive customization of
  /// text appearance, both globally and per script type.
  ///
  /// For simpler usage with fewer parameters, see [LocalizedRichText.simple].
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

  /// Creates a simplified localized rich text widget with fewer parameters.
  ///
  /// This factory constructor provides a more concise way to create a [LocalizedRichText]
  /// with common styling parameters, ideal for most use cases.
  ///
  /// Parameters:
  /// - [text]: The multilingual text string to render
  /// - [fontSize]: Font size to apply to all text segments
  /// - [color]: Text color to apply to all text segments
  /// - [fontWeight]: Font weight to apply to all text segments
  /// - [textAlign]: Text alignment within its container (default: TextAlign.start)
  /// - [khmerFontFamily]: Font family to use specifically for Khmer script segments
  /// - [latinFontFamily]: Font family to use specifically for Latin script segments
  ///
  /// Example:
  /// ```dart
  /// LocalizedRichText.simple(
  ///   text: 'English និងខ្មែរ mixed together',
  ///   fontSize: 16,
  ///   color: Colors.black,
  /// )
  /// ```
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

  /// Builds the widget tree for this localized rich text.
  ///
  /// This method creates a [RichText] widget with automatically generated
  /// text spans based on script detection within the provided text.
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

  /// Builds the text spans for each detected script segment.
  ///
  /// This method analyzes the text string, splits it into segments based
  /// on script detection, and creates appropriately styled TextSpan objects
  /// for each segment.
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

  /// Returns the appropriate TextStyle based on script type.
  ///
  /// This method delegates to [LocalizedTextStyle.getTextStyle] to generate
  /// a properly configured TextStyle for the given script type, passing along
  /// all the base and script-specific properties.
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

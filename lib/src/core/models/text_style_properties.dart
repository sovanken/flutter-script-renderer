import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/// A comprehensive model class that encapsulates all text styling properties supported by Flutter.
///
/// This class serves as a container for text style configuration, separating style
/// definition from style application. It provides a structured way to:
///
/// - Group related text styling properties
/// - Transfer styling information between components
/// - Convert properties into a Flutter [TextStyle] object when needed
/// - Support inheritance of properties in derived classes
///
/// The properties mirror those available in Flutter's [TextStyle], allowing for complete
/// customization of text appearance.
///
/// This class is particularly useful in multilingual text rendering where different
/// scripts may require different styling properties while sharing a common structure.
class TextStyleProperties {
  /// The size of the text in logical pixels.
  /// Typically, the text height is 1.2 times the font size.
  final double? fontSize;

  /// The color to use when painting the text.
  final Color? color;

  /// The background color for the text.
  final Color? backgroundColor;

  /// The typeface thickness to use when painting the text (normal, bold, etc.).
  final FontWeight? fontWeight;

  /// The typeface variant to use when drawing the text (normal, italic).
  final FontStyle? fontStyle;

  /// The amount of space to add between each letter.
  /// A negative value can be used to bring letters closer.
  final double? letterSpacing;

  /// The amount of space to add at each sequence of white-space.
  final double? wordSpacing;

  /// The common baseline used to align the text.
  final TextBaseline? textBaseline;

  /// The line height as a multiplier of the font size.
  /// The default line height is determined by the font.
  final double? height;

  /// How the text's leading (space above the baseline) is distributed.
  final ui.TextLeadingDistribution? leadingDistribution;

  /// The locale used to select region-specific glyphs and formatting.
  final Locale? locale;

  /// The paint used to draw the text.
  /// If specified, [color] is ignored.
  final Paint? foreground;

  /// The paint used to draw behind the text.
  /// If specified, [backgroundColor] is ignored.
  final Paint? background;

  /// The shadow effects applied to the text.
  final List<Shadow>? shadows;

  /// The advanced font features to apply to the text.
  /// Examples include enabling small caps or old-style figures.
  final List<FontFeature>? fontFeatures;

  /// The font variations to apply to the text.
  /// Variable fonts can use this to customize specific axes.
  final List<FontVariation>? fontVariations;

  /// The decorations to paint near the text (underline, overline, etc.).
  final TextDecoration? decoration;

  /// The color in which to paint the text decorations.
  final Color? decorationColor;

  /// The style in which to paint the text decorations (solid, dotted, etc.).
  final TextDecorationStyle? decorationStyle;

  /// The thickness of the decoration stroke as a multiplier of the font size.
  final double? decorationThickness;

  /// The ordered list of font families to fall back to when a glyph
  /// cannot be found in the primary font family.
  final List<String>? fontFamilyFallback;

  /// A human-readable description of this text style for debugging purposes.
  final String? debugLabel;

  /// Whether to inherit properties from an ancestor text style.
  /// Defaults to true if not specified when creating a [TextStyle].
  final bool? inherit;

  /// Creates a text style properties container with the specified values.
  ///
  /// All parameters are optional and can be specified individually. This allows
  /// for creating partial style configurations that can be combined or overridden.
  ///
  /// By keeping all properties optional, this class supports incremental style
  /// building and style composition patterns.
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

  /// Converts these properties into a Flutter [TextStyle] object.
  ///
  /// This method creates a [TextStyle] instance using all the properties
  /// defined in this container. It allows specifying an optional [fontFamily]
  /// parameter that can override any font family defined in derived classes.
  ///
  /// The resulting [TextStyle] can be directly used with Flutter text widgets
  /// or further modified with additional style properties.
  ///
  /// Parameters:
  /// - [fontFamily]: Optional font family name that overrides any font family
  ///   specified in derived classes. If null, no font family is applied.
  ///
  /// Returns a [TextStyle] object configured with all the properties from this container.
  ///
  /// Example:
  /// ```dart
  /// final properties = TextStyleProperties(
  ///   fontSize: 16.0,
  ///   color: Colors.blue,
  /// );
  /// final style = properties.toTextStyle(fontFamily: 'Roboto');
  /// ```
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

/// Script-specific text style properties that include font family information.
///
/// This class extends [TextStyleProperties] to add font family specification,
/// which is particularly important for script-specific text rendering. It allows
/// for defining a complete set of style properties tailored to a particular script,
/// including the appropriate font family.
///
/// By separating script-specific properties into a specialized class, the package
/// can maintain clean boundaries between general styling and script-specific styling.
///
/// This class is typically used to define styles for specific scripts like Khmer, Thai,
/// Lao, Myanmar, Vietnamese, or Latin, where each script may require different typography
/// settings for optimal rendering.
class ScriptStyleProperties extends TextStyleProperties {
  /// The font family to use for the specific script.
  ///
  /// This property is essential for script-specific styling as different scripts
  /// require different font families designed to handle their unique characters
  /// and typographic requirements.
  ///
  /// For example:
  /// - Khmer text requires fonts specifically designed for Khmer script
  /// - Thai text needs fonts that properly render tone marks and vowel positioning
  /// - Lao text requires fonts with proper glyph support for Lao characters
  /// - Myanmar text needs fonts that handle complex stacking and medial consonants
  /// - Vietnamese text benefits from fonts with proper diacritic support
  /// - Latin text can use standard Latin fonts
  final String? fontFamily;

  /// Creates script-specific style properties with an optional font family.
  ///
  /// This constructor extends the base [TextStyleProperties] constructor
  /// with a [fontFamily] parameter. All base properties can still be specified,
  /// but with the addition of script-specific font family information.
  ///
  /// Example:
  /// ```dart
  /// final thaiProperties = ScriptStyleProperties(
  ///   fontSize: 18.0,
  ///   color: Colors.black,
  ///   fontFamily: 'Sarabun',
  /// );
  /// ```
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

  /// Converts these script-specific properties into a Flutter [TextStyle] object.
  ///
  /// This method overrides the base class implementation to incorporate the
  /// script-specific font family. It prioritizes any font family passed as a
  /// parameter over the font family defined in this class.
  ///
  /// This prioritization allows for flexible style handling, where higher-level
  /// components can override font family choices when necessary.
  ///
  /// Parameters:
  /// - [fontFamily]: Optional font family that takes precedence over this class's
  ///   fontFamily property. If null, this class's fontFamily is used.
  ///
  /// Returns a [TextStyle] object configured with script-specific properties.
  @override
  TextStyle toTextStyle({String? fontFamily}) {
    return super.toTextStyle(fontFamily: fontFamily ?? this.fontFamily);
  }
}

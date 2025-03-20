import 'package:flutter/material.dart';
import '../flutter_script_renderer.dart';

/// Extensions on String for easier use of the LocalizedRichText widget.
///
/// This extension provides a convenient way to convert any string into a
/// properly formatted multilingual text widget that automatically detects
/// and styles different scripts (Khmer and Latin) within the string.
///
/// Example usage:
/// ```dart
/// 'Hello world និងសួស្តី'.toLocalizedText(
///   fontSize: 16,
///   color: Colors.blue,
/// )
/// ```
extension LocalizedTextExtension on String {
  /// Creates a LocalizedRichText widget from this string.
  ///
  /// This method provides a simplified syntax for creating mixed-script text widgets,
  /// automatically applying appropriate styling to different script segments.
  ///
  /// Parameters:
  /// - [key]: Optional key for uniquely identifying this widget
  /// - [fontSize]: Base font size for all text segments
  /// - [color]: Base text color for all text segments
  /// - [fontWeight]: Base font weight for all text segments
  /// - [textAlign]: Alignment of text within its container (default: TextAlign.start)
  /// - [khmerFontFamily]: Optional custom font family for Khmer script segments
  /// - [latinFontFamily]: Optional custom font family for Latin script segments
  /// - [overflow]: How to handle text overflow (default: TextOverflow.clip)
  /// - [maxLines]: Maximum number of lines to display (null for unlimited)
  ///
  /// Returns a LocalizedRichText widget that automatically detects and styles
  /// different scripts within this string.
  Widget toLocalizedText({
    Key? key,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign textAlign = TextAlign.start,
    String? khmerFontFamily,
    String? latinFontFamily,
    TextOverflow overflow = TextOverflow.clip,
    int? maxLines,
  }) {
    return LocalizedRichText.simple(
      text: this,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
      khmerFontFamily: khmerFontFamily,
      latinFontFamily: latinFontFamily,
    );
  }
}

/// Extensions on BuildContext for theme-aware localized text.
///
/// This extension provides methods to create localized text widgets that
/// automatically inherit styling properties from the current theme when
/// not explicitly specified, allowing for consistent styling across your
/// application while maintaining proper script-specific rendering.
///
/// Example usage:
/// ```dart
/// context.localizedText(
///   'Theme-styled text ជាមួយនឹងរចនាបទពីប្រធានបទ',
///   fontSize: 18,
/// )
/// ```
extension LocalizedTextContextExtension on BuildContext {
  /// Creates a LocalizedRichText widget with theme-aware styling.
  ///
  /// This method automatically inherits styling from the current theme for
  /// any properties that are not explicitly specified, while still providing
  /// proper script-specific rendering.
  ///
  /// Parameters:
  /// - [text]: The multilingual text string to render
  /// - [key]: Optional key for uniquely identifying this widget
  /// - [fontSize]: Custom font size, or null to use theme's bodyMedium fontSize
  /// - [color]: Custom text color, or null to use theme's bodyMedium color
  /// - [fontWeight]: Custom font weight, or null to use theme's bodyMedium fontWeight
  /// - [textAlign]: Alignment of text within its container (default: TextAlign.start)
  /// - [khmerFontFamily]: Optional custom font family for Khmer script segments
  /// - [latinFontFamily]: Optional custom font family for Latin script segments
  /// - [overflow]: How to handle text overflow (default: TextOverflow.clip)
  /// - [maxLines]: Maximum number of lines to display (null for unlimited)
  ///
  /// Returns a theme-aware LocalizedRichText widget that inherits styling from
  /// the current theme while maintaining proper script-specific rendering.
  Widget localizedText(
    String text, {
    Key? key,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign textAlign = TextAlign.start,
    String? khmerFontFamily,
    String? latinFontFamily,
    TextOverflow overflow = TextOverflow.clip,
    int? maxLines,
  }) {
    final theme = Theme.of(this);

    return LocalizedRichText.simple(
      text: text,
      fontSize: fontSize ?? theme.textTheme.bodyMedium?.fontSize,
      color: color ?? theme.textTheme.bodyMedium?.color,
      fontWeight: fontWeight ?? theme.textTheme.bodyMedium?.fontWeight,
      textAlign: textAlign,
      khmerFontFamily: khmerFontFamily,
      latinFontFamily: latinFontFamily,
    );
  }
}

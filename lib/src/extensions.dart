import 'package:flutter/material.dart';
import '../flutter_script_renderer.dart';

/// Extensions on String for easier use of the LocalizedRichText widget
extension LocalizedTextExtension on String {
  /// Creates a LocalizedRichText widget from this string
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

/// Extensions on BuildContext for theme-aware localized text
extension LocalizedTextContextExtension on BuildContext {
  /// Creates a LocalizedRichText widget with theme-aware styling
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
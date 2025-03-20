import 'package:flutter/material.dart';
import '../core/enums/script_type.dart';
import '../core/models/text_style_properties.dart';
import 'khmer/khmer_style.dart';
import 'latin/latin_style.dart';
import 'thai/thai_style.dart';
import 'lao/lao_style.dart';
import 'myanmar/myanmar_style.dart';
import 'vietnamese/vietnamese_style.dart';

/// Registry for script handlers that centralizes text style generation for different scripts.
///
/// This class serves as a coordination point and factory for creating properly styled
/// [TextStyle] objects based on script type. It delegates style generation to specialized
/// script handlers (e.g., [KhmerStyle], [LatinStyle], [ThaiStyle], [LaoStyle],
/// [MyanmarStyle], [VietnameseStyle]) while providing a unified interface.
///
/// The registry pattern used here allows for:
/// - Central management of all supported scripts
/// - Easy extension to additional scripts in the future
/// - Consistent style application across the application
/// - Simplified interface for other components
///
/// This class should not be instantiated directly; use its static methods instead.
class ScriptRegistry {
  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static utility methods and should not be instantiated.
  /// All functionality is accessed through static methods.
  ScriptRegistry._();

  /// Creates a TextStyle for a given script type based on provided properties.
  ///
  /// This factory method analyzes the script type and delegates to the appropriate
  /// specialized style handler to generate a properly configured TextStyle. Each
  /// script type may require specific typography adjustments for optimal rendering.
  ///
  /// The method supports a cascading property model:
  /// - Base properties apply to all text by default
  /// - Script-specific properties override base properties when provided
  ///
  /// For neutral characters (punctuation, spaces, etc.), the method defaults to Latin
  /// styling since these characters typically align better with the surrounding script.
  ///
  /// Example usage:
  /// ```dart
  /// TextStyle thaiStyle = ScriptRegistry.createTextStyle(
  ///   type: ScriptType.thai,
  ///   baseProperties: baseProps,
  ///   thaiProperties: thaiProps,
  /// );
  /// ```
  ///
  /// Parameters:
  /// - [type]: The script type for which to create a TextStyle
  /// - [baseProperties]: Base text style properties that apply to all scripts
  /// - [khmerProperties]: Optional Khmer-specific style properties that override base properties
  /// - [latinProperties]: Optional Latin-specific style properties that override base properties
  /// - [thaiProperties]: Optional Thai-specific style properties that override base properties
  /// - [laoProperties]: Optional Lao-specific style properties that override base properties
  /// - [myanmarProperties]: Optional Myanmar-specific style properties that override base properties
  /// - [vietnameseProperties]: Optional Vietnamese-specific style properties that override base properties
  ///
  /// Returns a TextStyle configured appropriately for the specified script type.
  static TextStyle createTextStyle({
    /// The script type for which to create a TextStyle.
    /// This determines which specialized style handler will be used.
    required ScriptType type,

    /// Base text style properties that apply to all scripts.
    /// These serve as defaults if script-specific properties are not provided.
    required TextStyleProperties baseProperties,

    /// Optional Khmer-specific style properties.
    /// These override corresponding base properties when the script type is Khmer.
    ScriptStyleProperties? khmerProperties,

    /// Optional Latin-specific style properties.
    /// These override corresponding base properties when the script type is Latin.
    ScriptStyleProperties? latinProperties,

    /// Optional Thai-specific style properties.
    /// These override corresponding base properties when the script type is Thai.
    ScriptStyleProperties? thaiProperties,

    /// Optional Lao-specific style properties.
    /// These override corresponding base properties when the script type is Lao.
    ScriptStyleProperties? laoProperties,

    /// Optional Myanmar-specific style properties.
    /// These override corresponding base properties when the script type is Myanmar.
    ScriptStyleProperties? myanmarProperties,

    /// Optional Vietnamese-specific style properties.
    /// These override corresponding base properties when the script type is Vietnamese.
    ScriptStyleProperties? vietnameseProperties,
  }) {
    switch (type) {
      case ScriptType.khmer:
        // Delegate to the Khmer style handler for Khmer script
        return KhmerStyle.createTextStyle(
          baseProperties: baseProperties,
          khmerProperties: khmerProperties,
        );
      case ScriptType.latin:
        // Delegate to the Latin style handler for Latin script
        return LatinStyle.createTextStyle(
          baseProperties: baseProperties,
          latinProperties: latinProperties,
        );
      case ScriptType.thai:
        // Delegate to the Thai style handler for Thai script
        return ThaiStyle.createTextStyle(
          baseProperties: baseProperties,
          thaiProperties: thaiProperties,
        );
      case ScriptType.lao:
        // Delegate to the Lao style handler for Lao script
        return LaoStyle.createTextStyle(
          baseProperties: baseProperties,
          laoProperties: laoProperties,
        );
      case ScriptType.myanmar:
        // Delegate to the Myanmar style handler for Myanmar script
        return MyanmarStyle.createTextStyle(
          baseProperties: baseProperties,
          myanmarProperties: myanmarProperties,
        );
      case ScriptType.vietnamese:
        // Delegate to the Vietnamese style handler for Vietnamese script
        return VietnameseStyle.createTextStyle(
          baseProperties: baseProperties,
          vietnameseProperties: vietnameseProperties,
        );
      case ScriptType.neutral:
        // Neutral text (punctuation, spaces, etc.) inherits from Latin by default
        // This provides better visual consistency with surrounding text
        return LatinStyle.createTextStyle(
          baseProperties: baseProperties,
          latinProperties: latinProperties,
        );
    }
  }
}

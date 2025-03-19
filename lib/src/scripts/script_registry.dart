import 'package:flutter/material.dart';
import '../core/enums/script_type.dart';
import '../core/models/text_style_properties.dart';
import 'khmer/khmer_style.dart';
import 'latin/latin_style.dart';

/// Registry for script handlers
/// This class is responsible for managing style generation for different scripts
class ScriptRegistry {
  /// Private constructor to prevent instantiation
  ScriptRegistry._();
  
  /// Creates a TextStyle for a given script type based on provided properties
  static TextStyle createTextStyle({
    required ScriptType type,
    required TextStyleProperties baseProperties,
    ScriptStyleProperties? khmerProperties,
    ScriptStyleProperties? latinProperties,
  }) {
    switch (type) {
      case ScriptType.khmer:
        return KhmerStyle.createTextStyle(
          baseProperties: baseProperties,
          khmerProperties: khmerProperties,
        );
      case ScriptType.latin:
        return LatinStyle.createTextStyle(
          baseProperties: baseProperties,
          latinProperties: latinProperties,
        );
      case ScriptType.neutral:
        // Neutral text inherits from Latin by default
        return LatinStyle.createTextStyle(
          baseProperties: baseProperties,
          latinProperties: latinProperties,
        );
    }
  }
}
import '../../core/enums/script_type.dart';

/// Utility class for detecting script types within text
class ScriptDetector {
  /// Regex for matching Khmer script Unicode range
  static final RegExp _khmerRegex = RegExp(r'[\u1780-\u17FF]+');
  
  /// Regex for matching Latin script (alphanumeric characters)
  static final RegExp _latinRegex = RegExp(r'[a-zA-Z0-9]+');
  
  /// Combined pattern to match all possible text segments (Khmer, Latin, spaces, symbols)
  static final RegExp _combinedPattern = RegExp(
      r'[\u1780-\u17FF]+|[a-zA-Z0-9]+|\s+|[^\u1780-\u17FFa-zA-Z0-9\s]+');

  /// Private constructor to prevent instantiation
  ScriptDetector._();
  
  /// Detects the script type of a given text segment
  static ScriptType detectScriptType(String text) {
    if (_khmerRegex.hasMatch(text)) {
      return ScriptType.khmer;
    } else if (_latinRegex.hasMatch(text)) {
      return ScriptType.latin;
    }
    return ScriptType.neutral;
  }
  
  /// Splits text into segments based on script type and returns a list of
  /// tuples containing each segment and its detected script type
  static List<(String, ScriptType)> splitByScript(String text) {
    final List<(String, ScriptType)> segments = [];
    final matches = _combinedPattern.allMatches(text);
    ScriptType currentScript = ScriptType.neutral;
    
    for (final match in matches) {
      final String segment = match.group(0)!;
      ScriptType segmentType;
      
      if (_khmerRegex.hasMatch(segment)) {
        segmentType = ScriptType.khmer;
        currentScript = ScriptType.khmer;
      } else if (_latinRegex.hasMatch(segment)) {
        segmentType = ScriptType.latin;
        currentScript = ScriptType.latin;
      } else if (segment.trim().isEmpty) {
        // Whitespace inherits previous script's style
        segmentType = currentScript;
      } else {
        // Symbols and other characters inherit previous script's style
        segmentType = currentScript;
      }
      
      segments.add((segment, segmentType));
    }
    
    return segments;
  }
}
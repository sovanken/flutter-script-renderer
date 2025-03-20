import '../../core/enums/script_type.dart';

/// Utility class for detecting and segmenting text based on script types.
///
/// This class provides the core text analysis functionality for the package,
/// identifying different scripts within a single string and segmenting text
/// appropriately. It uses Unicode range detection via regular expressions to:
///
/// - Identify Khmer script characters (Unicode range U+1780 to U+17FF)
/// - Identify Latin script characters (standard alphanumeric characters)
/// - Split mixed-script strings into homogeneous segments
/// - Determine contextual treatment of neutral characters
///
/// The detector ensures that whitespace, punctuation, and symbols are associated
/// with the surrounding script context, providing natural text flow and consistent
/// styling when rendered.
///
/// Example usage:
/// ```dart
/// String mixedText = 'English text និងអក្សរខ្មែរ mixed together';
/// var segments = ScriptDetector.splitByScript(mixedText);
/// // Result: [('English text ', Latin), ('និងអក្សរខ្មែរ', Khmer), (' mixed together', Latin)]
/// ```
class ScriptDetector {
  /// Regular expression for matching Khmer script Unicode range.
  ///
  /// This pattern captures characters in the Khmer Unicode block (U+1780 to U+17FF),
  /// which includes all standard Khmer consonants, vowels, and diacritics.
  static final RegExp _khmerRegex = RegExp(r'[\u1780-\u17FF]+');

  /// Regular expression for matching Latin script (alphanumeric characters).
  ///
  /// This pattern captures standard Latin characters (a-z, A-Z) and Arabic numerals (0-9),
  /// covering most Western European languages that use the Latin alphabet.
  static final RegExp _latinRegex = RegExp(r'[a-zA-Z0-9]+');

  /// Combined pattern to match all possible text segments (Khmer, Latin, spaces, symbols).
  ///
  /// This comprehensive regular expression captures:
  /// 1. Sequences of Khmer characters
  /// 2. Sequences of Latin characters and digits
  /// 3. Sequences of whitespace
  /// 4. Sequences of other characters (symbols, punctuation, etc.)
  ///
  /// This pattern ensures complete text coverage with no unmatched characters,
  /// allowing the entire input string to be properly segmented.
  static final RegExp _combinedPattern =
      RegExp(r'[\u1780-\u17FF]+|[a-zA-Z0-9]+|\s+|[^\u1780-\u17FFa-zA-Z0-9\s]+');

  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static utility methods and should not be instantiated.
  ScriptDetector._();

  /// Detects the script type of a given text segment.
  ///
  /// This method analyzes a text segment and determines its primary script type
  /// based on Unicode character ranges. It returns one of three possible script types:
  /// - [ScriptType.khmer] if Khmer characters are detected
  /// - [ScriptType.latin] if Latin characters are detected
  /// - [ScriptType.neutral] if only neutral characters (spaces, symbols) are present
  ///
  /// If a segment contains characters from multiple scripts, the first detected
  /// script takes precedence, with Khmer script detection having highest priority.
  ///
  /// Parameters:
  /// - [text]: The text segment to analyze
  ///
  /// Returns the detected [ScriptType] for the text segment.
  ///
  /// Example:
  /// ```dart
  /// ScriptType type = ScriptDetector.detectScriptType('Hello');  // Returns ScriptType.latin
  /// ScriptType type = ScriptDetector.detectScriptType('សួស្តី');  // Returns ScriptType.khmer
  /// ScriptType type = ScriptDetector.detectScriptType('!@#$');   // Returns ScriptType.neutral
  /// ```
  static ScriptType detectScriptType(String text) {
    if (_khmerRegex.hasMatch(text)) {
      return ScriptType.khmer;
    } else if (_latinRegex.hasMatch(text)) {
      return ScriptType.latin;
    }
    return ScriptType.neutral;
  }

  /// Splits text into segments based on script type.
  ///
  /// This method analyzes a string containing mixed scripts and splits it into
  /// homogeneous segments, each with a consistent script type. It intelligently
  /// handles whitespace and symbols by associating them with the preceding script
  /// context, providing natural text flow when styling is applied.
  ///
  /// The segmentation process:
  /// 1. Identifies all text segments using the combined pattern
  /// 2. Determines the script type of each segment
  /// 3. Associates neutral characters (spaces, symbols) with the preceding script
  /// 4. Creates tuples pairing each segment with its script type
  ///
  /// Parameters:
  /// - [text]: The mixed-script text string to segment
  ///
  /// Returns a list of tuples, each containing a text segment and its associated [ScriptType].
  /// The original string can be reconstructed by concatenating all segments in order.
  ///
  /// Example:
  /// ```dart
  /// var result = ScriptDetector.splitByScript('Hello សួស្តី!');
  /// // Returns: [('Hello ', Latin), ('សួស្តី', Khmer), ('!', Khmer)]
  /// ```
  static List<(String, ScriptType)> splitByScript(String text) {
    final List<(String, ScriptType)> segments = [];
    final matches = _combinedPattern.allMatches(text);
    ScriptType currentScript = ScriptType.neutral;

    for (final match in matches) {
      final String segment = match.group(0)!;
      ScriptType segmentType;

      if (_khmerRegex.hasMatch(segment)) {
        // Khmer script detected
        segmentType = ScriptType.khmer;
        currentScript = ScriptType.khmer;
      } else if (_latinRegex.hasMatch(segment)) {
        // Latin script detected
        segmentType = ScriptType.latin;
        currentScript = ScriptType.latin;
      } else if (segment.trim().isEmpty) {
        // Whitespace inherits previous script's style for consistent rendering
        segmentType = currentScript;
      } else {
        // Symbols and other characters inherit previous script's style
        // This ensures punctuation and symbols appear consistent with surrounding text
        segmentType = currentScript;
      }

      segments.add((segment, segmentType));
    }

    return segments;
  }
}

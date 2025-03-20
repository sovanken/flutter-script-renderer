import '../../core/enums/script_type.dart';

/// Utility class for detecting and segmenting text based on script types.
///
/// This class provides the core text analysis functionality for the package,
/// identifying different scripts within a single string and segmenting text
/// appropriately. It uses Unicode range detection via regular expressions to:
///
/// - Identify Khmer script characters (Unicode range U+1780 to U+17FF)
/// - Identify Thai script characters (Unicode range U+0E00 to U+0E7F)
/// - Identify Lao script characters (Unicode range U+0E80 to U+0EFF)
/// - Identify Myanmar script characters (Unicode range U+1000 to U+109F)
/// - Identify Vietnamese-specific Latin characters (with special diacritics)
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
/// String mixedText = 'English text និងអក្សរខ្មែរ และข้อความไทย mixed together';
/// var segments = ScriptDetector.splitByScript(mixedText);
/// // Result segments with appropriate script types
/// ```
class ScriptDetector {
  /// Regular expression for matching Khmer script Unicode range.
  ///
  /// This pattern captures characters in the Khmer Unicode block (U+1780 to U+17FF),
  /// which includes all standard Khmer consonants, vowels, and diacritics.
  static final RegExp _khmerRegex = RegExp(r'[\u1780-\u17FF]+');

  /// Regular expression for matching Thai script Unicode range.
  ///
  /// This pattern captures characters in the Thai Unicode block (U+0E00 to U+0E7F),
  /// which includes all Thai consonants, vowels, tone marks, and diacritics.
  static final RegExp _thaiRegex = RegExp(r'[\u0E00-\u0E7F]+');

  /// Regular expression for matching Lao script Unicode range.
  ///
  /// This pattern captures characters in the Lao Unicode block (U+0E80 to U+0EFF),
  /// which includes all Lao consonants, vowels, tone marks, and diacritics.
  static final RegExp _laoRegex = RegExp(r'[\u0E80-\u0EFF]+');

  /// Regular expression for matching Myanmar script Unicode range.
  ///
  /// This pattern captures characters in the Myanmar Unicode block (U+1000 to U+109F),
  /// which includes all Myanmar consonants, vowels, and diacritics.
  static final RegExp _myanmarRegex = RegExp(r'[\u1000-\u109F]+');

  /// Regular expression for matching Vietnamese-specific characters.
  ///
  /// This pattern captures Vietnamese-specific Latin characters with diacritics
  /// which are primarily found in the Latin Extended Additional block (U+1E00 to U+1EFF).
  /// It focuses on characters unique to Vietnamese like ă, â, ê, ô, ơ, ư, đ and their
  /// combinations with tone marks.
  static final RegExp _vietnameseRegex = RegExp(
      r'[\u00C0-\u00C3\u00C8-\u00CA\u00CC-\u00CD\u00D2-\u00D5\u00D9-\u00DA\u00DD'
      r'\u00E0-\u00E3\u00E8-\u00EA\u00EC-\u00ED\u00F2-\u00F5\u00F9-\u00FA\u00FD\u00FC'
      r'\u0102-\u0103\u0110-\u0111\u0128-\u0129\u0168-\u0169\u01A0-\u01A1\u01AF-\u01B0'
      r'\u1EA0-\u1EF9]+');

  /// Regular expression for matching Latin script (alphanumeric characters).
  ///
  /// This pattern captures standard Latin characters (a-z, A-Z) and Arabic numerals (0-9),
  /// covering most Western European languages that use the Latin alphabet.
  static final RegExp _latinRegex = RegExp(r'[a-zA-Z0-9]+');

  /// Combined pattern to match all possible text segments across all supported scripts.
  ///
  /// This comprehensive regular expression captures:
  /// 1. Sequences of Khmer characters
  /// 2. Sequences of Thai characters
  /// 3. Sequences of Lao characters
  /// 4. Sequences of Myanmar characters
  /// 5. Sequences of Vietnamese-specific characters
  /// 6. Sequences of Latin characters and digits
  /// 7. Sequences of whitespace
  /// 8. Sequences of other characters (symbols, punctuation, etc.)
  ///
  /// This pattern ensures complete text coverage with no unmatched characters,
  /// allowing the entire input string to be properly segmented.
  static final RegExp _combinedPattern = RegExp(
      r'[\u1780-\u17FF]+|[\u0E00-\u0E7F]+|[\u0E80-\u0EFF]+|[\u1000-\u109F]+|'
      r'[\u00C0-\u00C3\u00C8-\u00CA\u00CC-\u00CD\u00D2-\u00D5\u00D9-\u00DA\u00DD'
      r'\u00E0-\u00E3\u00E8-\u00EA\u00EC-\u00ED\u00F2-\u00F5\u00F9-\u00FA\u00FD\u00FC'
      r'\u0102-\u0103\u0110-\u0111\u0128-\u0129\u0168-\u0169\u01A0-\u01A1\u01AF-\u01B0'
      r'\u1EA0-\u1EF9]+|'
      r'[a-zA-Z0-9]+|\s+|[^\u1780-\u17FF\u0E00-\u0E7F\u0E80-\u0EFF\u1000-\u109F'
      r'\u00C0-\u00C3\u00C8-\u00CA\u00CC-\u00CD\u00D2-\u00D5\u00D9-\u00DA\u00DD'
      r'\u00E0-\u00E3\u00E8-\u00EA\u00EC-\u00ED\u00F2-\u00F5\u00F9-\u00FA\u00FD\u00FC'
      r'\u0102-\u0103\u0110-\u0111\u0128-\u0129\u0168-\u0169\u01A0-\u01A1\u01AF-\u01B0'
      r'\u1EA0-\u1EF9a-zA-Z0-9\s]+');

  /// Private constructor to prevent instantiation.
  ///
  /// This class provides only static utility methods and should not be instantiated.
  ScriptDetector._();

  /// Detects the script type of a given text segment.
  ///
  /// This method analyzes a text segment and determines its primary script type
  /// based on Unicode character ranges. It returns one of the supported script types:
  /// - [ScriptType.khmer] if Khmer characters are detected
  /// - [ScriptType.thai] if Thai characters are detected
  /// - [ScriptType.lao] if Lao characters are detected
  /// - [ScriptType.myanmar] if Myanmar characters are detected
  /// - [ScriptType.vietnamese] if Vietnamese-specific characters are detected
  /// - [ScriptType.latin] if Latin characters are detected
  /// - [ScriptType.neutral] if only neutral characters (spaces, symbols) are present
  ///
  /// If a segment contains characters from multiple scripts, detection follows
  /// a priority order: Khmer, Thai, Lao, Myanmar, Vietnamese, and then Latin.
  ///
  /// Parameters:
  /// - [text]: The text segment to analyze
  ///
  /// Returns the detected [ScriptType] for the text segment.
  ///
  /// Example:
  /// ```dart
  /// ScriptType type = ScriptDetector.detectScriptType('Hello');     // Returns ScriptType.latin
  /// ScriptType type = ScriptDetector.detectScriptType('សួស្តី');     // Returns ScriptType.khmer
  /// ScriptType type = ScriptDetector.detectScriptType('สวัสดี');     // Returns ScriptType.thai
  /// ScriptType type = ScriptDetector.detectScriptType('ສະບາຍດີ');    // Returns ScriptType.lao
  /// ScriptType type = ScriptDetector.detectScriptType('မင်္ဂလာပါ');  // Returns ScriptType.myanmar
  /// ScriptType type = ScriptDetector.detectScriptType('Xin chào');  // Returns ScriptType.vietnamese
  /// ScriptType type = ScriptDetector.detectScriptType('!@#$');      // Returns ScriptType.neutral
  /// ```
  static ScriptType detectScriptType(String text) {
    if (_khmerRegex.hasMatch(text)) {
      return ScriptType.khmer;
    } else if (_thaiRegex.hasMatch(text)) {
      return ScriptType.thai;
    } else if (_laoRegex.hasMatch(text)) {
      return ScriptType.lao;
    } else if (_myanmarRegex.hasMatch(text)) {
      return ScriptType.myanmar;
    } else if (_vietnameseRegex.hasMatch(text)) {
      return ScriptType.vietnamese;
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
  /// var result = ScriptDetector.splitByScript('Hello សួស្តី สวัสดี!');
  /// // Returns segments with appropriate script types
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
      } else if (_thaiRegex.hasMatch(segment)) {
        // Thai script detected
        segmentType = ScriptType.thai;
        currentScript = ScriptType.thai;
      } else if (_laoRegex.hasMatch(segment)) {
        // Lao script detected
        segmentType = ScriptType.lao;
        currentScript = ScriptType.lao;
      } else if (_myanmarRegex.hasMatch(segment)) {
        // Myanmar script detected
        segmentType = ScriptType.myanmar;
        currentScript = ScriptType.myanmar;
      } else if (_vietnameseRegex.hasMatch(segment)) {
        // Vietnamese-specific characters detected
        segmentType = ScriptType.vietnamese;
        currentScript = ScriptType.vietnamese;
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

/// Enum representing different script types for text rendering and style application.
///
/// This enum defines the script categories recognized by the Flutter Script Renderer
/// package's text analysis system. Each value corresponds to a distinct writing system
/// or character category that requires specific styling considerations.
///
/// The script type classification is used throughout the package to:
/// - Determine appropriate font families and fallbacks
/// - Apply script-specific styling properties
/// - Guide text segmentation and rendering decisions
/// - Support proper typographic handling of mixed-script text
///
/// Text is analyzed and classified into these script types using the [ScriptDetector] class,
/// which examines Unicode character ranges to identify the appropriate script type.
enum ScriptType {
  /// Khmer script used in the Cambodian language.
  ///
  /// This script type represents the Khmer (ខ្មែរ) writing system used in Cambodia.
  /// It covers Unicode code points from U+1780 to U+17FF and requires fonts specifically
  /// designed for Khmer script rendering.
  ///
  /// Examples of Khmer script characters:
  /// - អក្សរ (ak'sar, meaning "letter" or "character")
  /// - កខគឃង (the first five consonants of the Khmer alphabet)
  /// - ក្រុង (krong, meaning "city")
  ///
  /// Khmer text requires specific typographic considerations including appropriate
  /// baseline alignment, glyph positioning, and font selection.
  khmer,

  /// Latin-based scripts used in many Western and international languages.
  ///
  /// This script type represents the Latin alphabet and its extensions used in languages
  /// such as English, French, Spanish, Vietnamese, and many others. It covers standard
  /// Latin characters (a-z, A-Z) and Arabic numerals (0-9).
  ///
  /// Examples of Latin script characters:
  /// - Basic Latin alphabet: a-z, A-Z
  /// - Numerals: 0-9
  /// - Latin script with diacritics: é, ü, ñ, ç
  ///
  /// Latin script is widely supported by most fonts, but optimal typography may
  /// still require script-specific consideration for features like letter spacing.
  latin,

  /// Neutral characters not specific to any particular script.
  ///
  /// This category includes characters that don't belong to a specific script
  /// system, such as punctuation, spaces, symbols, and special characters.
  /// These characters typically inherit styling from the surrounding text.
  ///
  /// Examples of neutral characters:
  /// - Punctuation: .,!?;:'"()[]{}
  /// - Spaces and control characters
  /// - Mathematical symbols: +−×÷=≠><≥≤
  /// - General symbols: ©®™%&@$€£¥#*
  ///
  /// Neutral characters are associated with the preceding script context
  /// to ensure consistent text rendering and styling within text segments.
  neutral
}

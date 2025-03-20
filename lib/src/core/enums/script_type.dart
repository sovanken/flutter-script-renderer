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

  /// Thai script used in the Thai language.
  ///
  /// This script type represents the Thai (ไทย) writing system used in Thailand.
  /// It covers Unicode code points from U+0E00 to U+0E7F and requires fonts
  /// specifically designed for Thai script rendering.
  ///
  /// Examples of Thai script characters:
  /// - กขคง (the first four consonants of the Thai alphabet)
  /// - สวัสดี (sawatdee, a greeting meaning "hello")
  /// - อักษร (akson, meaning "letter" or "character")
  ///
  /// Thai text requires specific typographic considerations including appropriate
  /// baseline alignment, tone mark positioning, and proper handling of vowel marks
  /// that can appear above, below, or to the sides of consonants.
  thai,

  /// Lao script used in the Lao language.
  ///
  /// This script type represents the Lao (ລາວ) writing system used in Laos.
  /// It covers Unicode code points from U+0E80 to U+0EFF and requires fonts
  /// specifically designed for Lao script rendering.
  ///
  /// Examples of Lao script characters:
  /// - ກຂຄງ (the first four consonants of the Lao alphabet)
  /// - ສະບາຍດີ (sabai di, a greeting meaning "hello")
  /// - ຕົວອັກສອນ (tua akson, meaning "letter" or "character")
  ///
  /// Lao text requires specific typographic considerations including proper
  /// rendering of tone marks, vowel positioning, and appropriate line height
  /// to accommodate stacked diacritics.
  lao,

  /// Myanmar script used in the Burmese language.
  ///
  /// This script type represents the Myanmar/Burmese (မြန်မာ) writing system.
  /// It covers Unicode code points from U+1000 to U+109F and requires fonts
  /// specifically designed for Myanmar script rendering.
  ///
  /// Examples of Myanmar script characters:
  /// - ကခဂဃင (the first five consonants of the Myanmar alphabet)
  /// - မင်္ဂလာပါ (mingalar par, a greeting meaning "hello")
  /// - စာလုံး (sa lone, meaning "letter" or "character")
  ///
  /// Myanmar text requires specific typographic considerations including
  /// complex glyph positioning, stacked consonants, and proper rendering
  /// of medial consonants and vowel signs.
  myanmar,

  /// Vietnamese script, which uses Latin-based characters with additional diacritics.
  ///
  /// While Vietnamese uses a Latin-based script, it has unique diacritical marks
  /// and requires specific font considerations. It includes characters in the
  /// Latin Extended Additional Unicode block (U+1E00–U+1EFF).
  ///
  /// Examples of Vietnamese script characters:
  /// - ăâêôơư (vowels with diacritics)
  /// - đ (consonant with bar)
  /// - áàảãạ (vowels with tone marks)
  /// - Xin chào (greeting meaning "hello")
  ///
  /// Vietnamese text requires fonts that properly support its specific
  /// combination of diacritical marks, including both tone marks and
  /// character modifiers that can appear simultaneously.
  vietnamese,

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

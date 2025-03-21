/// A Flutter package for automatic detection and rendering of multilingual text with script-specific styling.
///
/// The Flutter Script Renderer package provides a robust solution for displaying text
/// containing multiple writing systems (scripts) within a single string. It automatically
/// detects different script segments and applies appropriate styling to each, ensuring
/// optimal typography for multilingual content.
///
/// ## Key Components
///
/// * [ScriptType]: Enum defining supported script types (Khmer, Thai, Lao, Myanmar, Vietnamese, Latin, neutral)
/// * [LocalizedRichText]: The primary widget for rendering multi-script text
/// * [FontRegistry]: Central registry of font families for different scripts
/// * Extension methods:
///   - `String.toLocalizedText()`: Convert any string to a properly styled widget
///   - `BuildContext.localizedText()`: Create theme-aware multilingual text
///
/// ## Features
///
/// * Automatic script detection within text strings
/// * Script-specific font and style application for Southeast Asian scripts
/// * Comprehensive styling customization per script type
/// * Performance optimized for mixed script rendering
/// * Extension methods for simplified usage
/// * Support for Khmer, Thai, Lao, Myanmar, Vietnamese, and Latin scripts
///
/// ## Basic Usage
///
/// ```dart
/// LocalizedRichText(
///   text: 'English text និងអក្សរខ្មែរ และภาษาไทย ສະບາຍດີ မင်္ဂလာပါ Tiếng Việt',
///   fontSize: 16,
///   khmerColor: Colors.red,
///   thaiColor: Colors.blue,
///   latinFontFamily: FontRegistry.latinPoppins,
///   thaiFontFamily: FontRegistry.thaiSarabun,
/// )
/// ```
///
/// ## Extension Method Usage
///
/// ```dart
/// 'English text និងអក្សរខ្មែរ และข้อความไทย'.toLocalizedText(
///   fontSize: 16,
///   color: Colors.blue,
///   khmerFontFamily: FontRegistry.khmerBattambang,
///   thaiFontFamily: FontRegistry.thaiSarabun,
/// )
/// ```
///
/// This package is particularly valuable for applications serving multilingual
/// communities or regions where text commonly combines different scripts, such as
/// Cambodia, Thailand, Laos, Myanmar, Vietnam, and other Southeast Asian countries
/// where multiple scripts may be used together.
library flutter_script_renderer;

// Export public API
export 'src/core/enums/script_type.dart';
export 'src/widgets/localized_rich_text.dart';
export 'src/styles/localized_text_style.dart';
export 'src/fonts/font_registry.dart';
export 'src/scripts/script_registry.dart';
export 'src/core/models/text_style_properties.dart';
export 'src/extensions.dart';

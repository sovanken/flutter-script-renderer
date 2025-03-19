# Flutter Script Renderer

A comprehensive Flutter package that enables seamless multilingual text rendering with intelligent script detection and styling capabilities. The package automatically identifies different scripts within a single text string and applies appropriate font families and styling properties to each segment. Currently optimized for Khmer and Latin scripts, it provides a robust foundation for proper typographic rendering of mixed-script content with plans for supporting additional languages and scripts in future releases.
Flutter Script Renderer solves the common challenge of displaying text that contains multiple writing systems in a single string, ensuring that each script maintains its typographic integrity. This is particularly valuable for applications serving multilingual communities or regions where text commonly combines different scripts, such as Cambodia, and other Southeast Asian countries.


## Features

- Automatic script detection within text strings
- Script-specific font and style application
- Customizable styling for each supported script type
- Extension methods for simplified usage
- Performance optimized for mixed script rendering
- Support for all text styling properties available in Flutter

## Cross-Platform Support

- ✅ Android
- ✅ Web 
- ✅ Desktop
- ✅ iOS 

## Installation

Add this package to your pubspec.yaml:

```yaml
dependencies:
  flutter_script_renderer: ^0.1.2
```

Then run the following command:

```bash
flutter pub get
```

Import the package in your Dart code:

```dart
import 'package:flutter_script_renderer/flutter_script_renderer.dart';
```

## Usage

### Basic Usage

```dart
LocalizedRichText(
  text: 'English text និងអក្សរខ្មែរ in the same string.',
  fontSize: 18,
)
```

### Script-Specific Styling

Apply different styles to different scripts within the same text:

```dart
LocalizedRichText(
  text: 'Blue Latin text អក្សរខ្មែរពណ៌ក្រហម with different colors.',
  fontSize: 16,
  color: Colors.blue,
  khmerColor: Colors.red,
  khmerFontFamily: FontRegistry.khmerBattambang,
  latinFontFamily: FontRegistry.latinPoppins,
)
```

### Using Extension Methods

For more concise code, use the provided extension methods:

```dart
// String extension
'This uses a string extension អក្សរខ្មែរ for simplicity.'.toLocalizedText(
  fontSize: 16,
  color: Colors.purple,
)

// BuildContext extension (theme-aware)
context.localizedText(
  'This uses theme styling ជាមួយនឹងស្តាយពីដើម with context extension.',
  fontSize: 16,
)
```

## Technical Requirements

- Flutter SDK: 3.0.0 or higher
- Dart SDK: >=3.0.0 <4.0.0

## About the Author

Created and maintained by Sovanken.

## License

This package is released under the MIT License. See the LICENSE file for details.
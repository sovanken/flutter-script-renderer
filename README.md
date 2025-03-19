# Flutter Script Renderer

A Flutter package for automatic rendering of multilingual text with proper script-specific styling, currently supporting Khmer and Latin scripts with extensibility for additional languages.

## Features

- Automatic script detection within text strings
- Script-specific font and style application
- Customizable styling for each supported script type
- Extension methods for simplified usage
- Performance optimized for mixed script rendering
- Support for all text styling properties available in Flutter

## Installation

Add this package to your pubspec.yaml:

```yaml
dependencies:
  flutter_script_renderer: ^0.1.0
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
  fontSize: 18,
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
  fontSize: 18,
  color: Colors.purple,
)

// BuildContext extension (theme-aware)
context.localizedText(
  'This uses theme styling ជាមួយនឹងស្តាយពីថីម with context extension.',
  fontSize: 18,
)
```

## Font Configuration

To use custom fonts with this package, add the font assets to your application's pubspec.yaml:

```yaml
flutter:
  fonts:
    # Khmer fonts
    - family: Battambang
      fonts:
        - asset: assets/fonts/km/Battambang-Regular.ttf
        - asset: assets/fonts/km/Battambang-Bold.ttf
          weight: 700
    
    - family: Siemreap
      fonts:
        - asset: assets/fonts/km/Siemreap-Regular.ttf
        
    # Latin fonts
    - family: Roboto
      fonts:
        - asset: assets/fonts/en/Roboto-Regular.ttf
        - asset: assets/fonts/en/Roboto-Bold.ttf
          weight: 700
          
    - family: Poppins
      fonts:
        - asset: assets/fonts/en/Poppins-Regular.ttf
```

Organize your font files in a structured directory:

```
assets/
├── fonts/
│   ├── km/
│   │   ├── Battambang-Regular.ttf
│   │   ├── Siemreap-Regular.ttf
│   │   └── ...
│   └── en/
│       ├── Roboto-Regular.ttf
│       ├── Poppins-Regular.ttf
│       └── ...
```

## Additional Information

### Supported Flutter Versions

- Supports Flutter 3.0.0 and above
- Dart SDK: >=3.0.0 <4.0.0

### License

This package is released under the MIT License. See the LICENSE file for details.

### Author

Created and maintained by Sovanken.
# Flutter Script Renderer

A comprehensive Flutter package that enables seamless multilingual text rendering with intelligent script detection and styling capabilities. The package automatically identifies different scripts within a single text string and applies appropriate font families and styling properties to each segment. Optimized for Southeast Asian scripts including Khmer, Thai, Lao, Myanmar, Vietnamese, and Latin, it provides a robust foundation for proper typographic rendering of mixed-script content.

Flutter Script Renderer solves the common challenge of displaying text that contains multiple writing systems in a single string, ensuring that each script maintains its typographic integrity. This is particularly valuable for applications serving multilingual communities or regions where text commonly combines different scripts, such as Cambodia, Thailand, Laos, Myanmar, Vietnam, and other Southeast Asian countries.

## Features

- Automatic script detection for Khmer, Thai, Lao, Myanmar, Vietnamese, and Latin texts
- Script-specific font and style application for each language
- Comprehensive styling customization per script type
- Extension methods for simplified usage
- Performance optimized for mixed script rendering
- Support for all text styling properties available in Flutter
- Proper handling of Southeast Asian scripts with complex typography needs

## Cross-Platform Support

- ✅ Android
- ✅ Web 
- ✅ Desktop
- ✅ iOS 

## Installation

Add this package to your pubspec.yaml:

```yaml
dependencies:
  flutter_script_renderer: ^0.1.5
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
  text: 'English text និងអក្សរខ្មែរ และข้อความไทย ແລະຕົວອັກສອນລາວ နှင့် မြန်မာစာ và văn bản tiếng Việt in the same string.',
  fontSize: 18,
)
```

### Script-Specific Styling

Apply different styles to different scripts within the same text:

```dart
LocalizedRichText(
  text: 'Blue Latin text អក្សរខ្មែរពណ៌ក្រហម ข้อความไทยสีเขียว ຂໍ້ຄວາມລາວສີຟ້າ မြန်မာစာအဝါရောင် văn bản tiếng Việt màu cam with different colors.',
  fontSize: 16,
  color: Colors.blue,
  khmerColor: Colors.red,
  thaiColor: Colors.green,
  laoColor: Colors.lightBlue,
  myanmarColor: Colors.amber,
  vietnameseColor: Colors.orange,
  khmerFontFamily: FontRegistry.khmerBattambang,
  thaiFontFamily: FontRegistry.thaiSarabun,
  laoFontFamily: FontRegistry.laoPhetsarath,
  myanmarFontFamily: FontRegistry.myanmarPadauk,
  vietnameseFontFamily: FontRegistry.vietnameseBeVietnamPro,
  latinFontFamily: FontRegistry.latinPoppins,
)
```

### Using Extension Methods

For more concise code, use the provided extension methods:

```dart
// String extension
'This uses a string extension អក្សរខ្មែរ และข้อความไทย ແລະຕົວອັກສອນລາວ နှင့် မြန်မာစာ và văn bản tiếng Việt for simplicity.'.toLocalizedText(
  fontSize: 16,
  color: Colors.purple,
)

// BuildContext extension (theme-aware)
context.localizedText(
  'This uses theme styling ជាមួយនឹងរចនាបទ ด้วยรูปแบบจากธีม ດ້ວຍຮູບແບບ နှင့် ပုံစံဒီဇိုင်း với kiểu dáng with context extension.',
  fontSize: 16,
)
```

### Font Families

For each supported script, the package provides a set of optimized font families:

```dart
// Khmer fonts
FontRegistry.khmerBattambang
FontRegistry.khmerKoulen
FontRegistry.khmerMoul
FontRegistry.khmerNotoSerifKhmer
FontRegistry.khmerSiemreap
FontRegistry.khmerSuwannaphum

// Thai fonts
FontRegistry.thaiChakraPetch
FontRegistry.thaiKanit
FontRegistry.thaiMitr
FontRegistry.thaiNotoSansThai
FontRegistry.thaiPrompt
FontRegistry.thaiSarabun
FontRegistry.thaiTaviraj

// Lao fonts
FontRegistry.laoNotoSansLao
FontRegistry.laoNotoSansLaoLooped
FontRegistry.laoNotoSerifLao
FontRegistry.laoPhetsarath

// Myanmar fonts
FontRegistry.myanmarNotoSansMyanmar
FontRegistry.myanmarNotoSerifMyanmar
FontRegistry.myanmarPadauk

// Vietnamese fonts
FontRegistry.vietnameseBeVietnamPro
FontRegistry.vietnameseLora
FontRegistry.vietnameseMerriweather
FontRegistry.vietnameseMerriweatherSans

// Latin fonts
FontRegistry.latinIBMPlexSans
FontRegistry.latinInter
FontRegistry.latinLato
// ... and more
```

## Technical Requirements

- Flutter SDK: 3.0.0 or higher
- Dart SDK: >=3.0.0 <4.0.0

## About the Author

Created and maintained by Sovanken.

## License

This package is released under the MIT License. See the LICENSE file for details.
# Changelog

## 0.1.0 - March 20, 2025

### Features
* Initial release of Flutter Script Renderer package
* Full support for Khmer and Latin script detection and rendering
* Intelligent automatic script detection using Unicode range analysis
* Comprehensive script-specific styling capability system

### Components
* `LocalizedRichText` widget for multilingual text rendering
* `ScriptDetector` utility for accurate script identification
* `FontRegistry` for centralized font management
* Extension methods on String and BuildContext for simplified usage

### Technical Details
* Performance optimized for mixed script rendering with minimal overhead
* Full customization of font properties (family, size, weight, style) per script type
* Support for all standard TextStyle properties with script-specific overrides
* Designed for extensibility to additional languages in future releases

### Documentation
* Comprehensive README with usage examples
* Fully documented public API
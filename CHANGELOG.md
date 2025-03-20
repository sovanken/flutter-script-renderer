# Changelog

## 0.1.5

### Major Enhancements
* Added support for multiple Southeast Asian scripts:
  * Thai script with full typography support
  * Lao script with proper character rendering
  * Myanmar script with complex glyph handling
  * Vietnamese with diacritics support
* Expanded font collection with quality typefaces for each language
* Enhanced script detection to identify all supported scripts accurately
* Updated ScriptType enum to include new script categories

### API Additions
* Added script-specific styling properties for all new languages
* Expanded FontRegistry with specialized font collections for each script
* Enhanced extension methods to support all new scripts
* Updated ScriptRegistry to handle multilingual script selection

### Documentation
* Comprehensive documentation for all supported scripts
* Updated README with multilingual examples
* Improved API documentation with script-specific styling guides
* Added grammatically correct examples in all supported languages

### Technical Improvements
* Optimized script detection algorithms for Southeast Asian languages
* Enhanced font fallback chains for better cross-script compatibility
* Improved performance when handling complex multilingual text

## 0.1.4

### Example Additions
* Added comprehensive example application with multilingual demonstrations
* Created well-structured example project with proper organization
* Included demonstrations for all key package features
* Added grammatically correct Khmer text examples
* Provided real-world mixed script scenarios
* Created example documentation and implementation guides

## 0.1.3

### Enhancements
* Reorganized font assets to follow Flutter package best practices
* Improved cross-platform compatibility with standardized asset path handling
* Enhanced documentation with multilingual text examples
* Added explicit cross-platform support indicators

### Technical Improvements
* Optimized package structure for better performance and maintainability
* Standardized font loading across package and consumer applications
* Reduced package size through improved asset organization
* Simplified implementation for package consumers

## 0.1.2

### Fixes
* Resolved font family application issues in package context
* Added proper package reference to TextStyle objects for font rendering
* Improved handling of font assets for package consumers

### Technical Improvements
* Fixed circular dependencies in style handler classes
* Enhanced font fallback system for better cross-platform compatibility
* Optimized font loading mechanism for package-provided fonts

## 0.1.1
### Improvements
* Enhanced font handling and asset management
* Improved documentation for font usage
* Fixed issues with font family application

## 0.1.0

### Features
* Initial release of Flutter Script Renderer
* Support for Khmer and Latin script detection and rendering
* Automatic script detection within text strings
* Script-specific styling capabilities
* Customizable font and style properties for each script type
* Extension methods for simplified usage
* Performance optimized for mixed script rendering
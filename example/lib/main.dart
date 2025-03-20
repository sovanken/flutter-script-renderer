import 'package:flutter/material.dart';
import 'package:flutter_script_renderer/flutter_script_renderer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Script Renderer Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ScriptRendererDemo(),
    );
  }
}

class ScriptRendererDemo extends StatelessWidget {
  const ScriptRendererDemo({super.key});

  static const String longMixedText =
      'Learning multiple languages គឺជាជំនាញដ៏មានតម្លៃមួយ in today\'s interconnected world. '
      'ការប្រើប្រាស់បច្ចេកវិទ្យាទំនើប has made communication across languages easier than ever before. '
      'Cross-cultural understanding អាចជួយបង្កើនចំណេះដឹងនិងការគោរពគ្នាទៅវិញទៅមករវាងប្រជាជននៅជុំវិញពិភពលោក through meaningful connections. '
      'Modern applications នាពេលបច្ចុប្បន្នត្រូវការការគាំទ្រ for multiple scripts និងភាសាជាច្រើន to serve diverse global audiences. '
      'The Flutter framework ផ្តល់នូវឧបករណ៍ដ៏មានប្រសិទ្ធភាពជាច្រើន for building truly international applications.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Script Renderer Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Mixed Script Text',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const LocalizedRichText(
                text:
                    'This is English text និងនេះគឺជាអក្សរខ្មែរ in the same string.',
                fontSize: 16,
                color: Colors.black),
            const SizedBox(height: 24),
            const Text(
              'Script-Specific Styling',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const LocalizedRichText(
              text:
                  'Blue Latin text អក្សរខ្មែរមានពណ៌ក្រហម with different colors.',
              fontSize: 16,
              color: Colors.blue,
              khmerColor: Colors.red,
              khmerFontFamily: FontRegistry.khmerBattambang,
              latinFontFamily: FontRegistry.latinPoppins,
            ),
            const SizedBox(height: 24),
            const Text(
              'Different Font Sizes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const LocalizedRichText(
              text:
                  'Normal size Latin script អក្សរខ្មែរមានទំហំធំជាង with larger Khmer text.',
              fontSize: 14,
              khmerFontSize: 20,
              khmerFontFamily: FontRegistry.khmerNotoSerifKhmer,
              color: Colors.black,
            ),
            const SizedBox(height: 24),
            const Text(
              'Using String Extension',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            'This text uses the string extension ជាមួយអក្សរខ្មែរ for simplicity.'
                .toLocalizedText(
              fontSize: 16,
              color: Colors.purple,
            ),
            const SizedBox(height: 24),
            const Text(
              'Using BuildContext Extension',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Builder(
              builder: (context) {
                return context.localizedText(
                    'This uses theme styling ជាមួយនឹងរចនាបទពីប្រធានបទ with context extension.',
                    fontSize: 16,
                    color: Colors.black);
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Long Mixed Text Example',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const LocalizedRichText(
              text: longMixedText,
              fontSize: 16,
              height: 1.5,
              color: Colors.black,
              khmerFontFamily: FontRegistry.khmerBattambang,
              latinFontFamily: FontRegistry.latinPoppins,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

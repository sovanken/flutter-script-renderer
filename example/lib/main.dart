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
      'Learning multiple languages គឺជាជំនាញដ៏មានតម្លៃមួយ และเป็นทักษะที่มีคุณค่า ເປັນທັກສະທີ່ມີຄຸນຄ່າ အဖိုးတန်ကျွမ်းကျင်မှုတစ်ခုဖြစ်သည် là một kỹ năng có giá trị in today\'s interconnected world. '
      'ការប្រើប្រាស់បច្ចេកវិទ្យាទំនើប การใช้เทคโนโลยีสมัยใหม่ ການນໍາໃຊ້ເຕັກໂນໂລຊີທັນສະໄໝ ခေတ်မီနည်းပညာကို အသုံးပြုခြင်း việc sử dụng công nghệ hiện đại has made communication across languages easier than ever before. '
      'Cross-cultural understanding អាចជួយបង្កើនចំណេះដឹង สามารถเพิ่มความรู้ ສາມາດເພີ່ມຄວາມຮູ້ ဗဟုသုတနှင့်လေးစားမှုကို တိုးမြှင့်နိုင်သည် có thể tăng cường kiến thức và sự tôn trọng between people around the world. '
      'Modern applications នាពេលបច្ចុប្បន្នត្រូវការការគាំទ្រ ต้องการการสนับสนุน ຈໍາເປັນຕ້ອງຮອງຮັບ လိုအပ်သော ပံ့ပိုးမှုရှိရန် လိုအပ်သည် cần hỗ trợ for multiple scripts និងភាសាជាច្រើន และหลายภาษา ແລະຫຼາຍພາສາ နှင့် ဘာသာစကားများစွာ và nhiều ngôn ngữ to serve diverse global audiences. '
      'The Flutter framework ផ្តល់នូវឧបករណ៍ដ៏មានប្រសិទ្ធភាពជាច្រើន ให้เครื่องมือที่มีประสิทธิภาพมากมาย ໃຫ້ເຄື່ອງມືທີ່ມີປະສິດທິພາບຫຼາຍ ထိရောက်သော ကိရိယာများစွာကို ပေးဆောင်သည် cung cấp nhiều công cụ hiệu quả for building truly international applications.';

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
                  'This is English text និងនេះគឺជាអក្សរខ្មែរ และนี่คือข้อความภาษาไทย ແລະນີ້ແມ່ນຕົວອັກສອນລາວ နှင့် ဤသည်မှာ မြန်မာစာဖြစ်သည် và đây là văn bản tiếng Việt in the same string.',
              fontSize: 16,
              color: Colors.black,
            ),
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
                  'Blue Latin text អក្សរខ្មែរមានពណ៌ក្រហម ตัวอักษรภาษาไทยมีสีเขียว ຕົວອັກສອນລາວມີສີຟ້າ မြန်မာစာသည် အဝါရောင်ဖြစ်သည် văn bản tiếng Việt có màu cam with different colors.',
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
            ),
            const SizedBox(height: 24),
            const Text(
              'Different Font Families',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const LocalizedRichText(
              text:
                  'Poppins Latin script អក្សរខ្មែរ​ជា​ពុម្ពអក្សរ​បាត់ដំបង ข้อความไทยใช้ฟอนต์พรอมต์ ຂໍ້ຄວາມລາວໃຊ້ຟັອນເພັດຊາລາດ မြန်မာစာသည် ပဒေါက်ဖောင့်ဖြစ်သည် văn bản Việt sử dụng phông chữ Be Vietnam Pro',
              fontSize: 16,
              khmerFontFamily: FontRegistry.khmerBattambang,
              thaiFontFamily: FontRegistry.thaiPrompt,
              laoFontFamily: FontRegistry.laoPhetsarath,
              myanmarFontFamily: FontRegistry.myanmarPadauk,
              vietnameseFontFamily: FontRegistry.vietnameseBeVietnamPro,
              latinFontFamily: FontRegistry.latinPoppins,
              color: Colors.black,
            ),
            const SizedBox(height: 24),
            const Text(
              'Different Font Sizes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const LocalizedRichText(
              text:
                  'Normal size Latin script អក្សរខ្មែរមានទំហំធំជាង ตัวอักษรไทยมีขนาดใหญ่มาก ຕົວອັກສອນລາວມີຂະໜາດນ້ອຍ မြန်မာစာအရွယ်အစား ကြီးမားသည် chữ Việt nhỏ hơn with different sizes.',
              fontSize: 14,
              khmerFontSize: 20,
              thaiFontSize: 22,
              laoFontSize: 12,
              myanmarFontSize: 18,
              vietnameseFontSize: 10,
              khmerFontFamily: FontRegistry.khmerNotoSerifKhmer,
              thaiFontFamily: FontRegistry.thaiSarabun,
              laoFontFamily: FontRegistry.laoPhetsarath,
              myanmarFontFamily: FontRegistry.myanmarPadauk,
              vietnameseFontFamily: FontRegistry.vietnameseBeVietnamPro,
              color: Colors.black,
            ),
            const SizedBox(height: 24),
            const Text(
              'Using String Extension',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            'This text uses the string extension ជាមួយអក្សរខ្មែរ พร้อมข้อความไทย ພ້ອມກັບຕົວອັກສອນລາວ မြန်မာစာနှင့်အတူ với chữ tiếng Việt for simplicity.'
                .toLocalizedText(
              fontSize: 16,
              color: Colors.purple,
              khmerFontFamily: FontRegistry.khmerBattambang,
              thaiFontFamily: FontRegistry.thaiSarabun,
              laoFontFamily: FontRegistry.laoPhetsarath,
              myanmarFontFamily: FontRegistry.myanmarPadauk,
              vietnameseFontFamily: FontRegistry.vietnameseBeVietnamPro,
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
                  'This uses theme styling ជាមួយនឹងរចនាបទពីប្រធានបទ ด้วยรูปแบบจากธีม ດ້ວຍຮູບແບບຈາກທີມ ခေါင်းစဉ်ပုံစံဖြင့် với kiểu dáng từ chủ đề with context extension.',
                  fontSize: 16,
                  color: Colors.black,
                  khmerFontFamily: FontRegistry.khmerBattambang,
                  thaiFontFamily: FontRegistry.thaiSarabun,
                  laoFontFamily: FontRegistry.laoPhetsarath,
                  myanmarFontFamily: FontRegistry.myanmarPadauk,
                  vietnameseFontFamily: FontRegistry.vietnameseBeVietnamPro,
                );
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
              thaiFontFamily: FontRegistry.thaiSarabun,
              laoFontFamily: FontRegistry.laoPhetsarath,
              myanmarFontFamily: FontRegistry.myanmarPadauk,
              vietnameseFontFamily: FontRegistry.vietnameseBeVietnamPro,
              latinFontFamily: FontRegistry.latinPoppins,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

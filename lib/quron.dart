import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qur\'on',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.notoSansTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: QuranHomePage(
        isDarkMode: isDarkMode,
        toggleTheme: toggleTheme,
      ),
    );
  }
}

class QuranHomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  QuranHomePage({required this.isDarkMode, required this.toggleTheme});

  @override
  _QuranHomePageState createState() => _QuranHomePageState();
}

class _QuranHomePageState extends State<QuranHomePage> {
  List<dynamic> surahs = [];
  Map<int, bool> surahLanguageToggle = {}; // To track language toggle for each surah

  @override
  void initState() {
    super.initState();
    fetchQuranData();
  }

  Future<void> fetchQuranData() async {
    // API orqali barcha 114 surani olish
    final response = await http.get(Uri.parse('https://api.alquran.cloud/v1/quran/ar.alafasy'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        surahs = data['data']['surahs']; // Barcha suralarni olish
        surahs.forEach((surah) {
          surahLanguageToggle[surah['number']] = true; // Default to Arabic
        });
      });
    } else {
      throw Exception('Ma\'lumot yuklanmadi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qur\'on - Arabcha'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.brightness_7 : Icons.brightness_3),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: surahs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: surahs.length,
              itemBuilder: (context, index) {
                final surah = surahs[index];
                bool showArabic = surahLanguageToggle[surah['number']] ?? true;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    color: Theme.of(context).cardColor,
                    child: ExpansionTile(
                      title: Text(
                        surah['englishName'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.headlineLarge?.color,
                        ),
                      ),
                      subtitle: Text(
                        surah['name'], // Arabic name
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).textTheme.titleMedium?.color,
                        ),
                      ),
                      children: surah['ayahs'].map<Widget>((ayah) {
                        return ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    surahLanguageToggle[surah['number']] = !showArabic; // Toggle the language
                                  });
                                },
                                child: Text(
                                  showArabic ? ayah['text'] : ayah['textUzbek'] ?? "", // Toggle Arabic and Uzbek
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.amiri(
                                    fontSize: 18,
                                    color: Theme.of(context).textTheme.bodyLarge?.color,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Oyat ${ayah['numberInSurah']}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).textTheme.bodySmall?.color,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

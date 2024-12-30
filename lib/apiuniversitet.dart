 import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      home: Birinchi(),
    ),
  );
}

class Birinchi extends StatefulWidget {
  const Birinchi({super.key});

  @override
  State<Birinchi> createState() => _BirinchiState();
}

class _BirinchiState extends State<Birinchi> {
  List<String> nom = [];

  void f() async {
    final response = await http.get(
      Uri.parse("http://universities.hipolabs.com/search?country=Malaysia"),
    );
    if (response.statusCode == 200) {
      final List json = jsonDecode(response.body);
      setState(() {
        nom = json.map((b) => b['name'] as String).toList();
      });
    } else {
      throw Exception("Failed to load");
    }
  }

  @override
  void initState() {
    super.initState();
    f();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: nom.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SelectableText("University Name: ${nom[index]}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
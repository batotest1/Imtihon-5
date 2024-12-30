import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String outputText = "";

  @override
  void initState() {
    super.initState();
    _loadSavedText(); // Load saved text when app starts
  }

  Future<void> _loadSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      outputText = prefs.getString('savedText') ?? ""; // Load saved text or default to ""
    });
  }

  Future<void> _saveText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedText', text); // Save text to local storage
  }

  void _showCustomDialog() {
    TextEditingController textController = TextEditingController(text: outputText);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter something"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: "Your text",
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            IconButton(
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: () {
                setState(() {
                  outputText = textController.text; // Update the text
                });
                _saveText(outputText); // Save the text
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Text(
          outputText.isNotEmpty ? outputText : "",
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCustomDialog,
        child: Icon(Icons.edit),
      ),
    );
  }
}

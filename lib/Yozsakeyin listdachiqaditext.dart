import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SS()));
}

class SS extends StatefulWidget {
  const SS({super.key});

  @override
  State<SS> createState() => _SSState();
}

class _SSState extends State<SS> {
  List<Map<String, String>> malumotlar = [];
  String ism = '';
  String yosh = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: malumotlar.length,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // Show dialog to edit 'ism' and 'yosh'
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: Text("Ma'lumotni tahrirlash"),
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: "Ism"),
                      controller: TextEditingController(text: malumotlar[i]['ism']),
                      onChanged: (value) {
                        ism = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Yosh"),
                      controller: TextEditingController(text: malumotlar[i]['yosh']),
                      onChanged: (value) {
                        yosh = value;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(Icons.check, color: Colors.green),
                          onPressed: () {
                            setState(() {
                              malumotlar[i] = {'ism': ism, 'yosh': yosh};
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            onLongPress: () {
              // Show confirmation dialog to delete on long press
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Tanlangan ma'lumot o'chirilsinmi?"),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {
                        setState(() {
                          malumotlar.removeAt(i);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Transform(
                      transform: Matrix4.skewX(-0.3),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.blueAccent,
                        child: Text("Ism: ${malumotlar[i]['ism']}"),
                      ),
                    ),
                  ),
                  Spacer(),
                  Transform(
                    transform: Matrix4.skewX(0.3),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.greenAccent,
                      child: Text("Yosh: ${malumotlar[i]['yosh']}"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Ism"),
                  onChanged: (value) {
                    ism = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Yosh"),
                  onChanged: (value) {
                    yosh = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.check, color: Colors.green),
                      onPressed: () {
                        setState(() {
                          malumotlar.add({'ism': ism, 'yosh': yosh});
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Yangi sahifani ochish
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewPage()),
            );
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          height: 1000,
          width: 570,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1lloOAy9Q0rpS3uAdy-80eW_gH4cecL8Wyg&s"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              SizedBox(
                height: 400,
              ),
              Center(
                  child: Text(
                "Flutter",
                style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue),
              )),
            ],
          ),
        ));
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text("tasdiqlansinmi"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ikki()));
                        },
                        child: Text("ok"),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("no"),
                      ),
                    ],
                  ));
        },
        child: Text("dialog"),
      )),
    );
  }
}

class ikki extends StatefulWidget {
  const ikki({super.key});

  @override
  State<ikki> createState() => _ikkiState();
}

class _ikkiState extends State<ikki> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            "Flutter",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          floating: true,
          pinned: true,
          backgroundColor: Colors.blue,
          expandedHeight: 300,
          flexibleSpace: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTz_s3jGha6c_pH06cbG42rYhWqQzbAU15PQ&s",
            fit: BoxFit.cover,
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, index){
          return Padding(padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.blue,
            width: double.infinity,
            height: 100,
            child: Text("$index"),
          ),
          );
        },
        childCount: 50
        ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> textList = [
    "Text 1\nText 2\nText 3",
    "Text 4\nText 5\nText 6",
    "Text 7\nText 8\nText 9",
    "Text 10\nText 11\nText 12",
       "Text 13\nText 14\nText 15",
    "Text 16\nText 17\nText 18",
    "Text 19\nText 20\nText 21",
    "Text 22\nText 23\nText 24",
      "Text 25\nText 26\nText 27",
    "Text 28\nText 29\nText 30",
    "Text 31\nText 32\nText 33",
    "Text 34\nText 35\nText 36",
    "Text 37\nText 38\nText 39",
  ];

  final List<List<int>> tileSizes = [
    [3, 3],
    [1,1],
    [1,1],
    [2,1],
    [3,1],
    [2,2],
    [2,2],
    [1,1],
[2,1],
[2,2,],
[1,1],
[1,1],
[1,1],
[1,1]
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Staggered Grid Example with Text'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: StaggeredGrid.count(
            crossAxisCount: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(textList.length, (index) {
              return StaggeredGridTile.count(
                crossAxisCellCount: tileSizes[index][0],
                mainAxisCellCount: tileSizes[index][1],
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      textList[index],
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
 
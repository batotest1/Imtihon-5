import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // StaggeredGridTile uchun kerak
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Staggered Grid Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StaggeredGrid.count(
            crossAxisCount: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Container(
decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("2",
                          style: GoogleFonts.eagleLake(fontSize: 50),)),                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Container(
decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("3",
                          style: GoogleFonts.eagleLake(fontSize: 50),)),                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("4",
                          style: GoogleFonts.eagleLake(fontSize: 50),)),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Container(
 child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("5",
                          style: GoogleFonts.eagleLake(fontSize: 50),)),
                ),                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
 child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("6",
                          style: GoogleFonts.vollkorn(fontSize: 50),)),
                ),                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
 child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("7",
                          style: GoogleFonts.vollkorn(fontSize: 50),)),
                ),                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Container(
decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("1",
                          style: GoogleFonts.eagleLake(fontSize: 7
                          ),)),                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
 child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("8",
                          style: GoogleFonts.vollkorn(fontSize: 50),)),
                ),                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
 child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("9",
                          style: GoogleFonts.vollkorn(fontSize: 50),)),
                ),                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 1,
                child: Container(
 child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("10",
                          style: GoogleFonts.vollkorn(fontSize: 70),)),
                ),                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
 child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("11",
                          style: GoogleFonts.vollkorn(fontSize: 100),)),
                ),                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("12",
                          style: GoogleFonts.vollkorn(fontSize: 100),)),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Container(
 child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://wallpapers.com/images/hd/makoto-shinkai-anime-aesthetic-laptop-3eop3d65vpmswgaa.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Text("13",
                          style: GoogleFonts.vollkorn(fontSize: 70),)),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

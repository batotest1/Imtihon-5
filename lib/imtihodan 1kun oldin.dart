import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Spinkit kutubxonasini ishlatamiz
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 5 soniyadan keyin boshqa sahifaga o'tish
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NextPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/748da870-7be9-460f-b1ed-8336121405de/dg9ivma-e440e484-e0da-478b-ae6d-f8e59cd65c3b.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzc0OGRhODcwLTdiZTktNDYwZi1iMWVkLTgzMzYxMjE0MDVkZVwvZGc5aXZtYS1lNDQwZTQ4NC1lMGRhLTQ3OGItYWU2ZC1mOGU1OWNkNjVjM2IuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.WgdVw0wXhBJ-tsbaojTtXExUtrx-Sj4RzHiqp6XT9ZI',
                ), // Shu yerga rasm yo'li
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Flutter',
                  style: GoogleFonts.alumniSansCollegiateOne(
                      fontSize: 70, color: Colors.white),
                ),
                SizedBox(height: 20),
                SpinKitHourGlass(
                  color: Colors.white,
                  size: 60.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Keyingi sahifa
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            height: 400, // O'lchamni oshirdim
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.blue, Colors.white],
                stops: [0.4, 0.7, 1.0],
              ),
            ),
          ),
          // Lottie animation in the center
          Align(
            alignment: Alignment.topCenter,
            child: Lottie.asset(
              'lib/lottie/Animation - 1723611783525 (1).json',
              width: 100,
              height: 100,
            ),
          ),
          // Container for the list of items below
          Positioned(
            top: 250, // O'rnini o'zgartirdim
            left: 20,
            right: 20,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.grey[800],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'Images/car_${index + 1}.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(height: 10),
                            Text(
                              getCarName(index),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Oddiy tufta moshina holos',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Button action for each item
                              },
                              child: Text('Button ${index + 1}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to return car name based on index
  String getCarName(int index) {
    List<String> carNames = [
      'Chaqmoq',
      'Met',
      'Ferariy',
      'Poisha',
      'Chaqmoq',
      'Met',
      'Ferariy',
      'Poisha',
      'Chaqmoq',
      'Met',
    ];
    return carNames[index];
  }
}



void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

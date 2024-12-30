import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Oddiy> meva = [
    Oddiy(
        rasm: 'Images/pizza.jpg',
        name: 'Get special discount',
        description: 'up to 30%'),
    Oddiy(
        rasm: 'Images/manti.jpg',
        name: 'Get special discount',
        description: 'up to 30%'),
    Oddiy(
        rasm: 'Images/fanta.jpg',
        name: 'Get special discount',
        description: 'up to 30%'),
    Oddiy(
        rasm: 'Images/hot.jpg',
        name: 'Get special discount',
        description: 'up to 30%'),
    Oddiy(
        rasm: 'Images/palov.jpg',
        name: 'Get special discount',
        description: 'up to 30%'),
    Oddiy(
        rasm: 'Images/a.jpg',
        name: 'Get special discount',
        description: 'up to 30%'),
    Oddiy(
        rasm: 'Images/arab.jpg',
        name: 'Get special discount',
        description: 'up to 30%'),
  ];

  List<Oddiy> rolls = [
    Oddiy(
        rasm: 'Images/w.jpg',
        name: 'California Roll',
        description: '\$ 26.00',
        yulduzcha: "4.6"),
    Oddiy(
        rasm: 'Images/e.jpg',
        name: 'Dragon Roll',
        description: '\$ 18.00',
        yulduzcha: "4.9"),
    Oddiy(
        rasm: 'Images/a.jpg',
        name: 'Salmon Roll',
        description: '\$ 21.00',
        yulduzcha: "4.3"),
    Oddiy(
        rasm: 'Images/r.jpg',
        name: 'Tuna Roll',
        description: '\$ 12.00',
        yulduzcha: "4.1"),
    Oddiy(
        rasm: 'Images/pizza.jpg',
        name: 'Italian Roll',
        description: '\$ 6.00',
        yulduzcha: "4.8"),
    Oddiy(
        rasm: 'Images/manti.jpg',
        name: 'Ilon Roll',
        description: '\$ 28.00',
        yulduzcha: "4.6"),
    Oddiy(
        rasm: 'Images/arab.jpg',
        name: 'Boyota Roll',
        description: '\$ 19.00',
        yulduzcha: "4.7"),
    Oddiy(
        rasm: 'Images/w.jpg',
        name: 'Loc Roll',
        description: '\$ 9.00',
        yulduzcha: "4.8"),
  ];

  List<Oddiy> filteredRolls = [];

  @override
  void initState() {
    super.initState();
    filteredRolls = rolls;
  }

  void _filterRolls(String query) {
    final filtered = rolls.where((roll) {
      return roll.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredRolls = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Column(
          children: [
            SizedBox(height: 4),
            Text(
              'Location',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_pin, color: Colors.red),
                Text("Uzbekistan"),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.notifications_active_outlined),
              SizedBox(width: 4),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselWidget(meva: meva),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onChanged: _filterRolls,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Search your food...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Popular Food",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "View all",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.grey),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of containers in each row
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2 / 2.5, // Adjust aspect ratio as needed
              ),
              itemCount: filteredRolls.length,
              itemBuilder: (context, index) {
                final roll = filteredRolls[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailPage(roll: roll),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                roll.rasm!,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width:
                                    50, // Kichkina konteynerning kengligini belgilang
                                height:
                                    25, // Kichkina konteynerning balandligini belgilang
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Kichkina konteyner rangini belgilang
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                        10), // Top-right burchakni yumshatish
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.10),
                                      blurRadius: 2,
                                      offset: Offset(2, 10),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons
                                            .star, // Bu erda kerakli ikonani tanlang
                                        color: Colors.yellow,
                                      ),
                                      Text(roll.yulduzcha!),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                roll.name!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    roll.description!,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(70),
                                    ),
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  final List<Oddiy> meva;

  CarouselWidget({required this.meva});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        height: 250.0,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
      items: meva.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Card(
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item.rasm!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 100,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              item.description!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900
                              ),
                            ),
                            SizedBox(height: 5),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                color: Colors.white,
                                child: Text(
                                  'Claim voucher',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final Oddiy roll;

  FoodDetailPage({required this.roll});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Detail",
          style: TextStyle(fontSize: 25),
        )),
        actions: [
          Icon(
            Icons.favorite,
            color: Colors.red,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                roll.rasm!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  roll.name!,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic),
                ),
                Container(
                  width: 50, // Kichkina konteynerning kengligini belgilang
                  height: 25, // Kichkina konteynerning balandligini belgilang
                  decoration: BoxDecoration(
                    color: Colors.white, // Kichkina konteyner rangini belgilang
                    borderRadius: BorderRadius.only(
                      topRight:
                          Radius.circular(10), // Top-right burchakni yumshatish
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star, // Bu erda kerakli ikonani tanlang
                        color: Colors.yellow,
                      ),
                      Text(roll.yulduzcha!),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              roll.description!,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: NetworkImage(
                      "data:image/jpeg;base64,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",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Salmon"),
                Container(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl4UcOS28_FPHaomFpiPtV-hQFmkIjd-s1oA&s",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Sushi Rice"),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-6HS1dEITVJt-UaoFBWTZx3U8Ag6LPO7AWg&s",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Pepsi"),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Text(
                    roll.description!,
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Text("- 1 +"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 270),
              child: Text(
                "About Sushi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sushi (tl,EY,YT,TF,PRONOUNCED [sw6i*] or ",
              style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
            ),
            Text(
              "[sw*6i]is a Japanse dish of prepared",
              style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
            ),
            Text(
              "vinegared rice (QE,sushi-meshi),usually with ",
              style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
            ),
            Text(
              "some sugar and salt,plus a variety of",
              style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
            ),
            Text(
              "ingredients (th,neta),such as vegetables,and",
              style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      roll.description!,
                      style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900),
                    ),
                    Text("Total price")
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Oxiri(),
                        ));
                  },
                  child: Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(70)),
                    child: Center(
                        child: Text(
                      "Place Order",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Oxiri extends StatefulWidget {
  const Oxiri({super.key});

  @override
  State<Oxiri> createState() => _OxiriState();
}

class _OxiriState extends State<Oxiri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your cart food"),
          actions: [Icon(Icons.more_vert_rounded)],
          centerTitle: true,
        ),
        body: Column(
          children: [
          
            Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Container(
                  color: Colors.white,
                  child: Container(
                    height: 170,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRca4BMu4azm1Vik2bKgy26PcENpyeG3dRPYA&s",
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text(
                        "Original Sushi",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(width: 50,),
                       Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                         children: [
                           Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                             child: Center(
                               child: Text(
                                                   "-",
                                                   style: TextStyle(color: Colors.black, fontSize: 15),
                                                 ),
                             ),
                           ),
                           Text(" 1 +")
                         ],
                       ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 120, 0),
                    child: Text("\$ 26.00",style: TextStyle(fontSize: 25),),
                  ),
                 SizedBox(height: 50,),
                
                ]),

              ],
            ),  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Container(
                  color: Colors.white,
                  child: Container(
                    height: 170,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmkPCISmRFYb3rzq17rvH3O7vNW2I8wjAtvA&s",
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text(
                        "California Roll",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(width: 50,),
                       Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                         children: [
                           Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                             child: Center(
                               child: Text(
                                                   "-",
                                                   style: TextStyle(color: Colors.black, fontSize: 15),
                                                 ),
                             ),
                           ),
                           Text(" 1 +")
                         ],
                       ),
                    ],
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 120, 0),
                    child: Text("\$ 18.00",style: TextStyle(fontSize: 25),),
                  ),
                 SizedBox(height: 30,),
                ]),

              ],
            ),
              Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Container(
                  color: Colors.white,
                  child: Container(
                    height: 170,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5hmYmzczs981DPmtSYqGGdHPznI2SCkiHDw&s",
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(children: [
                  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text(
                        "Salmon Roll",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(width: 50,),
                       Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                         children: [
                           Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                             child: Center(
                               child: Text(
                                                   "-",
                                                   style: TextStyle(color: Colors.black, fontSize: 15),
                                                 ),
                             ),
                           ),
                           Text(" 1 +")
                         ],
                       ),
                    ],
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 120, 0),
                    child: Text("\$ 22.50",style: TextStyle(fontSize: 25),),
                  ),
                 SizedBox(height: 30,),
                ]),

              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
               SizedBox(width: 20,),
                Icon(Icons.comment_bank_rounded,color: Colors.grey,),
                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Text(" Promo code",style: TextStyle(fontSize: 25,color: Colors.grey),),
                    SizedBox(width: 200,),
                     Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("Apply",style: TextStyle(fontSize: 20,color: Colors.white),)),
                )
                  ],
                ),
               
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                        "Item total:",
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(
                                         "\$70.50",
                                         style: TextStyle(fontSize: 20, color: Colors.black54),
                                       ),
                     ),
              ],
            ), 
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                        "Delivery:",
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(
                                         "Free",
                                         style: TextStyle(fontSize: 20, color: Colors.black54),
                                       ),
                     ),
              ],
            ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total:",
                    style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.w900),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "70.50",
                    style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.w900),
                  ),
              ),
                
              ],
            ),
            
            SizedBox(
              height: 15,
            ),
            Container(
              height: 70,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                "Payment",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700,color: Colors.white),
              )),
            ),
          ],
        ));
  }
}

class Oddiy {
  String? rasm;
  String? name;
  String? description;
  String? yulduzcha;
  Oddiy({this.rasm, this.name, this.description, this.yulduzcha});
}

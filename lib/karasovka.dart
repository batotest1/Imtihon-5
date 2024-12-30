import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoe Store',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Nike Air Max 95', 'price': '230.00', 'tag': 'Trending Now', 'image': 'https://masterpiecer-images.s3.yandex.net/bc9dd101823711ee9919baea8797b5f2:upscaled'},
    {'name': 'Nike Air Max 97', 'price': '250.00', 'tag': 'Best Selling', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG35AtR60M-XRNuEucirDsKRO2Qr08hF7hKA&s'},
    {'name': 'Nike Air Max 200', 'price': '235.00', 'tag': '', 'image': 'https://images.stockx.com/images/Air-Max-200-Black.jpg?fit=fill&bg=FFFFFF&w=700&h=500&fm=webp&auto=compress&q=90&dpr=2&trim=color&updated_at=1625189029'},
    {'name': 'Nike Air Max 260', 'price': '260.00', 'tag': '', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQfUrDqIjQRkwvvHZL5nbdL8C7ELmOrs74fA&s'},
    {'name': 'Nike Revolution', 'price': '180.00', 'tag': '', 'image': 'https://cms-cdn.thesolesupplier.co.uk/2019/07/NIKE_AQ2568-101-05-1600x1066.jpg.webp'},
    {'name': 'Nike Pegasus 37', 'price': '195.00', 'tag': 'New Arrival', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR08k542bMNbfXY05w57-Eae8N-J_PuQDGWYg&s'},
    {'name': 'Nike ZoomX', 'price': '210.00', 'tag': 'Exclusive', 'image': 'https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/08f113fb-396f-4445-a89b-f82752a7cb82/AIR+MAX+90+G.png'},
    {'name': 'Nike React', 'price': '200.00', 'tag': '', 'image': 'https://cdn.shopify.com/s/files/1/0603/3031/1875/files/7_0f7c1636-5db0-474a-ab52-c096c1dc7e94_540x.jpg?=75&v=1719903153'},
    {'name': 'Nike Phantom', 'price': '240.00', 'tag': '', 'image': 'https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/e76904c8-b4b7-4972-8531-cfeb35b072d2/NIKE+AIR+MAX+95+GS.png'},
    {'name': 'Nike Free Run', 'price': '190.00', 'tag': '', 'image': 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/a5f04850-c95a-4ed0-a2b3-1e6517c1278b/WMNS+AIR+MAX+95+NBY.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Icon(Icons.menu, color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['All', 'Shoes', 'Clothes', 'Watches']
                  .map((category) => TextButton(
                        onPressed: () {},
                        child: Text(category),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: products.map((product) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              name: product['name']!,
                              price: product['price']!,
                              tag: product['tag']!,
                              imageUrl: product['image']!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 300,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: ProductCard(
                          name: product['name']!,
                          price: product['price']!,
                          tag: product['tag']!,
                          imageUrl: product['image']!,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
                            Text("Show all",style: TextStyle(color: Colors.grey),)
              ],
            ),
             SizedBox(height: 20),
         Expanded(
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: products.map((product) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  name: product['name']!,
                  price: product['price']!,
                  imageUrl: product['image']!,
                  tag: '',
                ),
              ),
            );
          },
          child: Container(
            width: 600,
            height: 150,
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(16), // Add some padding inside the container
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, // You can change the background color if needed
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                // Left side: Image
                Container(
                  width: 100, // Set the size of the image container
                  height: 100,
                  margin: EdgeInsets.only(right: 16), // Space between image and text
                  child: Image.network(
                    product['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                // Right side: Column with text

                SizedBox(
                  width: 250,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                                          Icon(Icons.favorite_border),

                      // First Text: Product name
                      Text(
                        product['name']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8), // Space between name and price
                      // Second Text: Price
                      Text(
                        '\$${product['price']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8), // Space between price and likes
                      // Third Text: Likes
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  ),
)

                  ],
                ),
              ),
    
    
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String tag;
  final String imageUrl;

  const ProductCard({
    required this.name,
    required this.price,
    required this.tag,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('\$ $price', style: TextStyle(color: Colors.orange)),
          if (tag.isNotEmpty)
            Text(
              tag,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
        ],
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String name;
  final String price;
  final String tag;
  final String imageUrl;

  const ProductDetailScreen({
    required this.name,
    required this.price,
    required this.tag,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(imageUrl, height: 400, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        SizedBox(width: 4),
                        Text("4.5", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$$price',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Size", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Row(
              children: ["5", "5.5", "6", "6.5", "7"].map((size) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ChoiceChip(
                    label: Text(size),
                    selected: size == "6",
                    selectedColor: Colors.black,
                    labelStyle: TextStyle(color: size == "6" ? Colors.white : Colors.black),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text("Colors", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Row(
              children: [Colors.blue, Colors.orange, Colors.green, Colors.purple]
                  .map((color) => Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: color == Colors.blue ? Colors.black : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Text("Description", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Odio diam enim at purus et enim enim.",
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Center(
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => FilterModal(),
            );
          },
          child: Icon(Icons.shopping_basket_rounded, size: 50),
        ),
      ),
          ]
        )
      )
    );
  }
}

class FilterModal extends StatefulWidget {
  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  String selectedBrand = '';
  String selectedGender = '';
  String selectedSize = '';
  double minPrice = 0;
  double maxPrice = 230;
  Color selectedColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Filters", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: Text("RESET")),
            ],
          ),
          SizedBox(height: 10),
          Text("Brand"),
          SizedBox(height: 8),
          Row(
            children: ['Nike', 'Jordan', 'Adidas'].map((brand) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ChoiceChip(
                  label: Text(brand),
                  selected: selectedBrand == brand,
                  selectedColor: Colors.black,
                  onSelected: (isSelected) {
                    setState(() {
                      selectedBrand = isSelected ? brand : '';
                    });
                  },
                  labelStyle: TextStyle(color: selectedBrand == brand ? Colors.white : Colors.black),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Text("Gender"),
          SizedBox(height: 8),
          Row(
            children: ['Men', 'Women', 'Kids'].map((gender) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ChoiceChip(
                  label: Text(gender),
                  selected: selectedGender == gender,
                  selectedColor: Colors.black,
                  onSelected: (isSelected) {
                    setState(() {
                      selectedGender = isSelected ? gender : '';
                    });
                  },
                  labelStyle: TextStyle(color: selectedGender == gender ? Colors.white : Colors.black),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Text("Size"),
          SizedBox(height: 8),
          Row(
            children: ['5', '5.5', '6', '6.5', '7'].map((size) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ChoiceChip(
                  label: Text(size),
                  selected: selectedSize == size,
                  selectedColor: Colors.black,
                  onSelected: (isSelected) {
                    setState(() {
                      selectedSize = isSelected ? size : '';
                    });
                  },
                  labelStyle: TextStyle(color: selectedSize == size ? Colors.white : Colors.black),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Text("Price"),
          Text("Price"),
RangeSlider(
  min: 0,
  max: 230,
  values: RangeValues(minPrice, maxPrice),
  onChanged: (values) {
    setState(() {
      minPrice = values.start;
      maxPrice = values.end;
    });
  },
  divisions: 10,
  labels: RangeLabels("\$${minPrice.toStringAsFixed(0)}", "\$${maxPrice.toStringAsFixed(0)}"),
  activeColor: Colors.orange,
),

          SizedBox(height: 10),
          Text("Colors"),
          SizedBox(height: 8),
          Row(
            children: [Colors.blue, Colors.orange, Colors.green, Colors.purple].map((color) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = color;
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedColor == color ? Colors.black : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

extension on double {
  double? get start => null;
}
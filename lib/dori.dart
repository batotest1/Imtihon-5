import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: KasalliklarPage(),
    );
  }
}

class KasalliklarPage extends StatefulWidget {
  @override
  _KasalliklarPageState createState() => _KasalliklarPageState();
}

class _KasalliklarPageState extends State<KasalliklarPage> {
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 0; // Tanlangan index

  // Har bir sahifa uchun list
  final List<Widget> _pages = [
    KasalliklarPage(), // Home sahifasi
    PharmacyMapPage(), // Xarita sahifasi
    SettingsPage(), // Sozlamalar sahifasi
  ];

  // Tanlangan sahifaga o'tish
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Sahifa o'zgartirilganida Navigatsiya qilish
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => KasalliklarPage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PharmacyMapPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
    }
  }

  final List<Map<String, String>> dorilar = [
    {
      "name": "Paracetamol",
      "details": "5000 so'm                                                 ",
      "image":
          "https://phabcart.imgix.net/cdn/scdn/images/uploads/m0459_web.jpg",
    },
    {
      "name": "Ibuprofen",
      "details": "8000 so'm                                                 ",
      "image":
          "https://cdn11.bigcommerce.com/s-n6ynrx6s4d/images/stencil/1280x1280/products/2377/4521/ibuprofen_tabs__60250.1648242731.jpg?c=1",
    },
    {
      "name": "Mezim",
      "details": "10000 so'm                                                ",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ_KZ-ALFz1ghMfEnj2VewLgedBN84zeETkA&s",
    },
    {
      "name": "Benzodiazepine",
      "details": "12000 so'm                                                ",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBS6_ktnI6aG_wAnJHtAqXJTPJnjA9nbH4ng&s",
    },
  ];
  // Dorilar va kasalliklar ro'yxati (100 dan ortiq)
  final Map<String, List<Map<String, dynamic>>> kasalliklar = {
    "bosh og'rig'i": [
      {
        "name": "Paracetamol",
        "price": 5000,
        "image":
            "https://phabcart.imgix.net/cdn/scdn/images/uploads/m0459_web.jpg",
        "details": "500 mg tabletka, kuniga 3 marta ichish kerak.",
        "usage": "Iliq suv bilan ichish.",
        "duration": "7 kun davomida ichish kerak."
      },
      {
        "name": "Ibuprofen",
        "price": 8000,
        "image":
            "https://cdn11.bigcommerce.com/s-n6ynrx6s4d/images/stencil/1280x1280/products/2377/4521/ibuprofen_tabs__60250.1648242731.jpg?c=1",
        "details": "200 mg tabletka, kuniga 2 marta ichish kerak.",
        "usage": "Oddiy suv bilan ichish.",
        "duration": "5 kun davomida ichish kerak."
      },
      {
        "name": "Benzodiazepine",
        "price": 12000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBS6_ktnI6aG_wAnJHtAqXJTPJnjA9nbH4ng&s",
        "details": "Kuniga 1 marta ichish kerak.",
        "usage": "Oddiy suv bilan ichish.",
        "duration": "14 kun davomida ichish kerak."
      },
    ],
    "oshqozon og'rig'i": [
      {
        "name": "Mezim",
        "price": 10000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX2xEDQjMiLUQ14hj_kM8qxPuhgOHz5MQf6h6ihefvmGDh7H_vFUnP4wZp_eo1GQdpzHg&usqp=CAU",
        "details": "Tabletka ovqatdan oldin ichiladi.",
        "usage": "Oddiy suv bilan ichish.",
        "duration": "10 kun davomida ichish kerak."
      },
      {
        "name": "No-spa",
        "price": 12000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb-gawyvKQa9BLCgTHvvKe_sJVyiDdKo50vA&s",
        "details": "Kuniga 2-3 tabletka ichish kerak.",
        "usage": "Oddiy suv bilan ichish.",
        "duration": "4 kun davomida ichish kerak."
      },
      {
        "name": "Omeprazole",
        "price": 11000,
        "image":
            "https://m.media-amazon.com/images/I/71pBbwA1A2L._AC_UF1000,1000_QL80_.jpg",
        "details": "Kuniga 1 marta ichish kerak.",
        "usage": "Iliq suv bilan ichish.",
        "duration": "7 kun davomida ichish kerak."
      },
      {
        "name": "Gastromax",
        "price": 9500,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0Z9pxWMlBD11oPS42-OFZ0g10V5Pi2TbvMg&s",
        "details": "Kuniga 1 marta ichish kerak.",
        "usage": "Oddiy suv bilan ichish.",
        "duration": "5 kun davomida ichish kerak."
      },
    ],
    "yotal kasalligi": [
      {
        "name": "Teraflu",
        "price": 35000,
        "image":
            "https://m.media-amazon.com/images/I/71L6DlVGYzL._AC_SL1500_.jpg",
        "details":
            "Gripp va yo'talni davolash uchun ishlatiladi. Issiqlikni pasaytiradi va yo'talni kamaytiradi.",
        "usage": "Issiq suvga eritib ichish.",
        "duration": "5-7 kun davomida ichish kerak."
      },
      {
        "name": "Fluimucil",
        "price": 25000,
        "image":
            "https://manaraonline.com/cdn/shop/products/Fluimucil600mgEffervescentTabs10s__56555.jpg?v=1703081069&width=900",
        "details": "Yo'talni yengillashtiradi va nafas olishni osonlashtiradi.",
        "usage": "Suv bilan eritib ichish.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Ambroxol",
        "price": 10000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLhdWXOyjer_is1FXcDtolDMxsgaE6gVLmuQ&s",
        "details":
            "O'tkir va surunkali yo'talni davolash uchun ishlatiladi, balg'amni yuvib chiqaradi.",
        "usage": "Suv bilan ichish.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Loratadin",
        "price": 12000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS6Qmi2tTpOA-yI0WN9NRHIdPcQS2zwR2-bA&s",
        "details": "Alergik yo'talni davolashda yordam beradi.",
        "usage": "Suv bilan ichish.",
        "duration": "5-7 kun davomida."
      },
      {
        "name": "Sinekod",
        "price": 18000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN8ga-k7HufI6t3ilrGnxobBfz1E5FBkJFcg&s",
        "details": "Yo'talni yengillashtiradi va nafas olishni osonlashtiradi.",
        "usage": "Siropni shunchaki ichish.",
        "duration": "7 kun davomida."
      },
    ],
    "qon bosimi yuqoriligi (Hypertension)": [
      {
        "name": "Amlodipine",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7uj5zFxgpnAJTDGbWfu_M5oro0PDT03Sb8Q&s",
        "price": 8000,
        "details": "Qon bosimini pasaytiradi.",
        "usage": "Oddiy suv bilan ichish.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Captopril",
        "image":
            "https://image.made-in-china.com/2f0j00cbSlZPdCyvkU/Captopril-Tablets-25mg-50mg-China-Pharmaceutical-GMP.webp",
        "price": 10000,
        "details": "Qon bosimi uchun.",
        "usage": "Iliq suv bilan ichish.",
        "duration": "10 kun davomida."
      },
      {
        "name": "Enalapril",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4xmEjgl3BD89px9oA4mIaozYmHd-Uv61GzA&s",
        "price": 9000,
        "details": "Qon bosimini nazorat qiladi.",
        "usage": "Oddiy suv bilan ichish.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Losartan",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc9ojcWjxI7_U8Db8u2jnFX8c9PHfzN10NjQ&s",
        "price": 12000,
        "details": "Qon bosimini pasaytiradi.",
        "usage": "Iliq suv bilan ichish.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Ramipril",
        "image":
            "https://res.cloudinary.com/zava-www-uk/image/upload/fl_progressive/a_exif,f_auto,e_sharpen:100,c_fit,w_1080,h_810,q_70,fl_lossy/v1708268841/sd/uk/services-setup/high-blood-pressure-unit/ramipril/gdb0rgocw0f0pk6jju2i.png",
        "price": 10000,
        "details": "Qon bosimini pasaytiradi.",
        "usage": "Iliq suv bilan ichish.",
        "duration": "7 kun davomida."
      },
    ],
    "diabet": [
      {
        "name": "Metformin",
        "image":
            "https://media.post.rvohealth.io/wp-content/uploads/2020/06/pregnancy-metformin-is-it-safe_thumb-732x549.jpg",
        "price": 15000,
        "details": "Diabetni davolash.",
        "usage": "Oddiy suv bilan ichish.",
        "duration": "10 kun davomida."
      },
      {
        "name": "Glibenclamide",
        "image":
            "https://5.imimg.com/data5/SELLER/Default/2022/5/RC/IA/YB/86655267/glibenclamide-tablets.jpg",
        "price": 12000,
        "details": "Qon shakarini pasaytiradi.",
        "usage": "Iliq suv bilan ichish.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Insulin",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXK3MmEmGNT0Br6Cc27wdXJWgQTTx7LoqKUw&s",
        "price": 15000,
        "details": "Shakarni normallashtiradi.",
        "usage": "Iliq suv bilan ichish.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Gliclazide",
        "image":
            "https://www.xalmeds.com/cdn/shop/products/0E8BB996-E980-4645-9DD3-68378E7201C5.png?v=1664465128",
        "price": 13000,
        "details": "Qon shakarini pasaytiradi.",
        "usage": "Iliq suv bilan ichish.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Pioglitazone",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVYulEwrOFKyYQ_87--KjwaI6UKtJHqW5G5A&s",
        "price": 14000,
        "details": "Insulin sezgirligini yaxshilaydi.",
        "usage": "Iliq suv bilan ichish.",
        "duration": "10 kun davomida."
      },
    ],
    "suyaklar yemirilishi": [
      {
        "name": "Calcium D3",
        "price": 15000,
        "image":
            "https://images.immediate.co.uk/production/volatile/sites/30/2023/06/Calcium-foods-b4e4ae3.jpg?quality=90&resize=440,400 ",
        "details":
            "Suyaklarni mustahkamlash uchun. Kuniga 1 ta tabletka ichish kerak.",
        "usage": "Oddiy suv bilan ichish.",
        "duration": "1 oy davomida ichish kerak."
      },
      {
        "name": "Osteo Bi-Flex",
        "price": 22000,
        "image": "https://m.media-amazon.com/images/I/71mqSval9WL.jpg",
        "details":
            "Suyaklar va bo'g'imlar uchun. Kuniga 1 ta tabletka ichish kerak.",
        "usage": "Suv bilan ichish.",
        "duration": "2 hafta davomida ichish kerak."
      },
      {
        "name": "Vitamin D3",
        "price": 12000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg7o5tUEFrMpmS_fqUSm3ZKGr0lBPkcITYBQ&s",
        "details": "Suyaklarni mustahkamlash uchun zarur vitamin.",
        "usage": "1 kapsula kuniga.",
        "duration": "1 oy davomida."
      },
      {
        "name": "Alendronate",
        "price": 18000,
        "image":
            "https://5.imimg.com/data5/SELLER/Default/2021/1/VD/XP/QO/13166357/alendate-70.jpg",
        "details": "Osteoporozni davolash uchun dori.",
        "usage": "Erta tongda bir marta ichish kerak.",
        "duration": "3 oy davomida."
      },
      {
        "name": "Bonviva",
        "price": 28000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMmTortpy1_ak6RvNbrg2tN836ltS8PyFa5Q&s",
        "details": "Suyaklar uchun, bo'g'imlarni mustahkamlash.",
        "usage": "Bir marta oyda 1 marta.",
        "duration": "6 oy davomida."
      },
      {
        "name": "Actonel",
        "price": 25000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6zfdPzczdKzd0FhNX2ivliLBoR4iznknwxA&s",
        "details": "Suyaklarning yemirilishini oldini olish uchun.",
        "usage": "Kuniga 1 tabletka.",
        "duration": "1 oy davomida."
      },
      {
        "name": "Fosamax",
        "price": 30000,
        "image":
            "https://5.imimg.com/data5/TF/MJ/MY-1680751/fosamax-tablets-500x500.jpg",
        "details": "Osteoporozni davolashda qo'llaniladi.",
        "usage": "1 marta haftada.",
        "duration": "6 oy davomida."
      },
      {
        "name": "Strontium ranelate",
        "price": 35000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBoxHPBM167vOm0NtKMRy9geqInVRaFv_Nrj5JaAXKBp5WRnp5Fwl4DikyIyPLfl2tkQg&usqp=CAU",
        "details": "Osteoporozni davolash uchun.",
        "usage": "Kuniga 1 ta kapsula.",
        "duration": "3 oy davomida."
      },
      {
        "name": "Denosumab",
        "price": 45000,
        "image":
            "https://upload.wikimedia.org/wikipedia/commons/4/40/Denosumab.jpg",
        "details": "Suyaklar va bo'g'imlarni mustahkamlash.",
        "usage": "Yarim yilda bir marta in'eksiya.",
        "duration": "6 oy davomida."
      },
      {
        "name": "Zoledronic acid",
        "price": 50000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpXrgkRPwHcWQoy6_S9q1OtTEYwjcBAvow1A&s",
        "details": "Osteoporozni davolashda qo'llaniladi.",
        "usage": "Yarim yilda bir marta in'eksiya.",
        "duration": "6 oy davomida."
      },
    ],
    "oyog' yoki qo'l og'rig'i": [
      {
        "name": "Diclofenac",
        "price": 7000,
        "image":
            "https://image.made-in-china.com/202f0j00VqiWpUQdJnRf/Diclofenac-Sodium-Tablet-50mg-with-GMP.webp",
        "details": "Og'riqni kamaytiradi, yallig'lanishni bartaraf etadi.",
        "usage": "Kuniga 2 marta.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Ibuprofen",
        "price": 8000,
        "image":
            "https://cdn11.bigcommerce.com/s-n6ynrx6s4d/images/stencil/1280x1280/products/2377/4521/ibuprofen_tabs__60250.1648242731.jpg?c=1",
        "details": "Og'riqni yengillashtiradi.",
        "usage": "Oddiy suv bilan ichish.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Paracetamol",
        "price": 5000,
        "image":
            "https://phabcart.imgix.net/cdn/scdn/images/uploads/m0459_web.jpg",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Iliq suv bilan ichish.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Naproxen",
        "price": 10000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy1V1HHo54zZANYdMuA8qhQq3VGX861kY0Hg&s",
        "details": "Og'riqni kamaytiradi, yallig'lanishni kamaytiradi.",
        "usage": "Kuniga 2 marta.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Celecoxib",
        "price": 11000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9exxFGzJumeDJaXtv0cKM7wZ0g39ugijmuw&s",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Kuniga 1 marta.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Tramadol",
        "price": 15000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk45_Bb_T4fVYKK5dCwmtArLQlBTjC1NhI9Q&s",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Kuniga 3 marta.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Methadone",
        "price": 20000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqUQPOR9XQZLwSN2THcIE3pmmqcHYCzIEULg&s",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Kuniga 2 marta.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Fentanyl",
        "price": 25000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmeSmZmqI8Xk7_4Kc_oS8sQgHoRaoab2B_wA&s",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Og'riqni yo'qotish uchun.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Hydrocodone",
        "price": 22000,
        "image":
            "https://longislandinterventions.com/wp-content/uploads/2022/07/Hydrocodone.jpg",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Kuniga 3 marta.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Gabapentin",
        "price": 12000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ16xNL6iWZpU0BvWFhBo0gVJfu6LyShc_FA&s",
        "details": "Nerv og'rig'ini kamaytiradi.",
        "usage": "Kuniga 1 marta.",
        "duration": "2 hafta davomida."
      },
    ],
    "bel og'rig'i": [
      {
        "name": "Paracetamol",
        "price": 6000,
        "image":
            "https://phabcart.imgix.net/cdn/scdn/images/uploads/m0459_web.jpg",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Kuniga 2 marta.",
        "duration": "3 kun davomida."
      },
      {
        "name": "Ibuprofen",
        "price": 7000,
        "image":
            "https://5.imimg.com/data5/SELLER/Default/2023/6/319597573/MH/NE/SR/135658020/ibuprofen-400-mg-bp-tablets-500x500.jpg",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Suv bilan ichish.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Diazepam",
        "price": 10000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYUcdpHQT93lNv0CcMgo9T-E-BqOmI5eGFzw&s",
        "details": "Spazm va og'riqlarni kamaytiradi.",
        "usage": "Kuniga 1 marta.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Methocarbamol",
        "price": 8000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKxea6mbC-XKF57Z0Y_AEyUBxDXNf4x-DGng&s",
        "details": "Muscle relaxant dori.",
        "usage": "Kuniga 3 marta.",
        "duration": "1 hafta davomida."
      },
      {
        "name": "Codeine",
        "price": 11000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAQSgYrEvf7sIKWmk5TIzOsmdCH3z5gWi0T8KxFJs_yBhXaKx7OckVBKRoyAxjmUMxpHk&usqp=CAU",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Kuniga 2 marta.",
        "duration": "5 kun davomida."
      },
      {
        "name": "Oxycodone",
        "price": 14000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQNWZ46Zx9i1VH3_ReFQOca_XRbRncirfOjMgd-xFhaLDyUmPZ1dFaKQubc8n0dyyID6Q&usqp=CAU",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Kuniga 3 marta.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Amitriptyline",
        "price": 9000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTOSWOOTb105R-GD1QmgNmhdsGueBcn-bPXg&s",
        "details": "Og'riqlarni kamaytiradi, uyquni yaxshilaydi.",
        "usage": "Suv bilan ichish.",
        "duration": "3 hafta davomida."
      },
      {
        "name": "Naprosyn",
        "price": 12000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbcwg2kfeOQQFJ1m2_PzHPoYkKxdLWTr8Klw&s",
        "details": "Og'riqni kamaytiradi.",
        "usage": "Kuniga 2 marta.",
        "duration": "7 kun davomida."
      },
      {
        "name": "Cymbalta",
        "price": 18000,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT71lRLJSh6LjDYga8e8uh8new4Zg9C6pykNQ&s",
        "details": "Og'riqlarni kamaytiradi, depressiyani davolaydi.",
        "usage": "Kuniga 1 marta.",
        "duration": "1 oy davomida."
      },
      {
        "name": "Lidocaine",
        "price": 13000,
        "image":
            "https://m.media-amazon.com/images/I/61NaqSs1DUL._AC_SL1157_.jpg",
        "details": "Og'riqni yengillashtiradi.",
        "usage": "Mahalliy qo'llash.",
        "duration": "3 kun davomida."
      },
    ]
  };

  List<Map<String, dynamic>> _results = [];
  String _selectedCategory = "";

  // Qidiruv funksiyasi
  void _search(String query) {
    setState(() {
      String searchQuery = query.toLowerCase();
      _results.clear();

      // Kasalliklar ro'yxatidan to'liq nomini tekshirib chiqish
      kasalliklar.forEach((category, medicines) {
        if (category.toLowerCase().contains(searchQuery)) {
          // Agar kasallik nomi qidiruvga mos kelsa, tegishli dorilarni ko'rsatish
          _results.add({"category": category, "medicines": medicines});
        } else {
          // Dorilarning nomini tekshirish
          List<Map<String, dynamic>> matchedMedicines = [];
          for (var medicine in medicines) {
            if (medicine["name"].toLowerCase().contains(searchQuery)) {
              matchedMedicines.add(medicine);
            }
          }
          if (matchedMedicines.isNotEmpty) {
            _results.add({"category": category, "medicines": matchedMedicines});
          }
        }
      });
      _selectedCategory = searchQuery;
    });
  }

  void _showMedicineDetails(Map<String, dynamic> medicine) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(medicine["name"]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(medicine["image"]),
              SizedBox(height: 10),
              Text("Narxi: ${medicine['price']} so'm"),
              Text("Tavsif: ${medicine['details']}"),
              Text("Qanday ichish: ${medicine['usage']}"),
              Text("Davomiyligi: ${medicine['duration']}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Yopish"),
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
        title: Text(
          "Tibbiy Maslahatlar",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.teal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _controller,
                onChanged: _search,
                decoration: InputDecoration(
                  labelText: "Kasallikni kiriting",
                  labelStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            // Kasalliklar ro'yxatini ko'rsatish
            Expanded(
              child: _results.isEmpty
                  ? Column(
                      children: [
                        Center(
                          child: CarouselSlider.builder(
                            itemCount: dorilar.length,
                            itemBuilder: (context, index, realIndex) {
                              final dori = dorilar[index];
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(dori["image"]!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dori["name"]!,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        dori["details"]!,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 250,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                            ),
                          ),
                        ),
                        Text(
                    
                          "Ommabop dorilar",
                          style: 
                          TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,  
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: _results.length,
                      itemBuilder: (context, index) {
                        var categoryData = _results[index];
                        var category = categoryData["category"];
                        var medicines = categoryData["medicines"];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                category, // Kasallik nomini ko'rsatish
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ...medicines.map((medicine) {
                              return ListTile(
                                leading: Image.network(
                                  medicine["image"],
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text(medicine["name"]),
                                subtitle:
                                    Text("Narxi: ${medicine['price']} so'm"),
                                onTap: () => _showMedicineDetails(medicine),
                              );
                            }).toList(),
                          ],
                        );
                      },
                    ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green], // Gradient ranglari
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Yopiq fonni olib tashlash
          selectedItemColor:
              Colors.black, // Tanlangan element rangini qora qilish
          unselectedItemColor:
              Colors.black, // Tanlanmagan elementlarni qora qilish
          showUnselectedLabels: true, // Tanlanmagan matnni ko'rsatish
          currentIndex: _selectedIndex, // Tanlangan index
          onTap: _onItemTapped, // Tapda sahifani almashtirish
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_pin, color: Colors.black),
              label: 'Xarita',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: 'Sozlamalar',
            ),
          ],
        ),
      ),
    );
  }
}

class PharmacyMapPage extends StatefulWidget {
  @override
  _PharmacyMapPageState createState() => _PharmacyMapPageState();
}

class _PharmacyMapPageState extends State<PharmacyMapPage> {
  late GoogleMapController mapController;
  Set<Marker> _markers = {};

  final List<LatLng> pharmacyLocations = [
    LatLng(41.2995, 69.2401), // Misol: Toshkent
    LatLng(40.1164, 71.7780), // Misol: Samarqand
    LatLng(41.3647, 69.2760), // Misol: Buxoro
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addPharmacies() {
    setState(() {
      _markers = pharmacyLocations.map((location) {
        return Marker(
          markerId: MarkerId(location.toString()),
          position: location,
          infoWindow: InfoWindow(title: 'Dorixona'),
        );
      }).toSet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dorixonalar Xarita")),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(41.2995, 69.2401), // Toshkentga o'rnatilgan
              zoom: 12,
            ),
            markers: _markers,
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: ElevatedButton(
              onPressed: _addPharmacies,
              child: Text("Dorixonalar ko'rsatilsin"),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

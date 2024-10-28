import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
    home: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BeelineApp(),
    );
  }
}

class BeelineApp extends StatelessWidget {
  const BeelineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beeline Ilovasi'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header - Avatar va Ism
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return PhoneNumberSheet();
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(3.0), // Ko'k border
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 3),
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          "data:image/jpeg;base64,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",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Muhammad Rizo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '90 566-57-50',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.black,
                  ),
                  Icon(
                    Icons.earbuds,
                    size: 30,
                    color: Colors.black,
                  ),
                  Icon(
                    Icons.abc,
                    size: 30,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Balans va Tarif ma'lumotlari
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoBox(
                    title: 'Balans',
                    amount: '12 692',
                    action: 'To\'ldirish',
                  ),
                  InfoBox(
                    title: 'Tarif',
                    amount: 'Bolalar uchun',
                    action: '29 sen, ~11.5K',
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Ommabop - Internet paketlar
              Text(
                'Ommabop',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    IconBox(icon: Icons.language, label: 'Internet-paketlar'),
                    IconBox(
                        icon: Icons.account_balance_wallet,
                        label: 'Mening xarajatlarim'),
                    IconBox(icon: Icons.star, label: 'Tariflar'),
                    IconBox(icon: Icons.group, label: 'BeeClub'),
                    IconBox(
                        icon: Icons.shopping_cart, label: 'Barcha xizmatlar'),
                    IconBox(icon: Icons.card_giftcard, label: 'BeeFortuna'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String title;
  final String amount;
  final String action;

  InfoBox(
      {super.key,
      required this.title,
      required this.amount,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.black54)),
          SizedBox(height: 5),
          Text(
            amount,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(action, style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}

class IconBox extends StatelessWidget {
  final IconData icon;
  final String label;

  IconBox({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.yellow[700]),
            onPressed: () {},
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.black87)),
      ],
    );
  }
}

class PhoneNumberSheet extends StatelessWidget {
  const PhoneNumberSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SettingsPage(),
            ));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                padding: EdgeInsets.all(3.0), // Ko'k border
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 3),
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "data:image/jpeg;base64,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"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Text chapga yo'nalgan bo'lishi uchun
                children: [
                  Text(
                    'Muhammad Rizo',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(
                    "90 566-57-50",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
                  ),
                ],
              ),
              SizedBox(width: 5),
              Icon(Icons.check, color: Colors.green),
              SizedBox(width: 20),
              Container(
                height: 35,
                width: 125,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    "12 567 so'm",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RaqamQoshishPage(),
                    )); // Qo'shish tugmasi bosilganda
              },
              child: Center(
                  child: Text(
                'Qo\'shish',
                style: TextStyle(fontSize: 30),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class RaqamQoshishPage extends StatelessWidget {
  final TextEditingController _phoneController =
      TextEditingController(text: '+998');

  RaqamQoshishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Raqam qo\'shish'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Telefon raqami uchun TextField
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(13), // Maksimal uzunlik
                FilteringTextInputFormatter.allow(
                    RegExp(r'^[+0-9]*$')), // "+" va raqamlarga ruxsat berish
              ],
            ),
            SizedBox(height: 480),
            // "Kirish" tugmasi
            ElevatedButton(
              onPressed: () {
                // Beeline sahifasiga o'tish (shartli ravishda)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyApp()), // To'g'ri sahifani kiriting
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Tugma rangi
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              ),
              child: Text(
                'Kirish',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            // "Parol orqali kirish" havolasi
            TextButton(
              onPressed: () {
                // Parol orqali kirish sahifasiga o'tish
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ParolKirishPage()), // To'g'ri sahifani kiriting
                );
              },
              child: Text(
                'Parol orqali kirish',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String selectedLanguage = 'O\'zbek tili';
  String phoneNumber = '90 566-57-50';

  // Bu yerda til sozlamalarini yangilaymiz
  void changeLanguage(String lang) {
    setState(() {
      selectedLanguage = lang;
    });
  }

  // Tungi rejimni o'zgartirish
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sozlamalar'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Avatar va ism, raqam
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Avatar bosilganda rasmni kattalashtirish
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Image.network(
                                'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEhUSEhMVFhUVFxUYFxgVFRcVFRYVFRcXGBUYFRUYHSggGBolGxUXITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGxAQGy0lICYtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAOEA4QMBEQACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAQIEBQYDBwj/xABGEAABAwIEAwUFBQQIBAcAAAABAAIDBBEFEiExBkFREyJhcZEHMlKBoRRCYrHBI3LR8BUWMzSCkqLhF1NzgwglVGSTssL/xAAaAQEAAwEBAQAAAAAAAAAAAAAAAQIDBAUG/8QANhEAAgIBAwIEBAYCAQMFAAAAAAECEQMSITEEQRMiUfAUYXGxMoGRocHRBeFCI4LxMzRSYnL/2gAMAwEAAhEDEQA/APblBYjYniMVPG6aeRscbPec42AvoB4knQAaklSQeR8Xe2ewLKFoa4+6+RuZ3mGbD538gujwYxXme5zeNJy8q29TzDG+Ka+YH7RVzvzDVudzIz/22Wbz6JKCgtyYZJTexmJIza/VYuPc1UrYUzAXNDjYEi56BIpNqxNtRbXJsnYhS0rA2Cznu5jX1K9bx8OGOnFyzxvh8/USvNwhlDUvf3zIb32vomOUpb2TPDCPlo3XD9dIADm05r1IRU4bnh5pPFmajsamlxBxzZSLAjn1WE8MVVnVjzSd0WcWItDcz7AdeS5pYXdI6o50o6pFjluLrnumdFWgyJYoQsSxRGrqcuYQ33tx5haY5pSV8GWWDlF1yQ6UBzMp0I3HMFbTdSsxhvGiBHUOheWP90m7XcrHkfFbuCyR1R5OeM5YpaZ8dmXDHAi65GmnR2JpqzO4lVMcxwIvqQvQxY5Jo8zPli4tGPlPw9V0tmMfmT8GxHsnjN7p0KpkjqjRaD0S1I0U2JNLw1hBv0WMcT0ts1nnWpKJZMbcXXO3R1pXuNdEpUiHEVk8jPde5tujiB6KHjhLmK/QlZcsd1J/qcYPaC+F+WXLLHzIs2QDnbk7y081hn/xuNq4On6djfpv8vkuprUvVc/19jcYJjdPWR9rTyNe29jY6tdza9u7TqvFlFxdM+ghNSVosFUuCAjYlXx08T55nBscbS57jyaN9OZ8OaEHyz7QeN6jFZ7m7IGE9jEDoPxP5F5HPlsPGyi2VbXczcEL840N+V1rGEtSMpyjpZdtJlmaKhuVrRpYWBPmupXKa1o5XUYeR7ldW0wfKRGLNvZYzhqn5TbHJqHmOgwUcyr/AA6HjsdhuFkSa6gD6lMWCpEZM1xLukgyE3/my7YKtzim20WmHYhbug6c12Ys9Ojzc/Sak5GswQ5yIx94gkrpyNKOo87FGUpaOxu4sJY6Ps3Duiw9F48uokp6lye7HpoOGhrYsBHYADkue7Z06aQgapsrQZEsmhjmqyZWirxWnLf2jdDsf0XTgmn5WcufHXnRmK7GGOIY8HKdCehXoQwuG6PNnnWTytbdy1pHEsAvpa11hOlKzpxtuCM9jlO5lwL2ufUrsxz1RPPyYXCfyM+8HKCFL4s0TWqmcGyO103CpqZo4xJfDj7ytLj7rh6KFbTGWoyjXqemsy2BB0Xnu7PQSTWxwdOy+XMLq+mVXRRzhdWK+MImHEyXGOER9iS0Wcf4LVt5ItMwio4ckWvU8+4Z4gqMLqBMARycPuyM3yvH5HcLx5xSVZF+Z78Jt743+R9L8MY9DXU0dVCe5INj7zHDRzHeIOn15rifJ3otFBJ4d/4heJnF0eHRHQASz25k/wBkw+Qu63i3opSZVsouHqOidh3aHSRo101zDf6r1cOh4uDyM7ksr3M7gdY1spfKy9hZoAvqs8c/NbRplh5aTJGO9pdsk4DGOPdaN/C/yU5G1vIjEr2iVlIWFxe3b+KpBpu0bNNKmWUDc2q6I7mT2G5LOvy5pVEXY5tSHaBSsllXAk0bLOC1T3M5x8tGy4YD5KmMM2ba/TbVdWafkd8HkYMX/VVcnrJavEs9+jkXa2VirYWSxREGK0+Yx9vFnbu3tG5hoHatvfYg/NRe9E1tZJje1wu0hw8DcfRTwVVPgbPAHNLTsVaM9LsiUdSo8+xTCS10jXNsSbsPInUr28eVTimjwMmDw5u19CZwnXtdHldplNvJY9RFt2jp6SWlaZcFhxDh94nuGoy38rDdZdPm8yTNeqwXFtHnTY32vbTdd6TPPbjY4tu23gnYrdSsgwyujceqzTcTplGOREmfimUNLbkW2t4LCWXfg1h0zaqyJWcSh3ZAkg3GZ3OyxydQ9kb4+iW7LvH+MmNpg2J+Z9gN9SVXJ1EIpuPJbH00p1GXHcdh9TMykz1NnDcjbx0W2Kco49U+TnzYlLJphwY3FnNqtI3WYOq48zWbhnodPF9Ps1ZpvYbxAaStNE94MNTfL+Gdou0g/iaC3xOXovMyQ09z18c9S4PoVZmp8s8WwyVNfWTvBaHSyZCRvG3ux/6GtXVDE63OTJlV7ECl4gcIWU8cYvmAP4iTy81aOZqKikZywJy1NnonDPCchu98YLiL35Bdkaj+I4pNv8J51x1M51U6IuvkNgOQuNlxdRK50d3TR0w1CYfh0kbLPbo4XH6LTFjcVuRkyKT2LSnAa23XmuqCpHPNnKoYDtzVmrKRdM4RR5LgDXfzKzSo1u+TvEdNVdGbPSvZnM29zYHW/kBqVbLJvFRhjxqOWyFxj7S6XM5rSZom6NjjkMfayAm7pHt7wjBFg3TN3jqMt/O1qJ6PhSl8jy2r4qqHyOkaWQh+mSJuRgbb4QNSfi97xCq80jWPTwS4O7+OqwNEccr2sFrgSSODsu3vkloPhY6qHmfYLp49ylxfFX1Evav97QA87Da7uZ8VSc3J2zSGNQVIe7H6o2H2iazRYDtHWFugv9U8SXqSscF2N/wZ7W54WNgqWGfWzZC8h4bro7Q5uVleOXszGeBco9Tp8YpsQpc8TtXNJDTYSMeOVr7g9F14JuM00cHU404NMz0tC6le149x/df0BtdetHJHLaR40sUsLT7E81/aR9g03c42HhGdST8tFn4emWt+2aPM5w8OPL+xX41hwjs5vuCzSP19Vthy6tmYdTg001wZ6R7Qf59Fs5HMotqyK+Rgvff8lnKaXJvDHOXBmcXks/um45rzcs3ex7eGHl3IUJD326a+aw1apUbuLith1dVxdsx7GWLPe6XWeScXNNLg0xwloafcum8YCQiN7CW6AAa3+S1+Lt6Wc76NpaiixeNzXOf2T2MO3QrHLe7rY6cWl0r3KegrjDNHMz3o5GSN82ODh+S4mzuSo+tf660X/OZ6hVs00S9DxfE8UZVQtkZYEDUDyXpa9Ss8nQ0zE0EgZPdsRJZIDoOS5099kdMlceT1+bjZ7actbE5pcLNJHMrobT3ZybpUeaYlwnI6I1DnF8rjmIHjrqsZYrV3udEM2ml2OFBjzxG+J7cxA0J5JDLJbMSxpu0R8PxEuacwtY2CvjzN8iWJLglNmzahbKdmbhR0YNL9VdFXRxjdYF17qLJaGv4gdBFJHH70wsTyawnXzLtR5Fc+XK47LuaYsKb1PsZRz7/n8zvquOztGqCRFABACAVSC0wnHJac3jIB0IdYZmkaAg9QNr3+pBvHI0ZyxqXJ7XwfxDDX00l3x/aJTmdBm1bkY1l2g2JzZM5Ots9uS7+my+dOzzOrwVBqiVwzQubNLnBB2F9wBbT6r0M81ptHldLjeppqi6xZrXRuj30N/OyxxXeo6s8U4uJ5wAQTmB8D49PQrvvc8lx8o7EZGtZcts4aHTcaarLLJJHT08W5ehkp3t7x9FxydI9SJUUlQ1jjnB12K4FLTLc7pQ1rYjyyXLrHfqqOVmkY0Ng7jmvadQQfRVSp2iz3TTNQcXqK4GERtIA1tqT/AAXT4ssmxxvHHE7srJeEqi5Aidosn00uyNV1ce7Of9BVX/KPqFX4eXoa/Fr1ZNocRdT0rojEc7ybOI0A8/JVjJxjQklKVmg9lNVAx8r6pzGsuLF1hrz1KtjnV2VyxVovsRxOlqpZmwzNDWAAAEWv4HmNforqaexloaOkMApqI5CZZXA2HiengrXS2Irfc85OPsb78Q7QE3Hj+ix8U38JshT1Yc4ZW2J3A5IpWTpomRjKAfFdEdjKTJxOmZdETnkio1F+h/2XK9jpVMqq19/qubI7OmCohrM0BQAQAgFUgRAKgJ+DVnYydoC5r2i8bmGzmyAgtI+osdLFWg6ZSatUe18A8XfaXlsxb2ro2uzN0DtLPBbyc1zbfML0YZHKKieZlwqEnJGnxalkc0mMAn8wtlOtjnljszNJTCUljrNcw3t4rSOd3TMpdMmtiix+rcZDTtbckb26Kkst7GuPFp3MpXU5j0cNVWXBpFblW2jfKCQ24Gq45RcjsjJRI4b91zduaqo+pZy7ohhpJsOWyxfJutlZ7J7IcFywGR47ziTYjUcguzAnGO5wZ2pz+hssUEg0jYD42WykzBx34M1/R1T8IUXItRkqGvpqlxMzmi+gYN9lwakz0NJq+HsEoaigmiLAMrnjXQgjUHqOSWmqIrueHSHs3ODSdCR5gFY8HRytz1X2V8SUpvHUva0iwbmNsw6XO61hkMZQOnGnCdJPU9oyQRBw5W7x8AeaNJsiLa4PNK+nEL3RMkzZXGzhufNVutkaXe7JNMSQA43I5fNdEHaMZ7Fsx9m68l0KWxhKJUV9VmJA2A+oXPklbN8caRUPYSsnFs3UkibhnDlVUawwPeObg2zB5vPdHzKhYZMh5oR5ZZs4ImteSalj8HVDHH0jzLZdK+7MX1mM6Dgl3/q6Q+Urv1Yp+E+ZV9bAP6l/+8pP/kk/WNPhV6kfGx9Bf6hzH3Z6R3lUMH0NlHw3o/2J+Nxrlg72f1f3TA792pg/Ivuo+Fl7sqv8hibqyLV8EV8epppCOrG9o31ZcKj6eRtHqoS4ZRy0zmGzgQRyIIPoVR45R5Rspp8Gm9nUjhWxgG2a7T1yjvEDzIHqt8P4jn6itJ9HRFrGXdsAtJStmEYqjxLifiRrK8ywnuhpabbE3UOW9kqCorqviJ0kolj0cOvS3NXi7KSjRCrq8ynM46n0Wl7blaIDqx7T3HWvv4rnk3exvCKa3OL6jukgXtvopc9rCg9VFUKg5g7oVxOTuzt0qqPScH9p/ZRNjEWo3N7BdCz7HK+nG13tamNw2IeZd/BQ87JXT+rIH/E2p+EKPGkT8Oit4kwttHIySEkvub6XHgsDdehCp+J5mslZdwMh1sbfRLGhFIIy4+KgsNcwhCS6wo1FZMyMyE22zHQBSirXocMXpHQyyMcQXA2uNreCsVRwjc5gBF7n9FKbiQ0myzoqsubqfNdGOdoynGiFKwlxHjdVptlrpGqwiiggp3VlQwSBruziiN8r5AA57pLbtaHN7vMk30Fj2Rikr7I4JZJSkox5fuzPY3xRU1Js+Q5R7rG2axo6NY2wA8guPJnd+XY7cfSwSt7v5lMZXdT6rDWzo0r0DtT1TWxoQdqeqa2NKFE7upU62R4cToKx/wAR9VbxJepR4YehKpsbnjN2SvafBxVlnmu5nLpMUv8Aii9puN5XgMq2sqY/hmbmI/df7zT4ggrfH1C4kvf2f52YS6Rx3xya/de/o0WlLQ08T6evpi4QOkyPY85jDKQS0ZvvMdY2vqMut1o4JVKPDKxySmnCf4o+7Npx/wARFkIdHIO8LWG505LCbo1irPG3YjdxLgqLLRt4QtJWNuepV8eVWUniZYtFyD01W0tzBJpkLE58z7htrLnm3Z0wSohtqiHeHNZqbTL6E0catgBu3Yqk1vaLwd8nBULkuKcNZtcqyZRq2N+1/hCWTpPpjFuAhNFkLhYak21JWRfSfP1TgTn10tNFdzg8tHy625BWvYg1GB8CvjMvbNzOA0ttc+HVV1E6WZeuwOWIuErXZRrmsba9SpsrRacK0kMo7ryyRovmByn1RsmrKavZ33EnNY2JOpuuhcGD5K6WpIdceSzk9zSK2GU8xBv13+aRdMSVlixpuOrnD6uXStjBqzTcYnJR0cQ2LZZD5vkdb/SGrry7Yvq/sv8AZxdMn4zvsl+9/wBGEcvMZ6qGWVSwWQCoQIhIoUkAgOkI1CcDnY2nBRMtLXU25MRlYPxw/tBbx/Z2/wARXoYXqwv5NfvsebnWjqYS/wDknF/f+yorKwytaTyHVUa1KzReWVFRNDdc8oHTGZybHzVKLtlpTS902OwXRF2jmlGmRnS3NyNVRv1NKo5yRAHbdVaLKVnMkbW0VSx1NDfYq3hXwV8WuSE9tjZYtU6NU7HdmoJPtkrOy55rwnw/GMWxCVoGjmDbYuaHOt6qt2SlTZrDhDGl7nn3j5KOCyRRtlY4Sxua3ICW3I3CjUTpPFOMuHXUtSXQP7jwT3dMvUaLbH5tjGa0mccdJRzuHfLZ1vouj1RjzRBmfmOgtb1PiVm3ZdKhYW6gdVMSJcFhQy5i09Hj9T+i1i7M5Rov/aDJb7KzpS05/wA0bXfquvqNsUV9fvX8HF0avJN/NfZP+TH05bmGe+W+uW2a3hdcEHHUtXHc9GerS9PJv+L+E6Pso6igzCMtYHB7s2YuBLZLnbNZ7SNLOicPPrXTKUduffv8zi+KnF1JbGLZhbybLNdLkbqjZ9VBKy94s4RZRQwPM4MskbXuhcLPFzYltuV9LHXQ9Ey4IxT33X7/AEIxdRKcqcdvt9TJLlOs2PDXBkVZTvlbWMbK0f2JZsSQGZ3l2jSTbNlsDa5A1XTjwKSu/wDRyZOpcJadP+zN1WGSxuLXNILSQQRqCNCD0KmXSZI9jSOeEu5N4awjtqmKN+drHOAc5gGYA6XF9N7KcfS5JPjYrm6iOON3uarhagNDjP2V7g4XDC4bOZI1rgbeLXBbYKUpxXFP9tzj6pueKGTvqX7un9zJSsMZMZ3Y5zD5tJH6LNyS2R0tW7OQcFS0Wo5HUkC3z0VHuXRygYc5DeSpFPVSLTfl3LFsF9/ouhQswcvQdJTX8FZ47KLI0c66mAAA0sB/PmqZIUqRrjm29yMJnMaQ0Bt/VZ63FUjTTGTtkArnNh2UoD7WL1jZtR5twTjjP6VxGF7gHGRjm67gMa3T0VeKZarbR6HLLGRqRZTaCi0R3GBzSO4R8lFonTI+f+JsPLq6VtPICwusG32NhcBXxS0mc8ep7GVxvCHxF99xy8/5K6mu6OZejEw3BnPsezd6FQkiW32OWKxZHWy2OvyGwVnS4Kq3yVsERJyg2U4sbm9JM5qKs0/tONqzs+UcUTP8jcv6Lbq3WlfK/wBW2cnQbqcv/s/2SRkoxcgDdckVbpHc6SPR+BKttjQ1Th2c92suRdkj7aC+2ZzWEdHsYdi6/rRi8cU+67e/dX8jzsk1N7Is6HhllC51TXuFonERRDeV49w68tnAHkQXaWD7yyKW0P19Pf8A4+Wf1RiOKppqqd9RIRd3K+jWjRrW35AafU6krHqOldWnsdGDPFKiiipi4kXAt1XFjw6pVZ1SyKKsucOfJSvZKxwDm9RdrgdHNcPvNIuCDuCV6KwrFHk5HkWR1RteIKRlTA3EKc6WAmaSXFpFgHG+ugLQSdwWO3Lrb45/8X+Xz9/69Dmknw1v79+3XPh+j+zR/wBI1jiyJv8AYMGj3uI7rw07u3yDr3z3W64580lavb37/Y0x409orf1MjhuMPmxNtS6wc+W9hs0HRrR4NFgPJcfSSvqFfc166CXSyS7L7HLjEZK+saNhUz28u0db6Lnns698HVFJpFMJFWyziEmqh7hEnCh37HmPy1WmH8RTN+EsDMcwa0DzPILpc3dI51FVbO99d9ui0sy0nKpJ1NueipNujSCKWWckm64ZSs7IxSRHVC4t0B61xF7YZnyuFNYRAEAuBzE9R0WSx3ybvNT8p5l/SchldMXuzvJJcCQST4haaVVGOp3ZNm4mqnAN7eWw/GVGiPoNcvUjDF5wNJpBpbR7rel1OiPoNT9ThTVj43B7XEOBve/PxUtJkJtMv5MUdNlkkO4Oa3Ubrpg/KjCd6my0ix6WFndLbkaafJTLEqsiGaV0UeOvLwHONzzsqOOxo5HGgonPALd9fQHquzpcTlTicefMoNqRc+0+mvWzyXHvnTna5snV4rhGd/8AGP2M/wDH5PxQr/lL7syFPIWm4XDjbUriejNKSpnqOC4PFSQxVWINAffNBBb9s873k6AGx1Gml/hd68JuUVCK39fT379Ty5pxk2nt6diw4uqjiVKys2fAckzBqGtJuxwvrY3HmS74VbHiWOTx9nuv69/yUctXm7nmtVKXm2lhoNB9TuVz5ZOTo6ccVBEGB93OHX9FzQdzaOma8qLKmdpblsb9OS7sNyVHJkW9nqHCbWYfF9ordGSizYA0F7x8bweQa46aaOIPvBpnNJ5Voh27mEUoS1S/Qy3tZjnMzZi/tKeVt4C3WNrSAXNHVx0OY6kEX1BDePI6hS/P37/l9uGjEYF/eYf+qz/7BY9L/wCvD6ov1n/t8n/5f2LT2hD/AMxqv+qfUgXWWTn36GmL8CM2sjY6Bu3irpFWWlG0sGbmdidgF0Y1pVnPN26OEtU3qfHxVXkRdY2T6Z1rHTUfRawaMZpnVzhbXdaOSKJUUNbFldbrr6rgyRqR2wlaI6oXBAOupIECEioQIgFQHWCpc3QbdDspUmiHFMnmYaSEHKQRa+x029FspV5jJxb8qGRym9ye6bk+G5Uwe+/BWa2ruaHAQ192gi1nD1H+69fonGWyPJ63VCm16Ej2lYe50zZwPfijc4fiLAXehJC5er6aWhSXa1+jN/8AH9TDVKHzv9Un97Ins0komVJlq5GsdG0uiEgPZmQWy3cL2I1seRynWy4sOhJtvf8Ajv8An8ju6h5OIrb+f6fr2IOL8TSVErpX6udzPIDZrR91o6BdPxijtBUjNdLt5mX3s9xw/aWwPGZlT+xc3kS7RhsPE5Sfhe5X+J1rflb+/fNGcsKjbRzx/hz7HJKJXABjnBmoJdzbmA2OUi/iuuGOGjxpPbsczzuWTwop33+RjKKRrZWl3u5hfrl2P0XkYckYZlJ8X+x62WMpY2lzR6bgWF0kTn1j5GSRQxiZsVwXucDlbdp3AfYbWuW30uvV6jTD8D2keN0+XJkuM401sZHGeJJqiZ00huTsPutbya2/IX+epOpJXH8Vp2jwd3w6fJr+D6+CtpZ8OqHta3s3yxOebdlI3UFpPLM7bxcPvFTkyQyJSXPDXqjOEZ4pb8ev8f0YDhelL62njbYkys21Ghv+i5sHlzL5P7HR1rvpp/NV+uyHcZ1Akr6t4Nwaia37okcG/QBYzds6caqKKVULkqkqg0Wc3MNx4LTHk07NGc4N8M7zYgXaAADx/gtJZr4RmsNbsiueT90HyCyts1pLuTsO0drp+XktcSp7mWTdbEmtkA1Pmf56rbI0tzKCbKapmzuvt/suKUtTs64qlRyUFgQAgAIBUIBACACgO7apwYWX7p+nl0VlJpUV0q7O1ExjgQ54bvv0WuKMZbSdGWVyjvFWXGB1LGSOa0ki4IPXQAn1C9DopwhkajwcPW4pzxpvk2/E7BNSRSjXJdjrf5m39bf4SvSyJXJf938M8bpG4SX6fyvueRvOpXy75PrlwICoB1hqHMcHMcWuBuC0kEEbEEagqyZGlEmDPO8MJe8k6AXe4uJ5DckldGNvI1GT2M2ljTaRcYnwZVU7c8sMgZ1DSQCdgbbFbvpIcqV/QxXUt7VX1M9nI06Licmtjpq9xudUsnSNJUE0a72asDKiSrcO7RwyTf42tIjHzOi3wKrk/T7/AOrOTrPNox+r/Zb/AHoykhubnfn581lJ27Z1IZZVJCyAe1hKmiLJdGy13HW3IbX8VrDbcznvsTI6kOJIba2pJWymmYuDWxV1NQXnXbouac3I6YQUTiqFgsgEQAoJBACEAhIqECISKhAKQaTh6jLHXdrpbyvyXrdDhcZWzyuuzKcaRrOH8bbLLJRZSHSNOQuAy9pE1zmDLvqC8D95dcuuj4umt1tfyfy/RnBL/Hz8LxLtc0udvn+xg67A6iNrZJIyBJnsdDcte5jttu8xy8aXT5E3a+p7sOpxOkn2tfQr6inexxY9rmuabFrgWuB6EHULno3tDQwqyiyLRc4Uamj7KujAaBIWscbEF7MriC297ahaxuC1eu3v9DGUo5Ho78lm2SWijirYZQftTJmyMLe4CSWvYWg2e3K5pF7WvtotpOSSnZknGb8OuChxPD5Iy10gIMrGygmxzMk1DgR8/mCFzTi07fc6Mck1S+hXkLM0BrSdhfyUpN8BtLk2eX7Lg4B0kr5bnTX7PAQfQyZD8iuj8ONL13/o4o+fqJS7R2X15fv5GPJXPZ2DSoJFCEEimGbc2AV47lZbFlA3u6Cw5eK6YLY55vcj1zmtbl5n8lTK1FUWxpt2V0sdreK55KjoTs5qpIIAQAhIiAVAIgFQBZAKFJA5ASKeukYbtcfnqD5rbHnnjdxZlPDCaqSOlHiMkc7Khp/aMe14J1GZpBFxzGlrdFXXKUtT5J0RUdK4PbuBcShxCmzujjNTTZj2cYMYja4nK68pLXWs59yd99rntj1EpPd889/t6nlZekWNJwT2439frzXYg0vBjBVmYvneJhIyUSQ9qXNmBaSHxOeLi7SCebOQVpRgpa6X67fvRbHklo0b/wA/s2dpuA3wQSQUwYZJGlssjmvbcHeOJz2W7O3MHvXN+QF4PDJPavT2vaKTeZTW+y5+fv8AcpeJ/Z/XOgpoYmAtijBcGlpvLJd7zoeWa3yVJxxThSmlT+f0N8UpRyuTi918iDJwBiD6GGHsXZmVEx2+4+OHKfK7Heqr4cHHQ5rtvv8AM08Wp61F/t8i/d7N6mWKiZI1p7ASB4c4DMzM0sabG9tHbfFutH8O3UpWlXHf3scqyZoqWmO7be9UvfJ1k9mEMb6h0klMyJ0b8naSaw9oLMcSRbuyFrQb628VivCr8Lb+n6m2vNqTtVzz/RbYVw3Q0kDJ+3jd9ljdndEBZ7CHPOY3OrjnbfmCByAWsp6FoUKT9f3ZypPLO9dtPdL9l+XHB4vxXjjauVpjYY4Yo2RQsJuWxs+IjTMSSTbwHJcGWet2ethxeHDT7so1kbCFQSCAmRzR9nZwOa5OnPotoyhpp8mbjLVaOseIk6OsB+EfoSrRzvuVlhXY4vLDdxcb/n0VZOL3sslJbIiyvubrJu2aJUMUAEJBAIgFCAWyEC2UgEAIBLKAKApqwODVdRK2PaFdIhnenrJYXZ4pHxu01Y4tOhBFyPEA/JQ247oUpbMtIOLJPtcVXKxr3R20aBFmIa4B+gID7uzXtuL2U+PK02Z/DxUXGO1kyr4o7amaXveKlhEQy3AfB7zHOI2cw3YOrS34V0fF+WW27Mvh2pRUeF7omcTY7VRtpJYamZjZKaH3ZHDvRN7J+x3zRlM2R6U48b/3/JGLFFzkpI70nFVc7DpHmqmzsqIW5u0dmyyRzki99rxhRCVw1P3wVnjip1WwnFOJzmqpIXzvLexpQ4vkytJl77nvc42H9pqTsAtHk0ZVfF/zREcMZYG0t6dfeibxhj8LqOGOKZjzHMGzBp1ka0Pe3JmsXRNc+TvEC5f4BTnzxc9S/T367GfS9NKEXjfps/r/AEZ/iHjIzROpYGGOnc4F2Z2aWTKS5oc4WaGg2IaBuNyVz5+qeXk36XooYPMue/zMqCuU7GF0AhKgkRACALIAsgBAIhIIAQCoQCkBdQBLoAQChKA4BXUSLHBXogVSQOYUIY4nQpLgLkjELFmogKgE6XFJHwR07rFkbnuYbd5ue2Zub4bi9upKu5tqimhKTki4wo3w6s/C+md9ZGf/ALK2hL/pv38/4MJK8qKTEMSlnLDK7MY42xtNmgiNl8oNh3rXtc3KxlJye50Rio8EdjCdACfJQouWyJbS5Hmkk+B3oVd4cnoyqyQ9UMLCNCCPMWVHFrkm090IqgEJBAFkAIAQAgEUAFJIlkAqEAgBACAUBWSFjrK6RWxVIBAKhAHRG6JW4CS5+Wirqtk1SOTlRkoaoJBASosQkbC+AOtHI5rniwu4svlu617C50vZWUmlRVwTkpd0FPRl4vcAeK2x4HNXdIzyZlF0WlNlYLNcAeZtqV34lHGqizjyapu2gnqw375JSeZR7iGHV2KmacuOq87Jlc3ud0IKKpDGtvsqaW+CzdDSqEggBQAQCKQCAEAiEggFQgEAoClICgK6RAqkCgKSBbdUoCFwS0KEDidFF2TQsrwST8h5BVkyUcgVQkFJAISIoAIDq6U7dFprfBXSuRvaFRqZOlCFxUNsUKeqgkbdLA8SKykV0i5mnlbyTysUwEd9v4J4bfAcq5EcwjcKri1yE0+BigkEAIAQkEAqlIgcArJEWOa2+2vkrIgcWW3IH1KmgNLwotE0NMhUOQoYSqtlguoA6N1jdSnuQ1aGlQyRFABACkAoAIDszLa53WsdKW5R6r2F7QdFOuJGljS+6pKVlkqG2VSwjwgGqAKpAuZTqoigzFNTFCgg7pyBCFDQBQBEAISPWhUkRwj7x+Q/j1V1Eq5egklUdhZo5AfqdyVDkkSkRiVm5FqGqCQUAEAIAQCoBEAIAQAgBAdBGTyV1CTK6khDGRuocWuSVJMaqkiqQISoAiAEAIAQAgHNcpTIFOqMDVBIICTELZXHmdPlufVarZopLhjJpPzUzkIxOKyLiKACAEAIAQAgBACAEAIAQAgOvbFaeIyuhDS+6hybJSoRwVCQaVIBwUAagBACAEAIAQCqQCgAhB2nNiB8It8+au2QkciqssNUAEAIAQAgBACAEAIAQAgBACAEAqkCgoAIUACgGoAQAgBACAEAqAEAWQmmXXG2GfZa+pg5RyvDef7Mm8f+gtQhlKSgEQAgBACAEAIAQAgBAKFKAKAIgBACAUIAUgVQBCgEQAgBACAEAIAQHWmgdI9rGi7nuDWjqXGwHqUB9Lf8I6P4fyVdJv4rMP8A+Ifhosnjr42nJKBHKRsJGDuE/vN0/wC3462MDxxACAEAIAQAgBACAEAIBQpQAowIoAIAQChAIpAt1AEQAgBACAEAIAQAgPQ/Yjw0avEGzObeKltK48jIP7Jvnm73+AoSj6buoLELHsHhrKeSmnbmjkbY9Qdw5p5OBsQeoQqfJ/G/CU+GVBhmF2m5ikHuyMvoQeRGl28j4EEyQZ5ACAEAIAQAgBACAEAoUoClis4bWRYiqSIoAIAQAgBACAEAIAQAgBACAscAwWetnZT07C+R5+TRzc4/daOZQH1ZwNwrFhtIynj7zvelfaxkkO58hsB0AUF0aFAOQgreIMCp62F0FTGHsPXRzTycxw1a7xCEHg3F/sTrIC59EftMW4aSGzjqC3Rr/Npueikg80r8Omgdlmikid0kY5h08HBARUAIAQAgBACAEAIBVNgRQAQAgBACAEAIBUAiAEAIDrT075HBrGue47NaC4nyA1QG+4U9kOIVZa6Zn2aI7ulFpCPwxb3/AHsqE0e9cHcHUmGxdnTs7zrZ5HaySEfEeQ/CLBQWo0KAEA5CAQAgKDj7+4zfuFHwTD8SPkCTcouBk/ExqkoCAEAIAQAgBACAEAIAQAgBACAEAIAQAgFCErk+nvYz/cmeQVYmuX8RvypKAgBACA//2Q==',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 75,
                          backgroundImage: NetworkImage(
                            'data:image/jpeg;base64,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',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.cloud_upload),
                        onPressed: () {
                          // Avatarni almashtirish uchun
                          print('Rasm tanlash funksiyasi');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text('Muhammad Rizo',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Text(phoneNumber, style: TextStyle(fontSize: 20)),

                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Raqam qo'shish sahifasiga o'tish
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RaqamQoshishPage()),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text('Raqam qo\'shish'),
                ),

                Divider(),
                // Til sozlamalari
                                            Padding(
                                              padding: const EdgeInsets.only(right: 250),
                                              child: Text("Asosiy",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.black45),),
                                            ),

                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Til'),
                  subtitle: Text(selectedLanguage),
                  onTap: () {
                    // Tilni o'zgartirish
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text('O\'zbek tili'),
                              onTap: () {
                                changeLanguage('O\'zbek tili');
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text('Русский язык'),
                              onTap: () {
                                changeLanguage('Русский язык');
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),

                // Tungi rejim
                ListTile(
                  leading: Icon(Icons.nightlight_round),
                  title: Text('Tungi rejim'),
                  subtitle: Text(isDarkMode ? 'Yoqilgan' : 'O\'chirilgan'),
                  onTap: toggleDarkMode,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 150,
                  ),
                  child: Text(
                    "Xavfsizlik",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54),
                  ),
                ),
                // Qo'shimcha xavfsizlik bo'limlari
                ListView(
        children: [
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text('Raqamni boshqarish'),
            trailing: Text('O\'chirish'),
            onTap: () {
              // Navigate to a new page when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ),
              );
            }
          ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('PIN-kod'),
                  trailing: Text('O\'chirish'),
                ),
                ListTile(
                  leading: Icon(Icons.fingerprint),
                  title: Text('Biometriya orqali kirish'),
                  trailing: Text('O\'chirish'),
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Avtorizatsiya uchun parol'),
                  trailing: Text('O\'chirish'),
                ),
                ListTile(
                  leading: Icon(Icons.block),
                  title: Text('Mijozni bloklash'),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    // Ilovadan chiqish
                    print('Ilovadan chiqildi');
                  },
                  child: Text('Ilovadan chiqish'),
                ),
              ],
            ),
              ]
          ),
        ),
      ),
      )
    );
  }
}

class BeelinePage extends StatelessWidget {
  const BeelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beeline'),
      ),
      body: Center(
        child: Text('Beeline sahifasiga kirdingiz!'),
      ),
    );
  }
}

class ParolKirishPage extends StatefulWidget {
  const ParolKirishPage({super.key});

  @override
  State<ParolKirishPage> createState() => _ParolKirishPageState();
}

class _ParolKirishPageState extends State<ParolKirishPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}





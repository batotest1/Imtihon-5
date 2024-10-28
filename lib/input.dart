import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (showLogin) loginForm() else signUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginForm() {
    return Column(
      children: [
        Row(
          children: [
            Text("Hi, Welcome Back! ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
             Text("👋", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.yellow)),
          ],
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.visibility_off),
          ),
          obscureText: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: false, onChanged: (bool? value) {}),
                Text("Remember Me"),
              ],
            ),
            TextButton(onPressed: () {}, child: Text("Forgot Password?")),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              showLogin = false;
            });
          },
          child: Text("Login"),
        ),
        SizedBox(height: 20),
        Text("Or With"),
        SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.facebook),
          label: Text("Login with Facebook"),
        ),
      ],
    );
  }

  Widget signUpForm() {
    return Column(
      children: [
        Text("Connect with your friends today!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: "Enter Your Username",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: "Enter Your Email",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: "Enter Your Phone Number",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: "Enter Your Password",
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.visibility_off),
          ),
          obscureText: true,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              showLogin = true;
            });
          },
          child: Text("Sign Up"),
        ),
        SizedBox(height: 20),
        Text("Or With"),
        SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.facebook),
          label: Text("Signup with Facebook"),
        ),
      ],
    );
  }
}

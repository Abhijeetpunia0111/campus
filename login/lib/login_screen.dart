import 'package:flutter/material.dart';
import 'auth.dart';
import 'post.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double elevation = 0;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 150.0),
                  child: Container(
                    child: Text(
                      "Cam",
                      style: TextStyle(
                        fontSize: 80.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 150.0),
                  child: Container(
                    child: Text(
                      "pus",
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.w100,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: ' abc@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter  password',
                ),
              ),
            ),
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  // Update the elevation when the button is hovered
                  elevation = 0; // Adjust the elevation value as desired
                });
              },
              onExit: (_) {
                setState(() {
                  // Reset the elevation when the button is no longer hovered
                  elevation = 0; // Adjust the elevation value as desired
                });
              },
              child: ElevatedButton(
                onPressed: () {
                  // Button action
                },
                child: Text('Button', style: TextStyle(color: Colors.orange)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[50],
                  elevation: elevation,
                  // Other button styles
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () {
                  String email = _emailController.text.trim();
                  String password = _passwordController.text.trim();
                  Auth.getInstance().login(email, password).then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Post()),
                    );
                  });
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account'),
          ],
        ),
      ),
    );
  }
}

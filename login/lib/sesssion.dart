import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:login/auth.dart';

class Sessions extends StatefulWidget {
  Sessions(Client client);

  @override
  _SessionsState createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                Auth.getInstance().login(email, password);
              },
              child: Text('Log in'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Auth.getInstance().logout();
              },
              child: Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}

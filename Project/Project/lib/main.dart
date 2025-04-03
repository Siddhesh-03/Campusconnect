import 'package:flutter/material.dart';
import 'loginscreen.dart'; // Import login screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(), // Start with login screen
    );
  }
}
import 'package:flutter/material.dart';

class ProfileScreenuser extends StatelessWidget {
  final String userName; // ✅ User Name Passed from Search Screen

  ProfileScreenuser({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName), // ✅ Display the user's name in the AppBar
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          "Welcome to $userName's Profile!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

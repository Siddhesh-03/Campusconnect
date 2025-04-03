import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF875774), // Background color from image
      body: Stack(
        children: [
          // Top left circle
          Positioned(
            top: -50,
            left: -50,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Color(0xFFE5E5E5), // Light grey circle color
            ),
          ),

          // Bottom right circle
          Positioned(
            bottom: -50,
            right: -50,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Color(0xFFE5E5E5),
            ),
          ),

          // Centered logo
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFF5E6EB), // Light pink background
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Campus Connect",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFAF7AC5), // Purple text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}
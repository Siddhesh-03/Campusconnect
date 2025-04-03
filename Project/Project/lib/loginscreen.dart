import 'package:flutter/material.dart';
import 'signupscreen.dart';
import 'forgotpasswordscreen.dart';
import 'homescreenmain.dart'; // Import Home Screen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // ✅ Directly navigate to HomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Log In",
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            // Email Field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                hintText: "Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20),

            // Password Field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                hintText: "Password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20),

            // Log in Button
            ElevatedButton(
              onPressed: _login, // ✅ Directly navigates to HomeScreen
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              ),
              child: Text("Log in", style: TextStyle(color: Colors.black)),
            ),

            // Forgot Password
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                );
              },
              child: Text("Forgot Password?", style: TextStyle(color: Colors.white)),
            ),

            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              ),
              child: Text("Sign up", style: TextStyle(color: Colors.purple)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for user input
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create Account"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text("Name", style: GoogleFonts.poppins(fontSize: 16)),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? "Enter your name" : null,
              ),
              SizedBox(height: 10),

              Text("Email", style: GoogleFonts.poppins(fontSize: 16)),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: (value) =>
                value!.contains("@") ? null : "Enter a valid email",
              ),
              SizedBox(height: 10),

              Text("Mobile Number", style: GoogleFonts.poppins(fontSize: 16)),
              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: (value) =>
                value!.length == 10 ? null : "Enter a valid number",
              ),
              SizedBox(height: 10),

              Text("Date of Birth", style: GoogleFonts.poppins(fontSize: 16)),
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dobController.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    });
                  }
                },
                validator: (value) => value!.isEmpty ? "Select a date" : null,
              ),
              SizedBox(height: 10),

              Text("Password", style: GoogleFonts.poppins(fontSize: 16)),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: (value) =>
                value!.length >= 6 ? null : "Password too short",
              ),
              SizedBox(height: 10),

              Text("Confirm Password", style: GoogleFonts.poppins(fontSize: 16)),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: (value) =>
                value == passwordController.text ? null : "Passwords do not match",
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform Sign-Up logic here
                    print("User Signed Up!");
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Sign Up"),
              ),

              SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to login
                  },
                  child: Text("Already have an account? Log in"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
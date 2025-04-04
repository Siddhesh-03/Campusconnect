import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final String userName;
  final String bio;
  final String resumeUrl;
  final String profileImage;

  const UserProfileScreen({
    required this.userName,
    required this.bio,
    required this.resumeUrl,
    required this.profileImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildProfileHeader(),
              SizedBox(height: 20),
              _buildResumeSection(),
              SizedBox(height: 20),
              _buildSocialLinks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: profileImage.isNotEmpty ? NetworkImage(profileImage) : null,
          child: profileImage.isEmpty ? Icon(Icons.person, size: 50, color: Colors.grey) : null,
        ),
        SizedBox(height: 10),
        Text(
          userName,
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          bio,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildResumeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        onPressed: () {
          // Open resume URL
        },
        icon: Icon(Icons.file_download, color: Colors.white),
        label: Text("View Resume", style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Column(
      children: [
        Text(
          "Social Links",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: Icon(Icons.facebook, color: Colors.blue), onPressed: () {}),
            IconButton(icon: Icon(Icons.link, color: Colors.blue), onPressed: () {}),
            IconButton(icon: Icon(Icons.person, color: Colors.blue), onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'settingsscreen.dart'; // Import the Settings Screen
import 'editprofilescreen.dart'; // Import the Edit Profile Screen

class Profilescreen extends StatelessWidget {
  final Map<String, String> socialLinks = {
    "GitHub": "https://github.com/example",
    "LinkedIn": "https://linkedin.com/in/example",
    "Instagram": "https://instagram.com/example",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8B5D7A),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://example.com/profile_pic.jpg'), // Replace with actual image
            ),
            SizedBox(height: 10),
            Text("Atharva Rasal", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Bio goes here", style: TextStyle(color: Colors.white70, fontSize: 16)),
            SizedBox(height: 10),
            Icon(Icons.insert_drive_file, color: Colors.white, size: 30), // Resume Icon
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: Text("Edit Profile"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(text: "POST"),
                        Tab(text: "SOCIALS"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Posts Tab
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("I attended Google DevFest 2024 in Pune, and what a fantastic event it was..."),
                                    SizedBox(height: 10),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'https://example.com/event_pic.jpg', // Replace with actual image
                                        height: 200,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Socials Tab
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: socialLinks.entries.map((entry) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      leading: Icon(Icons.link, color: Colors.black),
                                      title: Text(entry.key, style: TextStyle(fontWeight: FontWeight.bold)),
                                      subtitle: Text(entry.value, style: TextStyle(color: Colors.blue)),
                                      onTap: () async {
                                        final url = entry.value;
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        }
                                      },
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

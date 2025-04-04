import 'package:flutter/material.dart';
import 'newpostscreen.dart'; // Import NewPostScreen

class EventScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      "title": "Tech Conference 2025",
      "image": "assets/images/techevent.png",
      "description": "Join us for an insightful tech conference!",
    },
    {
      "title": "Sports Meetup",
      "image": "assets/images/sportsevent.png",
      "description": "Get ready for an exciting sports gathering!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF946B86), // Background theme color
      appBar: AppBar(
        title: Text("Events", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF8B5D7A),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return _buildEventCard(events[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPostScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildEventCard(Map<String, String> event) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image with Error Handling
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/sportsevent.png",

                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    color: Colors.grey.shade300,
                    child: Center(
                      child: Icon(Icons.broken_image, color: Colors.red, size: 50),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),

            // Event Title
            Text(
              event["title"]!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),

            // Event Description
            Text(
              event["description"]!,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 10),

            // Like & Register Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.black),
                  onPressed: () {
                    // Like functionality
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    // Register action
                  },
                  child: Text("Register", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

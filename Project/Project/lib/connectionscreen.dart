import 'package:flutter/material.dart';

class PeerConnectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {"name": "Vedant Chaudhari", "image": "assets/user1.jpg", "isConnected": true},
    {"name": "Nidhish Malav", "image": "assets/user2.jpg", "isConnected": false},
    {"name": "Kiran Kadam", "image": "assets/user3.jpg", "isConnected": false},
    {"name": "Pratham", "image": "assets/user4.jpg", "isConnected": false},
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8B5D7A), // Background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Peer Connection", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: users.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7, // Adjust height of cards
          ),
          itemBuilder: (context, index) {
            final user = users[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(user["image"]), // User image
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user["name"],
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: user["isConnected"] ? null : () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: user["isConnected"] ? Colors.black : Colors.white,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          ),
                          child: Text(user["isConnected"] ? "Connected" : "Connect"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
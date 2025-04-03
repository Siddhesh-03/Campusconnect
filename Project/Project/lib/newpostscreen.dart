import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String selectedType = "Event"; // Default selection
  List<String> postTypes = ["Post", "Event", "Job"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8B5D7A), // Background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("New Post", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Type Dropdown
            Text("Type", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedType,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  isExpanded: true,
                  dropdownColor: Colors.pink[100],
                  items: postTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedType = newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),

            // Image Upload Button
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.add, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Content Box
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.pink[200],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 10),

            // Description Input
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("Description", style: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
            SizedBox(height: 20),

            // Post Button (Disabled)
            Center(
              child: ElevatedButton(
                onPressed: null, // Button is disabled initially
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[100],
                  foregroundColor: Colors.black,
                ),
                child: Text("Post"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home, size: 30),
              Icon(Icons.search, size: 30),
              Icon(Icons.calendar_month, size: 30),
              Icon(Icons.notifications, size: 30),
              Icon(Icons.person, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
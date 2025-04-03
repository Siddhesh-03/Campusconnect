import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String selectedFilter = "All";

  final List<Map<String, String>> chatList = [
    {"name": "Vedant Chaudhari", "type": "DM", "imageUrl": "https://example.com/vedant.jpg"},
    {"name": "Siddhesh Hule", "type": "DM", "imageUrl": "https://example.com/siddhesh.jpg"},
    {"name": "Sports Club", "type": "Group", "imageUrl": "https://example.com/sportsclub.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredChats = chatList.where((chat) {
      if (selectedFilter == "All") return true;
      return chat["type"] == selectedFilter;
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xFF8B5D7A),
      appBar: AppBar(
        backgroundColor: Color(0xFF8B5D7A),
        title: Text("Chat"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                hintText: "Search",
                filled: true,
                fillColor: Colors.white38,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
              onChanged: (value) {
                // TODO: Implement search functionality
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["All", "DM", "Group"].map((filter) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedFilter = filter;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedFilter == filter ? Colors.black : Colors.white,
                  foregroundColor: selectedFilter == filter ? Colors.white : Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(filter),
              );
            }).toList(),
          ),
          Divider(color: Colors.black),
          Expanded(
            child: ListView(
              children: filteredChats.map((chat) {
                return ChatTile(name: chat["name"]!, imageUrl: chat["imageUrl"]!);
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateGroupScreen()));
        },
        child: Icon(Icons.group_add, color: Colors.black),
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String imageUrl;

  ChatTile({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      title: Text(name, style: TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () {
        // TODO: Open chat details screen
      },
    );
  }
}

class CreateGroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8B5D7A),
      appBar: AppBar(
        title: Text("Create Group"),
        backgroundColor: Color(0xFF8B5D7A),
      ),
      body: Center(
        child: Text("Group Creation Screen", style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
